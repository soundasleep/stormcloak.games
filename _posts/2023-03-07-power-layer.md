---
layout: post
title:  "Power layer"
date:   2023-03-07 09:20:00 +1300
author: Jevon Wright
year:   2023 # display on page1
#truncate_words: 150
---

I've finished most of the [new liquid and gas shaders](/2023/02/21/new-liquid-shaders)
and they feel a _lot_ nicer. Here's a video comparing the before and after:

<figure class="video">
  <iframe width="560" height="275" src="https://www.youtube.com/embed/EH-1mVYsTOQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  <figcaption>Comparison of old and new gas shaders in Adaptory, I'm also slowly getting better at video editing 😅</figcaption>
</figure>

I'll be using these new beautiful graphics
to update the [Steam page](https://store.steampowered.com/app/2201620/Adaptory/) for Alpha 3,
which I think will help with wishlists a lot!

Over the weekend I also quickly put together a brand new mechanic.
One of the issues with Alpha 2 is that it's not clear where buildings need to be connected in order
to be powered:

<figure class="image">
  <a href="/assets/screenshots/2023-03-07-power-layer-off.png"><img src="/assets/screenshots/2023-03-07-power-layer-off.png"></a>
  <figcaption>Powered buildings in Adaptory, power layer turned off</figcaption>
</figure>

Now when you start to build wires – or use the keyboard shortcut `F4` –
you'll be switched to the **power layer** which shows all of the connection
points for all the buildings, and whether they're powered:

<figure class="image">
  <a href="/assets/screenshots/2023-03-07-power-layer-on.png"><img src="/assets/screenshots/2023-03-07-power-layer-on.png"></a>
  <figcaption>Powered buildings in Adaptory, power layer turned on</figcaption>
</figure>

The graphics are inspired by both Rimworld's and Oxygen Not Included's approaches,
which I both really like! And yes, I'm intentionally using the iconography of
[Australia/New Zealand power sockets](https://en.wikipedia.org/wiki/AS/NZS_3112)
because I think they're great 😅
