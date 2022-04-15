---
layout: post
title:  "Liquid and gas shaders"
date:   2022-02-09 12:46:00 +1300
author: Jevon Wright
truncate_words: 75
---

Being stuck in the weeds continues, with great success! Over the last two weeks I
have focused on the rendering code for the game, to make the game more pleasant to
look at.

Using a concept I'm calling "texture offsets", tiles keep track of their relative
movement, which allows the illusion of gas expanding:

<figure class="video">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/XPT5Bj1fHjw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  <figcaption>High-density gas expands to fill out a volume</figcaption>
</figure>

And even more importantly, I've managed to get liquids looking more... liquidy.

<figure class="video">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/Y_gPGpml_qo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  <figcaption>Liquids (such as water) can be poured and flow around</figcaption>
</figure>

To achieve these effects (at 60fps+) has required me to learn a _lot_ about GLSL
shaders, more than I ever expected. I am indebted to some of the incredible online
resources I've found, such as [Shadertoy](https://www.shadertoy.com/),
[The Book of Shaders](https://thebookofshaders.com/),
[Making Stuff Look Good](https://www.youtube.com/watch?v=xWCZiksqCGA),
this [GLSL quick reference PDF](http://mew.cx/glsl_quickref.pdf),
and [Lygia](https://github.com/patriciogonzalezvivo/lygia) (shader library).
And my new friend [Oisin](https://imois.in/)!

It's still a deep and dark black magic but I've learned a lot.

The rendering is still quite blocky (a tile with 1kg of liquid looks the same
as one with 1000kg), which I think I'll tackle next.
I think doing something simple with static masks will probably work fine, but ideally
I'd love to have something generated on the fly (which would save me having to make
hundreds of mask textures).
