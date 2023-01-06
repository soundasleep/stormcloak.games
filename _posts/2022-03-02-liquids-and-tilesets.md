---
layout: post
title:  "Cleaning up liquids and tilesets"
date:   2022-03-02 11:20:00 +1300
author: Jevon Wright
year:   2022
---

It's been a long time since my last post where I wrote about the first
[liquid and gas shaders](/2022/02/09/liquid-and-gas-shaders) in the game.
Since then, I have been deep in the weeds with two deeply interwined challenges,
so it's been difficult to write about them separately!

The first challenge I tackled was having **variable liquid levels**; a tile of 1000kg of water
shouldn't look the same as 1kg of water.

For now, I've implemented this with a fairly basic tileset. It's better, but I'd like to
revisit it at some point in the future. I have an idea of doing something with
[Bezier splines](https://www.shadertoy.com/view/MtfSRN) (whatever the heck those are).

[![A tileset-based variable-height liquid (magma)](/assets/screenshots/2022-03-02-magma.png)](/assets/screenshots/2022-03-02-magma.png)

Along the way I also rewrote how different elements get their colours and textures –
the result being that everything looks much brighter and cleaner now!

The second challenge I tackled was **tilesets**; while
I had a basic tileset working [based on autotiles](/2022/02/10/blob-layouts-and-tilesets),
this solution meant that I'd have to have a separate shader pass for _every_ element in the game.
Every additional shader pass means more textures and data to pass in, and this was
making the game too slow. Especially since I'd like the game to have dozens of elements in the future.

Normally it's best to wait until later down the track to optimise performance, but in this
case I knew that whatever solution I'd settle on would have significant repercussions
on how I'd create art, how I'd implement light levels, and other gameplay mechanics.
I needed to jump into the deep end and come up with a solution.

And I'm happy! I've designed a pretty good solution that takes "similar" elements that all share
a single normal/lighting texture, and render them all together in a single shader pass.
I still have multiple shader passes (one for each grouping) as they overlay on top
of each other, but it's now limited to just a few.

[![Multiple tilesets all working together as a happy family](/assets/screenshots/2022-03-02-tilesets.png)](/assets/screenshots/2022-03-02-tilesets.png)

To get _this_ working well, however, I had to come up with a new approach to rendering the textures
of transition tiles.
Take for example, this situation, which shows the source data, and how I'd like it to render:

[![Input data and what I'd like to see](/assets/screenshots/2022-03-02-tileset-input.png)](/assets/screenshots/2022-03-02-tileset-input.png)

My solution involves breaking each tile into 2x2 "subtiles", and then each subtile has a horizontal or
vertical edge, turning each tile into a set of virtual triangles. I can then instruct the shader which texture to render
on which triangle. Combined with an autotile-based tileset selector, I've got the result I'm looking for!

[![Triangle-based texture selection and masking solution](/assets/screenshots/2022-03-02-tileset-result.png)](/assets/screenshots/2022-03-02-tileset-result.png)

(An aside – are these technical gamedev posts interesting? Useful? Boring? Please [let me know!](/about))
