---
layout: post
title:  "libgdx and FMOD"
date:   2023-10-25 18:00:00 +1300
author: Jevon Wright
year:   2023 # display on page1
truncate_words: 35
---

(Warning: Technical gamedev post!)

I've been prototyping an integration of [FMOD](https://www.fmod.com/)
(through [lwjgl](https://github.com/LWJGL/lwjgl3/issues/295)) and [libgdx](https://libgdx.com/) over the last day, and it looks
like these are the steps you need to do to get FMOD working in Java:

1. Make sure you include `lwjgl-fmod` 3.3.2+ as a dependency, e.g. in your `build.gradle`'s dependencies for `desktop`, and rebuild with gradle.

```gradle
project(":desktop") {
  apply plugin: "java-library"

  dependencies {
    implementation project(":core")
    // ...
    api "org.lwjgl:lwjgl-fmod:3.3.2"
  }
```

2. Get a copy of `fmod.dll` and `fmodstudio.dll` – these cannot be redistributed.
   It seems the best source for these are from the [FMOD downloads](https://www.fmod.com/download#fmodforunreal)
   under _FMOD for Unreal_ > `FMODStudio/Binaries/Win64/*.dll` for Windows.

3. Put these `.dll`s in the root of your `desktop` project. (There's probably a better place to put these.)

4. You can then use FMOD in your desktop application!

```java
public class MyApplication {

  static {
    // all of this enables super memory debugging mode, that fails early if you're
    // messing up memory allocation/deallocation
    Configuration.DEBUG.set(true);
    Configuration.DEBUG_FUNCTIONS.set(true);
    Configuration.DEBUG_LOADER.set(true);
    Configuration.DEBUG_STACK.set(true);
    Configuration.DEBUG_MEMORY_ALLOCATOR.set(true);
    Configuration.DISABLE_CHECKS.set(false);
    Configuration.DISABLE_FUNCTION_CHECKS.set(false);
  }

  private static void check(int result) {
    if (result != FMOD.FMOD_OK) {
      throw new RuntimeException("unexpected error: " + result);
    }
  }

  public void run() {
    try ( MemoryStack stack = MemoryStack.stackPush() ) {

      int result;

      // create a new FMOD Studio System
      long system;
      {
        PointerBuffer buf = stack.mallocPointer(1);
        result = FMODStudio.FMOD_Studio_System_Create(buf /* out */, FMOD.FMOD_VERSION);
        check(result);

        system = buf.get(0); /* get the location of system */
      }
      System.out.println("system = " + system);

      int maxchannels = 32;
      int studioflags = FMODStudio.FMOD_STUDIO_INIT_NORMAL | FMODStudio.FMOD_STUDIO_INIT_LIVEUPDATE;
      int flags = FMOD.FMOD_INIT_NORMAL;
      result = FMODStudio.FMOD_Studio_System_Initialize(system, maxchannels, studioflags, flags, 0 /* null */);
      check(result);

      // load Banks from files
      System.out.println("loading banks...");
      for (String path : new String[] { "Master.bank", "Master.strings.bank", "Vehicles.bank", "SFX.bank" }) {
        PointerBuffer buf = stack.mallocPointer(1);
        result = FMODStudio.FMOD_Studio_System_LoadBankFile(system, path, FMODStudio.FMOD_STUDIO_LOAD_BANK_NORMAL, buf);
        check(result);
        System.out.println("loaded " + path);
      }

      // select an Event
      long event;
      {
        PointerBuffer buf = stack.mallocPointer(1);
        result = FMODStudio.FMOD_Studio_System_GetEvent(system, "event:/Vehicles/Car Engine", buf);
        check(result);
        event = buf.get(0);
      }

      // create a new Event instance
      long eventInstance;
      {
        PointerBuffer buf = stack.mallocPointer(1);
        result = FMODStudio.FMOD_Studio_EventDescription_CreateInstance(event, buf);
        check(result);
        eventInstance = buf.get(0);
      }

      // start playing the instance of the event
      result = FMODStudio.FMOD_Studio_EventInstance_Start(eventInstance);
      check(result);

      // set a parameter on the instance
      int ignoreseekspeed = 0;
      result = FMODStudio.FMOD_Studio_EventInstance_SetParameterByName(eventInstance, "RPM", 2400, ignoreseekspeed);
      check(result);

      FMOD_3D_ATTRIBUTES attr3d = FMOD_3D_ATTRIBUTES.malloc(stack);
      FMOD_VECTOR v = FMOD_VECTOR.malloc().set(0, 0, 0);
      FMOD_VECTOR vListener = FMOD_VECTOR.malloc().set(0, 0, 0);
      FMOD_VECTOR vVelocity = FMOD_VECTOR.malloc().set(0, 0, 0);

      // Forwards orientation, must be of unit length (1.0) and perpendicular to up.
      FMOD_VECTOR vForward = FMOD_VECTOR.malloc().set(0, 0, -1);
      // Upwards orientation, must be of unit length (1.0) and perpendicular to forward.
      FMOD_VECTOR vUp = FMOD_VECTOR.malloc().set(0, 1, 0);

      float f = 0;

      FMOD_3D_ATTRIBUTES attr3dListener = FMOD_3D_ATTRIBUTES.malloc(stack);

      boolean running = true;
      while (running) {
        // update location of event instance to (x, 0, 0)
        f = (f + 0.1f) % 5;
        v.set(f, 0, 0);
        attr3d.set(v, vVelocity, vForward, vUp);

        result = FMODStudio.FMOD_Studio_EventInstance_Set3DAttributes(eventInstance, attr3d);
        check(result);

        // update location of listener to (0, 0, 0)
        attr3dListener.set(vListener, vVelocity, vForward, vUp);
        int listener = 0;
        FMOD_VECTOR attenuation = null; // no idea what attenuation is
        result = FMODStudio.FMOD_Studio_System_SetListenerAttributes(system, listener, attr3dListener, attenuation);
        check(result);

        // key call, should be called once per render frame
        result = FMODStudio.FMOD_Studio_System_Update(system);
        check(result);

        try {
          Thread.sleep(10);
        } catch (InterruptedException e) {
          e.printStackTrace();
        }
      }

      // "The Studio System is shut down and released by calling Studio::System::release,
      // make sure to call this before your game is exited."
      result = FMODStudio.FMOD_Studio_System_Release(system);
      check(result);
    }

  }

  public static void main(String[] args) {
    new MyApplication().run();
  }

}
```

I haven't yet tested how to correctly build and integrate this into the application,
and how best to distribute an actual playable build to players – so this is still a work in progress.
