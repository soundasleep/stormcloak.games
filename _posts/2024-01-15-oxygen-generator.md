---
layout: post
title:  "Oxygen generator"
date:   2024-01-15 16:15:00 +1300
author: Jevon Wright
year:   2023 # display on page1
#truncate_words: 112
---

In the next version of _Adaptory_, there's a brand new building: the _oxygen generator_.
My goal for this building is to reflect [real-world water electrolysis](https://en.wikipedia.org/wiki/Electrolysis_of_water);
that is, turning liquid water into oxygen and hydrogen using electricity.

<figure class="video">
  <iframe width="560" height="265" src="https://www.youtube.com/embed/WvQjy-IqMWA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  <figcaption>The new <em>oxygen generator</em> building</figcaption>
</figure>

But in order to get there, the element simulation needed a bit of a minor rewrite...

(Warning: Technical gamedev post follows!)

## The old data model

In _Adaptory_, every instance of a building or explorer has its own mass and temperature.
Some types of buildings and explorers can also absorb mass from the environment,
convert it into another element using some conversion process, emit it back into
the environment, and so on.

In the old data model, this was achieved by giving each instance a fixed number
of optional mass and temperature slots, for each type of stored mass input and output.
Slots that were not enabled had to be stored as zeros/`null`s:

<figure class="image">
  <a href="/assets/screenshots/2024-01-15-stored-masses-old.png"><img src="/assets/screenshots/2024-01-15-stored-masses-old.png"></a>
  <figcaption>Old data model, with one mass stored per strategy</figcaption>
</figure>

My design goal for the _oxygen generator_ meant turning one element into
two elements, either one of which could be prevented from emitting into the environment
for whatever reason. In the previous data model, this would have meant adding
an additional mass and temperature slot to _every building_, even though most
buildings wouldn't be using it. It was clear a new approach was needed.

## The new data model

In the new data model for _Adaptory_, every building type and explorer type now defines
any number of input and output _slots_, with each slot defining how it works (absorption,
emission, piped in, dropped into the world). Each mass packet is also stored immutably,
reducing the amount of memory access we need
[between world simulation frames](/2023/06/05/new-data-model).

<figure class="image">
  <a href="/assets/screenshots/2024-01-15-stored-masses-new.png"><img src="/assets/screenshots/2024-01-15-stored-masses-new.png"></a>
  <figcaption>New data model, with any number of input and output slots</figcaption>
</figure>

Having this extra layer of abstraction has some significant benefits:

- Building types that don't have any inputs or outputs (e.g. solid tiles or wires)
  don't end up having to store unnecessary data/zeroes. This reduces memory pressure
  and should make the game faster. (Even though storing lists instead of primitive values
  does incur an overhead, this overhead only becomes an issue if the average list size
  is very small.)
- The new data model allows for buildings to have categories of inputs and outputs (using patterns),
  rather than a building only supporting a few predefined elements;
  this paves the way for refinement buildings and enables future modding.
- The conversion framework is significantly more flexible. We could now have a building
  that takes a combination of inputs, does a combination of conversions, and outputs in
  a combination of different ways.
- This extra abstraction layer should allow for more opportunities to optimise
  the element simulation in the future. The element simulation is slightly faster (~1-2%) already.
