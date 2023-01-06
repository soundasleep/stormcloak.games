---
layout: post
title:  "Progress on the element simulation"
date:   2022-01-27 11:01:00 +1300
author: Jevon Wright
year:   2022
truncate_words: 75
---

I've been deep in the weeds of the physics/element simulation, which I think will
be a big part of the game.

Hoping to have a bit more to show off next week, because there's still a few
bugs I'd like to iron out first, but here are two shots of the
simulation in action:

<figure class="video">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/-_dcMFKZEG4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  <figcaption>A tile with lots of water can expand out and flow around somewhat naturally</figcaption>
</figure>

<figure>
  <iframe width="560" height="315" src="https://www.youtube.com/embed/-CDNPkgJ9SU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  <figcaption>You can even create things like "water fountains"</figcaption>
</figure>

I'd like the simulation to be based on a small number of rules, which are each
individually understandable, but combine together in novel and fascinating ways.

In the process I'm having to make all sorts of gameplay/realism balance decisions.
How quickly should water flow? Should an element behave differently at different temperatures
or pressures? How should different elements interact? How should gas pressure work?
At times like these I wish I had a degree in chemistry 😅
