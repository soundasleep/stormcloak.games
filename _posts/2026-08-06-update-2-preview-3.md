---
layout: post
title:  "Update 2 – Introducing Streamer mode"
date:   2026-08-06 10:00:00 +1200 # NZST
author: Jevon Wright
year:   2023 # display on page1
truncate_words: 250
---

In this [final preview post](/2026/08/03/update-2-preview-2) for Adaptory Update 2,
I'm excited to round up the reveals with a small expansion to
Adaptory's story, and a new way to play the game...

## Naming the planet

After a few days of surviving this unexplored planetoid,
your explorers will want to give this planet a name!
You can enter in any name you want, or use the random planet name generator
(I've always wanted to make one of these! :D).

<figure class="image">
  <a href="/assets/screenshots/2026-08-06-planet-name.png"><img src="/assets/screenshots/2026-08-06-planet-name.png"></a>
  <figcaption>Explorers will refer to the planetoid name in conversations, diary entries, and major events.</figcaption>
</figure>

## We need to fix this ship

(Spoilers ahead)

In Update 2, you need to research and craft **three new unique items** at the [constructor](/2026/07/30/update-2-preview-1)
to be able to reuse the crashed ship as a distress beacon:

- The **astrometric sensor**, crafted from glass, gold, and data chips;
- The **fuel cell**, crafted from graphite, bitumen, oxycans, and insulation; and
- The **spline reticulator**, crafted from iron, diamond, and artefacts.

You'll need to create at least **one** of each item for the distress beacon to complete the story in Update 2.
(At [higher difficulty levels](/2026/04/01/update-1-preview), you'll need two or more.)

## Streamer mode

**Streamer mode** is a new, experimental way to play Adaptory for
streamers and content creators. You can now directly connect your
chat or community to Adaptory, and they can directly trigger
benefits, challenges, and all sorts of havoc. I've been wanting to
add this into Adaptory for a long time now :D

There are more than [50 commands available](https://github.com/stormcloakgames/adaptory-streamer-mode), and
you can choose what commands to support, when, and how they're triggered –
perhaps with [Streamer.bot](https://docs.streamer.bot/api/sub-actions/core/file-io/write-to-file),
[ActionBot](https://actionbot.app),
[FireBot](https://firebot.app), or anything else really.
[ZeppyGame](https://www.youtube.com/@ZeppyGame) has also put together a [handy integration guide](https://adaptory.wiki.gg/wiki/Stream_Integration) –
thank you very much Zeppy <3!

<figure class="image">
  <a href="/assets/screenshots/2026-08-06-streamer-mode-commands.png"><img src="/assets/screenshots/2026-08-06-streamer-mode-commands.png"></a>
  <figcaption>Some of the events you can trigger in <a href="https://github.com/stormcloakgames/adaptory-streamer-mode">Adaptory streamer mode</a></figcaption>
</figure>

It's up to you how you want to integrate Adaptory into your stream.
Do you want channel points to be used as event triggers?
Do you want donations to unlock vital research, or to kill a random explorer?
Do you want to go full [Man vs Stream](https://www.youtube.com/watch?v=HscuzrpfHFY&list=PLchTMRijDSBy_O15XybCgWaoNJsx8r40m)
where the challenge is simply surviving?
If you plan to do an Adaptory stream,
[please let me know](mailto:jevon@stormcloak.games) because
I'd love to pop in and cause some chaos :D

- [Full documentation](https://github.com/stormcloakgames/adaptory-streamer-mode)
- [Integration guide](https://adaptory.wiki.gg/wiki/Stream_Integration) by [ZeppyGame](https://www.youtube.com/@ZeppyGame)
- [Suggest new events and commands](/discord)

## Rendering performance improvements

I've spent a lot of time focusing on improving Adaptory's performance in Update 2,
and the game should now run much faster, with higher frames per second (FPS) and less memory usage.
In my local testing on some very large save files (including games with thousands of buildings),
FPS has increased by 250%+.
There will be more FPS and UPS improvements coming in the next update, too!

<figure class="image">
  <a href="/assets/screenshots/2026-08-06-pluto4911.png"><img src="/assets/screenshots/2026-08-06-pluto4911.png"></a>
  <figcaption>A massive base on day 1000 by Pluto4911</figcaption>
</figure>

## Quality of life

Update 2 includes a huge range of quality of life improvements, including:

- There are **new CHARLI guides** based on [your feedback](/discord); for example, CHARLI now gives more direct guidance for dealing with "explorer died", "high pressure", and "low oxygen" events
- CHARLI notifications for random events can be **permanently ignored** ("don't remind me again")
- Selecting a research node in the research tree highlights all **unmet prerequisites**
- When an explorer is in the middle of supplying a building (such as a storage box), if the supply would no longer be valid for that building (e.g. the configuration changes), explorers will **stop what they're doing** rather than continuing to supply an invalid errand

<figure class="image">
  <a href="/assets/screenshots/2026-08-06-automatic-limiting.png"><img src="/assets/screenshots/2026-08-06-automatic-limiting.png"></a>
  <figcaption>Power generators can <b>automatically limit</b> power generation and consumption</figcaption>
</figure>

- Doors and hatches can be **left open** by explorers, rather than only through the circuit network
- Liquid and gas vents can be **manually closed** by explorers, rather than only through the circuit network
- Storage boxes are **stackable**, providing foundation for buildings, and are also climbable by explorers
- Explorer dig speed is now **proportional** to the mass being dug out, making meteor showers much faster to clean up

<figure class="image">
  <a href="/assets/screenshots/2026-08-06-supply-list.png"><img src="/assets/screenshots/2026-08-06-supply-list.png"></a>
  <figcaption>Pending build errands now clearly list what materials are missing</figcaption>
</figure>

- Added the **pressure overlay** (Shift-F7, inside the gas overlay) to display the non-solid mass amount in each cell
- Conversations between explorers have a much wider range of **conversation alternates** so that the conversations don't feel as repetitive
- The dropdown list for assigning explorers to buildings (such as beds) now show if that explorer is **already assigned** to another one
- And so, so many more improvements and little tweaks

<figure class="image">
  <a href="/assets/screenshots/2026-08-06-stackable.png"><img src="/assets/screenshots/2026-08-06-stackable.png"></a>
  <figcaption>When an explorer is selected, their <b>movement path</b> is displayed</figcaption>
</figure>

Some of these improvements are directly from ideas and suggestions shared on [our Discord](/discord),
so thank you – and I'd love to hear directly from you what else could be improved!
I want Adaptory to be as pleasant and accessible to play as possible,
and I appreciate every piece of feedback.

## And all sorts of other stuff

These three preview posts touch on just **some** of the new functionality and gameplay
scattered throughout the update. It's been a while since Update 1 and we've been focusing on
improving every aspect of the game, from start to finish. The full patch notes
for The Temperature Update is more than **seventeen pages long** and will be revealed tomorrow!!
