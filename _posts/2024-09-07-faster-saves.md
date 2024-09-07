---
layout: post
title:  "Faster saves"
date:   2024-09-07 16:00:00 +1200
author: Jevon Wright
year:   2023 # display on page1
#truncate_words: 95
---

(Warning: technical, but short, gamedev post)

In the next alpha version of Adaptory, I've rewritten the save game format
to support much faster loads and saves:

| Test | old (.ymlz) | new (.jsonz) |
| -- | -- | -- |
| Saving | 1405ms | 284ms |
| Loading | 9139ms | 349ms |
| File size | 383kb | 396kb |

In the old format, save games were YAML files (`.yml`), combined and zipped into
a single archive (`.ymlz`). This worked great, because I want the save files
to be readable and eventually moddable by players.

However, I was finding that loading save files was taking quite a while. Loading
an existing save would often take 10 seconds or more, for a pretty simple world.
Upon investigation I found that the entire file had to be loaded
into memory as a string, and then parsed as a single object, before the world could be created.

Ideally, I'd swap the YAML serialization library to [one that supported streaming](https://en.wikipedia.org/wiki/Simple_API_for_XML),
because then you are reading, processing, and initialising all in a single stream,
minimising the amount of memory you need to use. However I couldn't find any Java YAML parsers that supported streaming.

I therefore made the decision to rewrite serialization using JSON. (I also considered XML.)
This means that Adaptory save games are now JSON files (`.json`), combined and zipped into a single archive (`.jsonz`).

Using [GSON](https://github.com/google/gson) as our JSON serialization library has worked great – everything
is much faster, so much so that I don't even think I need to write a progress bar for loading anymore 😅

This _does_ however mean that old save files are no longer compatible –
I'll be keeping the old `.ymlz` save game loader temporarily in Alpha 11,
but I'll be **removing it in Alpha 12**,
so make sure to download a copy of the [next demo version](https://store.steampowered.com/app/2201620/Adaptory/) and migrate any old saves you might have.
