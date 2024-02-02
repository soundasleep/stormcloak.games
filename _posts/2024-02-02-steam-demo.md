---
layout: post
title:  "Steam Next Fest demo now live"
date:   2024-02-02 14:00:00 +1300
author: Jevon Wright
year:   2023 # display on page1
truncate_words: 150
---

The Steam Next Fest demo for _Adaptory_ is LIVE!! 🥳 You can download your free copy of the game [on Steam](https://store.steampowered.com/app/2201620/Adaptory/):

<figure class="steam">
  <iframe src="https://store.steampowered.com/widget/2201620/" frameborder="0" width="646" height="190"></iframe>
</figure>

Full patch notes are listed below.

This version has been heavily tested but there may still be bugs, crashes, and unexpected behaviour. Please do [sending through bug reports, feedback, and ideas](/discord), as we'll be working on polish and tweaks over the next week. A huge, huge thanks to everyone who has played an early build 🥰

As mentioned in the [Steam Next Fest plan](/2024/01/29/steam-next-fest), the plan is to keep this demo up beyond the festival, but I might need to turn it off if something unexpected occurs. So [download a copy today](https://store.steampowered.com/app/2201620/Adaptory/),
and [please let us know](/discord) what you think!

## Voices

In the demo, your explorers can now express themselves! They'll make adorable noises
when sleeping, digging, carrying, building, having conversations, or
any other number of actions.

<figure class="video">
  <iframe width="560" height="265" src="https://www.youtube.com/embed/jRyBlAmoN6w" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  <figcaption>Adorable gibberish</figcaption>
</figure>

## Overlay selection bar

_Adaptory_ is a complex game with multiple simulations all working together
to create emergent gameplay. To see what's going on, you can use _overlays_
to show different views of your base, such as the new _breathability_ overlay in the game:

<figure class="image">
  <a href="/assets/screenshots/2024-02-02-oxygen-overlay.png"><img src="/assets/screenshots/2024-02-02-oxygen-overlay.png"></a>
  <figcaption>The new <em>breathability</em> overlay</figcaption>
</figure>

The selection bar also shows some of the systems and layers that will be coming
in future releases.

## Revamped power systems

All powered buildings have been improved. Batteries last longer,
lights use less power, and stored power is now measured in Wd (Watt-days).
I've also fixed it so you can't get infinite power from a light. 😉

<figure class="image">
  <a href="/assets/screenshots/2024-02-02-watt-hours.png"><img src="/assets/screenshots/2024-02-02-watt-hours.png"></a>
  <figcaption>Power storage is now measured in Watt-hours (Wh)</figcaption>
</figure>

## Oxygen generator

As mentioned in [an earlier post](/2024/01/15/oxygen-generator), we've added
the _oxygen generator_, which turns liquid water into oxygen and hydrogen, using
electricity. This gives you another way to create oxygen for your team,
although it requires a bit of setup and infrastructure to get going.

<figure class="video">
  <iframe width="560" height="265" src="https://www.youtube.com/embed/WvQjy-IqMWA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  <figcaption>The new <em>oxygen generator</em> building</figcaption>
</figure>

## Polish, tweaks and fixes

There's also dozens of bug fixes, tweaks, balance, simulation, and
performance improvements since the [last release](/2023/12/22/alpha-7),
making the game feel and play better. These include:

- Particle effects and sounds, including splashes, thuds, crashes and puffs
- Loads of new building sounds and sound effects
- New materials _hydrogen_ (gas), _liquid hydrogen_, and _solid hydrogen_
- Another music track by the incredible Sai
- A "follow" button to keep your camera focused on an explorer
- The target simulation rate has been increased to 24 updates per second (UPS)
- The game now starts in fullscreen mode by default, and remembers which monitor it was last on

Full patch notes below.

<figure class="steam">
  <iframe src="https://store.steampowered.com/widget/2201620/" frameborder="0" width="646" height="190"></iframe>
</figure>
---

# Release notes for Adaptory 0.10 (Steam Next Fest)

### New features

- Liquids and gases now render in front of buildings, explorers and items
- Particle effects! Added splash, thud, crash, dissolve, puff, spurt particles and sounds
- New building: **Oxygen generator!**
  - Requires 100 W power and 2.5 kg/sec water (piped in) to generate oxygen and hydrogen
  - Conversion rate depends on the buildings' power level
- Added "follow" button to explorers to keep the camera laser focused on them
- Added breathability layer through `F1`
- Added overlay selection bar at top right
- Explorers' names are now rendered in-game – you can turn this off in _Options_
- Explorers now have voices!
- Added another music track by [Sai Natarajan](https://www.viusstudios.com/)

### Simulation

- Added the new elements _hydrogen_ (gas), _liquid hydrogen_, and _solid hydrogen_
- Fixed the element simulation performing absorption and emission running 3x too slow
- Increased target simulation rate from 20 to 24 UPS, decreased element simulation target from 6.67 to 6 UPS
- Increased number of ticks per game day from 7200 to 8640
- Tweaked explorer behaviour to not obsess over supplying a coal generator

### Balance

- Tweaked explorer breathing intake/output/conversion parameters
- Changed breathing oxygen-to-carbon dioxide conversion ratio from 25% to 33%
- Increased coal generator power generation from 100 W to 500 W
- Increased solar power generation from 25 W to 100 W
- Increased light consumption from 10 W to 25 W
- Increased transmitter power consumption from 25 W to 200 W
- Power networks now display storage in Wd (Watt-days) rather than W
- Daylight now peaks at 20k lux and solar panels now require up to 10k lux
- Increased number of oxygen candles generated in a new world
- Reduced sadness debuff on movement speed from 20% to 10%
- Reduced mood debuff on explorer death from 50% to 40%
- Increased coal generator maximum supply from 100kg coal to 500kg

### Internal

- Remove some unnecessary render layers, improving rendering performance
- Improved user interface rendering performance
- Improved rendered quality of user interface background images
- Updated various building, explorer, and world sounds
- Moving liquid packets' size are now proportional to the mass moving in that packet
- Liquid pipes layer now displays non-moving mass in pipes as well as moving packets
- Assets are no longer stored compressed, which may improve startup and load times, at the expense of slightly more disk space usage
- Added keyboard shortcut `shift-F11` to toggle visibility of all user interfaces, when debug info is also visible (`F8`) - locked behind two keyboard shortcuts to prevent accidental toggling
- Added direct link to feedback form in game menu
- The game now starts up in windowed fullscreen mode by default
- The game will now remember which monitor it was last used on, and start up on that screen
- Moved attribution and logos into the loading assets screen
- Sounds that occur outside of the visible area (i.e. behind fog-of-war) are no longer played

### Fixed

- Fixed explorers sometimes being generated with both "hates digging" and "loves digging" traits
- Fixed a rare crash when starting a new game or loading a save file
- Fixed a rare crash when liquid pipes were trying to merge liquid packets
- Fixed liquid mass packets sometimes being transferred unevenly from source buildings
- Fixed a bug where Windowed Fullscreen from startup would sometimes be offscreen
- Fixed simulation not working correctly across world x=63
- Fixed the game flashing magenta at startup
- Fixed looping sounds (sleeping, digging etc) still playing when starting a new game
- Fixed a rare crash when trying to calculate FPS data
- Fixed layers not rendering correctly if the world changes while the game is paused
- Fixed a built light not having the same rendered dimensions as its blueprint
- Fixed a crash on Windows Alt-Tab if the game was full-screen
- Fixed links being rendered across multiple lines in a dialog not being clickable
- Fixed lasers and conversation bubbles sometimes being fixed to an edge of the screen
