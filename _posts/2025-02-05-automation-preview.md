---
layout: post
title:  "Automation preview"
date:   2025-02-05 12:45:00 +1300
author: Jevon Wright
year:   2023 # display on page1
#truncate_words: 200
---

Over the last month we have been working on a feature that will be exclusive to Early Access,
and we'd love to share a quick preview with you...

One of our design goals for Adaptory is to encourage players to build a base which
can adapt to all of the different [random world events](/2023/03/16/random-events)
that may occur. Because you are limited to a small number of explorers,
we are adding **automation** to the Adaptory end-game,
inspired by games like _Factorio_ and _Oxygen Not Included_.

<figure class="image">
  <a href="/assets/screenshots/2025-02-04-automation-network.png"><img src="/assets/screenshots/2025-02-04-automation-network.png"></a>
  <figcaption>The new <b>circuit network overlay</b> coming to Adaptory, showing an oxygen generator being controlled by two sensors – temperature and element – routed through an OR gate</figcaption>
</figure>

In Adaptory, you will be able to build **circuit networks** that do not require power.
These networks will transmit either _true_ or _false_ signals to buildings on the network,
which you can then use to autonomously control different parts of your base. For example:

* If someone's bedroom starts getting too cold, you might want to automatically turn on a heater.
* If everyone in your crew goes to sleep at the same time, you might want to automatically
  turn off the lights overnight to save a little power.
* If it's not safe to exit an airlock due to dangerous conditions outside,
  you might like to automatically lock the door to prevent anyone getting out.
* ... and more! I cannot wait to see what wild and bizarre inventions you come up with.
  And yes, of course, the goal is to be [Turing-complete](https://en.wikipedia.org/wiki/Turing_completeness).

Adding automation systems to your game **will be optional** – you'll be able to "finish"
the game without them – but for advanced or expert players, these buildings
can help you create a more efficient base with a happier crew.

Some of the automation buildings coming in Adaptory EA will include (please note,
all art is still WIP):

| **Temperature sensor** | Sends _true_ when the ambient temperature is above or below the configured value. | <img src="/assets/screenshots/2025-02-04-sensor-temperature.png" class="in-table"> |
| **Pressure sensor** | Sends _true_ when the ambient pressure is above or below the configured value. | <img src="/assets/screenshots/2025-02-04-sensor-mass.png" class="in-table"> |
| **Element sensor** | Sends _true_ when the ambient element (e.g. oxygen, hydrogen, water) is or isn't a certain value. | <img src="/assets/screenshots/2025-02-04-sensor-element.png" class="in-table"> |
| **Time sensor** | Sends _true_ when the current world time is within a certain range. | <img src="/assets/screenshots/2025-02-04-sensor-time.png" class="in-table"> |
| **Light sensor** | Sends _true_ when the ambient light levels are above or below the configured value. | <img src="/assets/screenshots/2025-02-04-sensor-light.png" class="in-table"> |
| **AND gate** | Has two inputs and one output, and sends _true_ if (and only if) both inputs are _true_. Can be rotated. | <img src="/assets/screenshots/2025-02-04-and-gate.png" class="in-table"> |
| **OR gate** | Has two inputs and one output, and sends _true_ if _either_ input is _true_. Can be rotated. | <img src="/assets/screenshots/2025-02-04-or-gate.png" class="in-table"> |

And some of the buildings that you'll be able to automatically control will include:

| **Coal generator** | Normally generates power non-stop from supplied coal. Will stop generating power if the circuit network is _false_. | <img src="/assets/screenshots/2025-02-04-coal-generator.png" class="in-table"> |
| **Door** | Normally unlocked and closed. Will automatically open when the circuit network is _true_, or lock itself when the network is _false_. | <img src="/assets/screenshots/2025-02-04-door.png" class="in-table"> |
| **Light** | Normally turned on and generating light from power. Will automatically turn off if the circuit network is _false_. | <img src="/assets/screenshots/2025-02-04-light.png" class="in-table"> |

We are very grateful to CODE NZ for the [KickStart grant](/2024/03/22/code-kickstart)
that has allowed us to add these automation systems for the Early Access release of Adaptory. ❤️
