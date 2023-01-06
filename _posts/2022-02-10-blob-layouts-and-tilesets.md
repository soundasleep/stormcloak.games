---
layout: post
title:  "Blob layouts and tilesets"
date:   2022-02-10 10:45:00 +1300
author: Jevon Wright
year:   2022
truncate_words: 75
---

(Warning: technical gamedev post)

I noticed the following tileset layout is quite popular in asset packs:

<figure class="image">
  <a href="https://maaot.itch.io/mossy-cavern"><img src="/assets/blog/7x7-tileset-unaltered.png"></a>
  <figcaption><a href="https://maaot.itch.io/mossy-cavern">Mossy Cavern</a> tileset by Maaot</figcaption>
</figure>

But at first glance I couldn't work out how you could display ostensibly
2<sup>8</sup>-1 different possibilities (since each tile can have eight neighbours)
with only 47 tiles.

And did this match up in any way to the ["blob" tileset](http://www.cr31.co.uk/stagecast/wang/blob.html)
reference, where you reduce each tile to an 8-byte lookup value?
Surely they must be related, as they're both 47 tiles in a 7x7 tileset?

<figure class="image">
  <a href="http://www.cr31.co.uk/stagecast/wang/blob.html"><img src="/assets/blog/blob-tileset.png"></a>
  <figcaption>"Blob" tileset, from <a href="http://www.cr31.co.uk/stagecast/wang/blob.html">cr31.co.uk</a></figcaption>
</figure>

But I think I've worked it out. To go from 255 possibilities to 47, you
ignore corners if there is no edge tile there. i.e.:

1. if top = 0, then top-left = 0, and top-right = 0
2. if left = 0, then top-left = 0, and bottom-left = 0
3. if right = 0, then top-right = 0, and bottom-right = 0
4. if bottom = 0, then bottom-left = 0, and bottom-right = 0

And then you can exhaustively map the remaining 47 tiles to the tileset format
in asset packs:

<figure class="image">
  <a href="/assets/blog/7x7-tileset.png"><img src="/assets/blog/7x7-tileset.png"></a>
  <figcaption>Matching the "Blob" tileset with asset pack tilesets</figcaption>
</figure>

Yet another gamedev mystery solved 🤞
