---
layout: post
title:  "New liquid shaders"
date:   2023-02-21 14:45:00 +1300
author: Jevon Wright
year:   2023 # display on page1
#truncate_words: 150
---

Over the last week or two, I have been revisiting the way liquids are rendered in Adaptory.
And I think they look awesome!!

<figure class="video">
  <iframe width="560" height="275" src="https://www.youtube.com/embed/NsOrfY9JdLQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  <figcaption>Comparison of old and new liquid shaders in Adaptory (WIP)</figcaption>
</figure>

I've received a lot of feedback about how the gas and liquids
weren't very clear in Alpha 1 and 2.
I found that the rendering was quite slow on less powerful computers.
And I thought I could make them look a lot better.

I've essentially rebuilt the liquid shaders [from last year](/2022/03/02/liquids-and-tilesets),
using some new rendering techniques I've learned, and
uploading the data using [Uniform Buffer Objects](https://www.khronos.org/opengl/wiki/Uniform_Buffer_Object)
(which [required a bit of extension to libgdx](https://github.com/libgdx/libgdx/issues/7083)).
Rather than doing a tileset-based lookup (which limits the resolution of the result, causing blockiness),
I'm now generating actual polygons that I can then pass
along to the graphics card. I've added little waves and little bubbles and generally
made the liquids feel much nicer.

I've still got a few more tweaks and optimisations to do with these, but they're at a good
state now – next, I'll be applying the same techniques to the way Adaptory renders gases.

These new shaders will be in the next update – Alpha 3 – expected by the end of March.
