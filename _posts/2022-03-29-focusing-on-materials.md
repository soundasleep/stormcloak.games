---
layout: post
title:  "Focusing on materials"
date:   2022-03-29 16:45:00 +1300
author: Jevon Wright
---

Over the last week my focus has been on the physical materials that are present in the game.

The first task was to select which elements and materials I actually want to be present.
One day I'd love to support as many materials as possible; but for now, focus is necessary.

I've identified **43 elements and materials** that I'd like the game to support. These
include your standard water, ice, steam, and oxygen, which I've
[already demoed so far](https://www.youtube.com/playlist?list=PLXZvQK02qqc2B4-dXGE2MVMZ1YmAh5jr0);
but I also want to support some slightly more esoteric ones, including molten plastic,
concrete, and super-heated gold. I'd like to use each of these new materials in creative and novel
gameplay mechanics.

I also want each material to be renderable as a tile in the game. Based on my
[earlier engine work](/2022/03/02/liquids-and-tilesets), as of today I've added some initial
textures for ice, rocks, and super-cooled liquid oxygen:

<figure class="image">
  <a href="/assets/screenshots/2022-03-29-ice.png"><img src="/assets/screenshots/2022-03-29-ice.png"></a>
  <figcaption>Added a new texture for ice (I quite like this one)</figcaption>
</figure>

<figure class="image">
  <a href="/assets/screenshots/2022-03-29-rocks.png"><img src="/assets/screenshots/2022-03-29-rocks.png"></a>
  <figcaption>Trying out different types of rocks, going clockwise: granite, basalt, graphite, and coal</figcaption>
</figure>

<figure class="image">
  <a href="/assets/screenshots/2022-03-29-liquid-oxygen.png"><img src="/assets/screenshots/2022-03-29-liquid-oxygen.png"></a>
  <figcaption>A material that's likely to be quite hard to obtain: liquid oxygen (-190°C!)</figcaption>
</figure>

I'd also like the game to be somewhat based on reality, so this has also included
finding out the densities, viscosities, thermal conductivities, heat capacities,
and other attributes, for each material. That way, you'll want to use a material with
low thermal conductivity to insulate your rooms if it's cold (or hot!) outside.

This part of the work has been fascinating and challenging.
I only have a basic understanding of chemistry,
and I am trying to make a game that's _fun_, so I'm sure I've made some wildly incorrect assumptions.
I also can't find comprehensive references for some of these properties
(e.g. what is the thermal conductivity of gaseous gold at 3600°C?) so I've had to
be a bit creative.

Dear reader, if you're confident in chemistry or have access to some chemistry textbooks,
please let me know and we can collaborate! 😅

