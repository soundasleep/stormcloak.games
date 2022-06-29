---
layout: post
title:  "Even more user interface work"
date:   2022-06-28 10:00:00 +1200
author: Jevon Wright
truncate_words: 150
---

It's been a while since the last blog, probably because there's a lot of stuff
happening in the background! While I've been waiting for these moving pieces
to land, I've been spending more time – [again](/2022/03/11/more-user-interfaces) – on the user interface.

Since this game is designed to have playtimes of 10-40+ hours per session,
the quality of the UI is important. It needs to feel comfortable, pleasant to use,
and fast.

So I've fallen back to my design library roots and I'm putting together
a simple UI kit. Despite being constrained by
[an incomplete CSS 3 specification](https://github.com/radkovo/CSSBox/issues/54) and [a few layout bugs](https://github.com/radkovo/CSSBox/issues/73), I'm pretty happy with the results so far:

<figure class="image">
  <a href="/assets/screenshots/2022-06-30-uikit-basics.png"><img src="/assets/screenshots/2022-06-30-uikit-basics.png"></a>
  <figcaption>Basic text styling and layout bits</figcaption>
</figure>

I think tooltips are going to be important to be able to display context
to the player without overwhelming them with text:

<figure class="image">
  <a href="/assets/screenshots/2022-06-30-tooltips.gif"><img src="/assets/screenshots/2022-06-30-tooltips.gif"></a>
  <figcaption>Rich tooltips can add depth</figcaption>
</figure>

Along the way I've also been improving performance, fixing bugs, and adding
features that normally, you wouldn't give a second thought to:

<figure class="image">
  <a href="/assets/screenshots/2022-06-30-text-inputs.gif"><img src="/assets/screenshots/2022-06-30-text-inputs.gif"></a>
  <figcaption>The player should be able to write text wider than the input field</figcaption>
</figure>
