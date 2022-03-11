---
layout: post
title:  "More user interface work"
date:   2022-03-11 17:27:00 +1300
author: Jevon Wright
---

I'm deep in user interface code again.

[My previous approach was fine](/2021/12/10/user-interfaces), but it was a quick and dirty implementation. I knew I'd need to
clean it up before I can start adding more complex interface elements (like dialogs,
menus, events – all the things you need in a game).

I'm still using a hybrid CSS/HTML + libgdx approach, based on the awesome [CSSBox](https://github.com/radkovo/CSSBox) project.
Over the last week I've added scrollbars, text input, event handling and bubbling,
and basically rewrote the input processing stack to support multiple objects on the screen at once:

<figure class="video">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/Z8cOFScfV_o" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  <figcaption>Testing out scroll bars, text fields, and buttons</figcaption>
</figure>

Before I can [call this done](/2022/01/12/draft-timeline), there's a couple of minor bugs
that still need to be squished. I'd like to try adding a debug console, because
the debug display is starting to get a bit overwhelming. And I'd like to
clean up the hot-reloading code, as it's quite slow. The grind continues!
