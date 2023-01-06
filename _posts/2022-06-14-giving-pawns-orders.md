---
layout: post
title:  "Giving pawns orders"
date:   2022-06-14 14:15:00 +1200
author: Jevon Wright
year:   2022
# truncate_words: 150
---

Over the last week, I've been improving how to give orders and errands to your pawns.
While they'll normally be autonomous, sometimes you might need to help them get
out of a hole. Which they may have dug themselves into.

So, I've added a "move to..." command:

<figure class="video">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/bHwPjh-WuGQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  <figcaption>Giving pawns move commands</figcaption>
</figure>

You can also now cycle through all of the things present on a tile.
Each selection dialog shows you more information, such as
what the thing is made out of, what it's doing, and why:

<figure class="video">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/SG-jQhaWdRk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  <figcaption>You can cycle through the items, elements and pawns in the world</figcaption>
</figure>

And finally, I've spent some time making the pawns a bit smarter.
Before, they were just doing errands somewhat randomly – they would select the nearest
errand, but they wouldn't care if there was somebody closer who could do it.

Now pawns will work together to complete the errands closer to them:

<figure class="video">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/jI8dM9PrYPQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  <figcaption>Pawns are a bit smarter in choosing nearby errands</figcaption>
</figure>

These are all necessary user interface things for any base-builder/survival
game, and I'll be expanding on these mechanics in the future as more features
and gameplay is added! 😊
