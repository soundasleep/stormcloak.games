---
layout: post
title:  "Working on events and spatial sounds"
date:   2022-05-28 13:15:00 +1200
author: Jevon Wright
truncate_words: 125
---

I've spent most of the last week on budgeting and applications,
but in between the spreadsheets and the writing, I've been working on a framework
for creating in-game events.
I'm planning to use this to help deliver the story and setting for the game world,
to create tutorials, and so on.

At the same time, I've also been revisiting the sound engine.
I'm adapting [gdx-sfx](https://github.com/spookygames/gdx-sfx) that
provides 3D spatial sounds. When you zoom in, nearby sounds
get louder, and when you move the camera, far-away sounds get quieter:

<figure class="video">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/cu6z_UG0kH4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  <figcaption>The volume of playing sounds changes based on zoom and location</figcaption>
</figure>

In the future I'd love to extend this to add some sort of reverb and/or
attenuation, which I'm expecting will make the game sound more real and alive.
This doesn't come built-in to any part of the engine, so it will be a fun little side project 😀
