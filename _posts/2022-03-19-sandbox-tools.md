---
layout: post
title:  "Sandbox tools and a debug console"
date:   2022-03-19 15:20:00 +1300
author: Jevon Wright
---

I've continued to [focus on user interfaces](/2022/03/11/more-user-interfaces) for the
last week, and I'm happy with where it's at now. I've finished a lot of things that should form
a stable foundation for all my work going forward:

### 👍 Debug console

There's now a debug console, which you can access with the tilde key `~`:

<figure class="image">
  <a href="/assets/screenshots/2022-19-03.png"><img src="/assets/screenshots/2022-19-03.png"></a>
  <figcaption>There's now a debug console</figcaption>
</figure>

(Internally the console is using [Groovy](https://groovy-lang.org/),
which means the console has access to all sorts of amazing features. You can even do math with it.)

### 👍 Better sandbox tools

To make sure the UI code is stable and resilient, I rewrote the internal sandbox tools to
the new UI code. The sandbox tools are currently accessible through `F10` (or by
typing in `sandbox` into the debug console, although this will probably need to be hidden
behind a cheat code eventually):

<figure class="video">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/unmWHiPmelg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  <figcaption>New sandbox tools in action</figcaption>
</figure>

### 👍 Faster UI hotreloading code

For dev environments, I not only got the hotreloading in dev mode to work more reliably, but
it's also now significantly faster (almost immediate). The hotreloading code picks
up changes to essentially everything: textures, shaders, colours, properties, configuration, and more.

### What's next?

I'm keen to switch back into game design and gameplay mode next.
Doing this foundational work is important, but it is a grind, and as an ex-frontend and design systems
developer, it is too easy to get distracted trying to make frameworks 😅.
