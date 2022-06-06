---
layout: post
title:  "Fully spatialised sounds"
date:   2022-06-07 11:35:00 +1200
author: Jevon Wright
truncate_words: 150
---

After the last post where [I talked about adding spatialised sounds](/2022/05/28/events-and-sounds)
– that is, sounds that feel like they exist in a two- or three-dimensional world –
I continued looking into adding reverb to the sounds, to make the game world
sound more real and alive.

Originally I thought the best solution would be to [pre-compose sounds](https://stackoverflow.com/a/33211968/39531)
with reverb at different distances, but because the game camera can move so fluidly,
it didn't work. If you moved the camera, sounds became choppy and uncomfortable.

So I'm happy to have come up with a solution using [the native OpenAL bindings](https://www.openal.org/),
where I can add any number of filters and effects to playing sounds:

<figure class="video">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/-vTA5u7NhsM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  <figcaption>Demoing full sound spatializaton (best experienced with headphones)</figcaption>
</figure>

Along the way I also needed to [upgrade the engine](https://libgdx.com/news/2021/04/the-ultimate-migration-guide),
and I've learned a lot more about sound effects and native bindings 😂

(For the curious, [this is some prototyping code](https://github.com/soundasleep/libgdx-openal-reverb-demo)
that implements the effect. I'd love to open source this as a library one day.)
