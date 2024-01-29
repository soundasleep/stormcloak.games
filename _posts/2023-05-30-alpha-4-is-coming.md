---
layout: post
title:  "Alpha 4 is coming"
date:   2023-05-30 10:50:00 +1300
author: Jevon Wright
year:   2023 # display on page1
#truncate_words: 50
---

It's been quite a while since the [last blog post](/2023/04/25/released-0-5-1),
because I've been deep in the weeds with data structures and modelling.

During our [demo at Armageddon Expo WLG](https://mastodon.gamedev.place/@stormcloak/110222399681606942)
I found that the game would start to slow down after about 15-60 minutes of gameplay.
Upon further investigation it was due to certain algorithms and [the way data](/2022/10/04/multithreaded-simulations)
(in particular, items and errands) was being stored and modified every tick.
I want the game to support big worlds and huge bases, so this had to be fixed!

The good news is that the majority of the architecture and implementation has
been completed, and it's looking fantastic – this will be the final data architecture for 1.0,
and it will support [all of the gameplay mechanics](https://adaptorygame.com/roadmap)
we're going to add for the Early Access release.
Java and its HotSpot VM are incredibly powerful. I can write up more about the
techniques and results in future blog posts if you're interested!

The bad news is that this work has taken much longer than anticipated,
and I think the game is still too buggy to release – even as an alpha.
So while the plan was to release Alpha 4 this week, it may be one or two weeks late,
but it is coming! 😀

<figure class="image">
  <a href="/assets/screenshots/2023-05-30-pull-request.png"><img src="/assets/screenshots/2023-05-30-pull-request.png"></a>
  <figcaption>For the curious, this is the scale of the work done so far. It will feel
    <em>great</em> when this is finally merged.</figcaption>
</figure>
