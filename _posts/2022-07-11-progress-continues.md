---
layout: post
title:  "Progress continues"
date:   2022-07-11 10:00:00 +1200
author: Jevon Wright
#truncate_words: 150
---

Over the last week I've been revisiting the story/setting,
the high-level development timeline, and the marketing plan.
Today, the plan is still to go via Itch, then Kickstarter, then Steam/Epic.
I think it might be a good idea to get an early copy on Itch
ASAP so I can start collecting feedback and ideas, and then
gradually publish new features every 4-6 weeks.

(And a quick reminder that if you're on Patreon,
[you can download](/2022/04/30/first-playable-release) a playable pre-alpha
of the game today!)

In the meantime, work on the user interface bits and pieces continues:

<figure class="image">
  <a href="/assets/screenshots/2022-07-11-checkboxes.gif"><img src="/assets/screenshots/2022-07-11-checkboxes.gif"></a>
  <figcaption>Styling and logic for checkboxes and radios</figcaption>
</figure>

<figure class="image">
  <a href="/assets/screenshots/2022-07-11-dropdowns.gif"><img src="/assets/screenshots/2022-07-11-dropdowns.gif"></a>
  <figcaption>Dropdowns were a challenge, but they work well</figcaption>
</figure>

I also spent three days focusing on the performance of the user interface rendering.
I saw a related title release on Steam that uses my engine (libgdx) and a lot of the
reviews were talking about the "janky UI", so it's important I get this right.
I'm pretty happy with the results so far &ndash; laying out and rendering a complex screen
has gone from 60ms per frame, to 23ms, and I've got more ideas for squeezing
that down further.
