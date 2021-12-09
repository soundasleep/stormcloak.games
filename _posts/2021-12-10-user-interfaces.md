---
layout: post
title:  "User interfaces with HTML"
date:   2021-12-10 12:31:00 +1300
author: Jevon Wright
---

I've been [working on plants](https://www.patreon.com/posts/trees-that-do-59150694)
(and letting them breathe, convert, absorb, and die), and it's looking really cool.
Pawns no longer have to die when they run out of oxygen haha.

The next mechanic that I want to play around with is getting a bit more of the
construction and automation aspect of the game. I want to see what machines are
like in the game, or if the game should focus more on the nature/organic aspect. Or
maybe both.

But in order to get there, I'm hitting the limits of how much I can tolerate creating
user interfaces by hand, and I have a feeling that I'm going to need to display
a lot of content to the user (and the content needs to be interactable).

The framework I'm using ([libgdx](https://github.com/libgdx/libgdx)) suggests their framework called
[Scene2D](https://rskupnik.github.io/libgdx-ui-overview), but it's
[pretty awkward to use](https://www.reddit.com/r/libgdx/comments/aiybmy/comment/eevf1az/?utm_source=reddit&utm_medium=web2x&context=3).

One of my previous careers was a web developer, so... what if I could use HTML and CSS to
display the user interface? Then I could use all of my skills, tools and technologies to
create a user interface that isn't terrible. And I know it's possible, because I know
that [Eclipse uses something similar](https://www.vogella.com/tutorials/Eclipse4CSS/article.html).

It's definitely a bit esoteric but I think it's possible with open source software
such as [CSSBox](https://github.com/radkovo/CSSBox). So that's what I'm working on this week.
And it's looking really promising:

[![Initial work in getting HTML in libgdx](/assets/screenshots/2021-12-10.png)](/assets/screenshots/2021-12-10.png)

Something I'm really enjoying about this game creation process is just how many weird
and wonderful, and wacky, problems I'm faced with. HTML in OpenGL using libgdx with Java?
Nobody's asked that question before!
