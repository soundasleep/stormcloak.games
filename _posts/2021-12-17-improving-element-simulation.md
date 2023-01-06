---
layout: post
title:  "Improving the element simulation"
date:   2021-12-17 11:34:00 +1300
author: Jevon Wright
year:   2021
---

I'm happy with my progress in making
[user interfaces with HTML and CSS](/2021/12/10/user-interfaces) over the last week:

[![A better character selection panel](/assets/screenshots/2021-12-17.png)](/assets/screenshots/2021-12-17.png)

There's a whole bunch of important functionality under the hood – such as SCSS support,
scripting with [Groovy](https://groovy-lang.org/), hotreloading, and image support –
but that's enough UI dev for now.
I want to get back to making a game, not a user interface framework.

The next thing I'd like to work on is the way that the element simulation looks to the player.
Right now I have a fairly decent proof of concept:

[![Liquids have a cool caustic shader effect](/assets/screenshots/2021-12-17-2.png)](/assets/screenshots/2021-12-17-2.png)

But it's not where I'd like it to be. It's not clear what each tile is, the animation between
tile states is jerky, the tiles can only be squares – _plenty_ of areas for improvement.

As a result I'm studying shaders through GLSL which is a deep, confusing, and mysterious art that
I do _not_ understand. I'm deep in the weeds of learning what is and isn't possible, and I don't
even know if I'll have something to show for it at the other side. Ah well, such is learning.

(How do technical artists manage to make games look so good!? 😅)

This is also likely my last post for the year. Thank you for reading this, and for all of the
support and feedback you've sent my way. All of it is appreciated. Have a great summer (or winter) break and
see you in the new year!
