---
layout: post
title:  "Multithreaded simulations"
date:   2022-10-01 14:25:00 +1300
author: Jevon Wright
#truncate_words: 100
---

TODO put in an actual date

(Warning: technical gamedev post)

One of the reasons I started making Adaptory is that I wanted to play more games
that had multithreaded simulations. Most simulation games have a loop similar to:

1. Take current game world
2. Apply a bunch of simulations
3. Save the changes
4. Go back to 1

Generally this loop is done on a single thread, meaning the update performance is
limited to the processing power of your CPU. I like
[playing huge game worlds](https://www.reddit.com/r/factorio/comments/bb571i/launched_my_first_rocket_in_017_angels_bobs_60/)
and I'm always frustrated when a game I love starts hitting this limit.

On the other hand, most computers these days have multiple cores – meaning
they can run many processes simultaneously. Making a simulation game multithreaded
is [extremely difficult](https://forums.factorio.com/viewtopic.php?f=5&t=39893&start=60#p238247),
but it is possible, and I want Adaptory to be designed with
multithreading in mind.

Adaptory is a game with multiple simulations all interacting together, such as [the element simulation](/2022/01/27/element-sim):

<figure class="image">
  <a href="/assets/screenshots/2022-10-04-element-simulation.png"><img src="/assets/screenshots/2022-10-04-element-simulation.png"></a>
  <figcaption>The element simulation manages temperatures, state changes, density, fluids, gas expansion, thermal conductivity, and lots more</figcaption>
</figure>

This simulation must be reproducible and fast, and the
rendering thread _also_ needs to be fast. They can't be locked together;
a game running at 15 FPS is not fun to play,
and a simulation running at 60 FPS is unnecessary.
For now, I've settled on the following design (I love a good architecture diagram 😅):

## Adaptory's Design

At a very high level, there are two types of game world – read-only, and read-write.
The UI/render thread can _only_ access the read-only game world.
This design prevents some weird concurrency bugs.

<figure class="image">
  <a href="/assets/screenshots/2022-10-04-render-thread.jpg"><img src="/assets/screenshots/2022-10-04-render-thread.jpg"></a>
  <figcaption>The UI/render thread can only access a read-only game world</figcaption>
</figure>

To execute the simulations, there is an update orchestrator, that clones the
read-only world into a new read-write world; queues, forks, and joins simulations;
and then marks the new read-write world as the read-only world for the next tick.
The UI/render thread then uses _this_ world going forward.
This also prevents _other_ weird concurrency bugs happening the other way.

<figure class="image">
  <a href="/assets/screenshots/2022-10-04-orchestrator.jpg"><img src="/assets/screenshots/2022-10-04-orchestrator.jpg"></a>
  <figcaption>The Update Orchestrator manages and synchronises all the simulations</figcaption>
</figure>

This design is flexible, and allows for a number of different simulation
types, including long-running simulations and asynchronous queries.
Ideally simulations can be broken down into smaller chunks that can run in parallel.
[ForkJoinPool](https://docs.oracle.com/javase/tutorial/essential/concurrency/forkjoin.html) provides
a lot of this infrastructure for free:

<figure class="image">
  <a href="/assets/screenshots/2022-10-04-local-threads.jpg"><img src="/assets/screenshots/2022-10-04-local-threads.jpg"></a>
  <figcaption>Some simulations can be executed against world chunks, allowing for better parallelisation</figcaption>
</figure>

Of course, the devil is in the details, and there are a _lot_ of details...
and I need to verify this actually works in a [shippable game](https://adaptorygame.com).
At the moment, Adaptory is implemented with 14 simulations, including
the element simulation, game event simulation, light level simulation,
accessibility simulations, and others.

## Results

Over the last month or two I have been working on the performance of the simulation,
and along with improving the performance of the element simulation by approximately \~90%,
I've also verified that the multithreaded version of the game is faster than an equivalent
single-threaded one!

<figure class="image">
  <a href="/assets/screenshots/2022-10-04-performance-graph.png"><img src="/assets/screenshots/2022-10-04-performance-graph.png"></a>
  <figcaption>Initial performance results: single-threaded vs multithreaded element simulations, in ms per simulation frame</figcaption>
</figure>

(Once I saw this graph, I immediately started wondering, what's preventing faster frames?
Is it memory bandwidth, CPU performance, something else...?
One of the benefits of using Java is that you're insulated from
the structure of internal memory, but one of the drawbacks is that you're also
insulated from the structure of internal memory...)

I'm confident that this architecture and these concepts are a good starting point.
I still have lots of other optimisation ideas to try out,
and I believe this design is adaptable and testable. I'm really happy with the results
so far and I'm excited to see how far I can push it 😀
