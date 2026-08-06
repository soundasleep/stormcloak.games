---
layout: post
title:  "The Temperature Update is LIVE!"
date:   2026-08-07 05:00:00 +1200 # NZST
author: Jevon Wright
year:   2023 # display on page1
truncate_words: 150
---

**The Temperature Update** – Adaptory's second **free** major update – is now **LIVE!**

<figure class="image">
  <a href="https://store.steampowered.com/app/2201620/Adaptory/"><img src="/assets/screenshots/2026-08-07-update-2.png"></a>
</figure>

Update 2 is a **massive** update, representing four months of focused development
and improvements on every aspect of the game.
This update introduces personalised bedrooms,
new heat gameplay and mechanics, more than twenty new buildings,
improved simulations, performance and tutorials, refined balance, quality of life improvements, and more...

Steam should automatically update your copy of Adaptory to the latest version.
If you don't already have the game, Adaptory is featured in the
[Tiny Teams festival](https://store.steampowered.com/sale/TinyTeams2026) with a **20% discount** – more below!!

<figure class="steam">
  <iframe src="https://store.steampowered.com/widget/2201620/" frameborder="0" width="646" height="190"></iframe>
</figure>

## Tiny Teams

<figure class="image">
  <a href="https://store.steampowered.com/sale/TinyTeams2026"><img src="/assets/screenshots/2026-08-07-tiny-teams.png"></a>
</figure>

We're thrilled and honoured for Adaptory to be in the official **curated selection** for **Tiny Teams** this year <3

[Tiny Teams](https://www.yogscast.games/tinyteams) is "the world's greatest Steam Festival celebrating small studios making big games.
Exclusively featuring games from solo devs or micro studios, it is a week-long celebration on
Steam, Twitch, and YouTube, highlighting the power of the solo and tiny teams."

I have no idea if or when Adaptory will be streamed or featured, but we'll keep our [Discord](/discord)
and [socials](https://bsky.app/profile/stormcloak.games) up-to-date with all the latest info – hope to see you there!
And if you plan to do a stream of Adaptory anytime soon, [please let me know](mailto:jevon@stormcloak.games).
I'd love to pop in and say hi :D

## Thank you

Today my plan is to join as many Adaptory streams as possible,
to hang out on [our Discord](/discord), to see if there's any remaining bugs
(and rapidly squish them with hotfixes),
to collect as much feedback as possible,
and then start making a plan for Adaptory's [next update](https://store.steampowered.com/app/2201620/Adaptory/).

Thank you again to everyone who has helped to play one of the
unstable builds of Adaptory Update 2 – it's very hard to
thoroughly test such an expansive and emergent game 😅
so I am extremely grateful.

Reviews are incredibly important to help improve Adaptory's visibility going forward – so,
if you haven't already,
please consider leaving an **honest review** of Adaptory [on Steam](https://store.steampowered.com/app/2201620/Adaptory/).
Thank you!

<figure class="image">
  <a href="https://store.steampowered.com/app/2201620/Adaptory/"><img src="/assets/screenshots/2026-01-27-steam-review.png"></a>
  <figcaption>Please consider leaving an honest review of Adaptory on Steam &lt;3</figcaption>
</figure>

Full patch notes for Update 2 are below. I hope you enjoy the update! <3

---

# Release notes for Adaptory 0.18 (Update 2: The Temperature Update)

### New features

- Story
  - The distress beacon now needs three more items in order to launch
  - After day 5.0, explorers will want to give this new planetoid a name
  - Added random planetoid name generator
  - The transmitter and crashed ship will now always have a bouncing icon, to highlight how important they are to progress the story
- Regions of the world can now belong to rooms
  - Bedroom: a personal bedroom with a single assigned bed
  - Laboratory: a room containing a research desk, required for advanced research
  - Conservatory: a room containing a planter box and at least three different plant types
- Added new room overlay (default = `F4`)
  - When the room overlay is open, a small legend of each possible room is displayed in the top right
- Improved liquid simulation
  - Large blobs of liquid should no longer be blocked by small amounts of gas
  - Liquids should spread out more, as expected, and push back against overcompression in all directions
  - Building an impassable tile over a liquid should now push liquids to the side, rather than above
  - A liquids' default maximum mass per tile (before it introduces expansive forces) is now its density, rather than a fixed 1000kg regardless of element type
  - Liquids in a grate will now fall out as a drop, rather than a solid cell of water
  - When creating a new drop, the simulation will now try to merge it with an existing drop if possible, to reduce noise
  - In testing so far, this has made liquids feel much less "sticky"
- Improved gas simulation
  - Large blobs of gas should no longer be blocked by small amounts of liquid
  - Gases will now tend to "layer" more; carbon dioxide will pool towards the bottom of the map, and hydrogen will rise
  - Gases no longer emulate atmospheric pressure due to gravity, and now expand equally in all directions
  - When blocked by an impassable tile (such as a hatch, door, or newly-built tile), gases will now prefer to go up, rather than down
  - A gases' default maximum mass per tile is now its density, rather than a fixed 50kg regardless of element type
  - In testing so far, this has made gas feel much less "sticky", and carbon dioxide "heavier"
- Heat convection
  - Added a "heat convection" component to the element simulation
  - Temperature gradients will now diffuse much more rapidly across liquids and gases
  - Hotter liquids and gases will now rise, and colder liquids and gases will fall
  - This has been implemented with a new "convection coefficient" for all elements, which is a multiplier on the existing conductive heat transfer between two objects based on their elements, if the elements are of the same phase
  - Heat convection does not occur for objects stored within other buildings, or for any object or cell that is not a liquid or gas
- Heat capacity
  - All elements now have a heat capacity value, to try and more accurately simulate temperature transfer
  - Heat capacity is "the amount of heat that must be added to one unit of mass in order to increase one unit of temperature"
  - Heat transfer now considers the heat capacity of each object (using its primary element)
  - For example, hot water (with a high heat capacity) placed upon dirt (with a low heat capacity) will more rapidly heat up the dirt
- Heat transfer calculations
  - The simulation now considers all objects in a cell to be "touching" each other for heat transfer calculations, rather than each object only touching the atmosphere around it
  - The heat flux between two objects now uses the thermal conductivity of the hotter object, rather than the minimum conductivity of either object, to more accurately model heat transfer
  - The default surface area calculation for two objects is now based on the sum of their masses, rather than the ratio of masses between the hotter and colder object - and clamped between 0.01 and 10m^2
  - Two neighbouring gases now have a fixed surface area of 10m^2 to emulate diffusion
  - Two neighbouring liquids now have a fixed surface area of 2m^2 to emulate diffusion
  - The heat flux between two objects stored within buildings (such as pipes and storage boxes) now use a fixed surface area of 0.1m^2, rather than a dynamic value based on the difference in mass between the object and the building, so that insulated pipes don't immediately heat up their contents
  - Explorers' lungs use a surface area value of 0.5m^2
  - Connected objects (such as tiles, wires and pipes) can now also conduct heat with each cell or building it's connected to
  - This should result in a better balanced transfer of heat within all objects in the game world
- Most powered buildings now have an operating temperature range, and will not operate outside of that temperature range
  - The default range is -20°C ~ 100°C
  - Exceptions include all sensors, pumps, and filters, so you are still able to interact with magma
  - Building operating temperatures are not enabled in the "relaxed" difficulty setting
- Item and building contents' phase changes
  - Items will now change phase to a raw item if their temperature exceeds the range for their primary element
  - If the item is stored inside a building (such as a storage box), it will exit that building in order to phase change
  - This also now means that items like brown bernies, ration packs, and data chips can technically melt if they get too hot
  - Masses stored within a building (such as liquid pipes' contents) will now also phase change and exit if they get too hot/cold
  - Mass within a natural spring will not phase change and exit if it gets too hot/cold
- Heat generation
  - All buildings can now generate heat
  - Lights, salt lamps, and batteries now generate small amounts of heat
  - Some buildings now have a thermal conductivity multiplier, which increases or decreases the rate of heat transfer with other objects
- Background temperatures
  - Each cell in the world now has a "background temperature", which very gradually increases or decreases the temperature of the mass in that cell to that background temperature
  - (Internally, background temperature is implemented as a virtual 100g clump of dirt)
  - Background temperature impact is adjustable by difficulty level
  - Background temperature can be blocked by background panels, tiles, and grates
  - World generation now uses the background temperature for that cell as the default temperature for generated elements
  - Existing worlds will be updated with new background temperatures
  - Added new background temperature overlay (default: `Shift+F3`), also accessible by selecting the temperature overlay in the top right
- Explorer temperatures
  - Explorers now have three temperature ranges: comfort (20\~30 C), safe (10\~40 C), and extreme (-10\~60 C)
  - An explorers' body temperature will naturally go towards the comfort range (thermostasis)
  - Difficulty levels can modify the rate of thermostasis
  - If an explorers' body temperature is outside their extreme range, the explorer will have a temperature tantrum and rapidly heat up/cool down their body, until it is back within their comfort range
  - Explorers will no longer idly wander to a position that has a dangerous temperature
  - Explorers will prioritise moving to a safe temperature location when the environment is too hot or too cold
- Tweaked temperature overlay (default: `F3`)
  - When active, the temperature of buildings, items, plants, and explorers is now also rendered using a temperature scale
  - The temperature scale has more colours to show a wider range of temperatures, from purple (-20 C) through to bright red (100 C)
- Faraday cages
  - Areas of the world can now be made immune to solar flares, by building faraday cages completely surrounding the area
  - Faraday cages are conductive and cannot be built in the same cell as another power wire, but can be bridged with power bridges
  - The power overlay now highlights areas immune to solar flares in green
- New buildings!
  - Advanced solar panel: generates more power, but requires glass to build
  - Bean bag: Gives your explorers a place to sit down when there's nothing better to do. Explorers also prefer to write diary entries on bean bags, and will write diary entries faster
  - Bookshelf: Looks nice and also increases nearby explorers' stamina
  - Constructor: Assemble complex parts and unique items
  - Deep freeze: Long-term storage of dead explorers, allowing you to move them before cryochamber research is unlocked
  - Gas thermofilter: Filter out specific temperatures from the gas network
  - Hanging plant: A cute hanging plant
  - Heat exchanger: rapidly transfers heat between the supplied gas and the environment
  - Heat sink panel: accelerates heat transfer in that cell, and can be built alongside background panels
  - Hydrogen generator: Generates power from hydrogen and oxygen from the atmosphere, emits steam
  - Insulated liquid pipe: A liquid pipe but with insulation
  - Insulated gas pipe: A gas pipe but with insulation
  - Insulated tile: Significantly slows down heat transfer between adjacent cells
  - Liquid cooler: Cools itself down by turning water into steam, and can automatically turn itself off (with automation research)
  - Liquid thermofilter: Filter out specific temperatures from the liquid network
  - Potted plant: A cute potted plant
  - Power switch: Connects or disconnects power networks
  - Radiator: rapidly transfers heat between the supplied liquid and the environment
  - Shredder: Inefficiently shreds objects and resources into other resources
  - Space heater: consumes power to generate heat, and can automatically turn itself off (with automation research)
  - Traffic light: Make your explorers wait somewhere until it changes to green.
- Explorer expectations
  - Explorers with no expectations are happy to sleep wherever
  - Explorers with low expectations want to have a personal bedroom
  - Explorers with medium expectations want to have a personal bedroom, with at least one personal requirement met
  - Explorers with high expectations expect a personal bedroom, with 100% of requirements satisfied
  - Expectations are implemented as explorer buffs
  - Added 60 different personal bedroom requirements: one for each homeland, personality type, and trait in the game
- Added new element "insulation"
- New recipes!
  - Astrometric sensor: combine glass, gold, and data chips at a constructor, necessary for the distress beacon
  - Basalt to sand: crush basalt into raw sand at a shredder
  - Fuel cell: combine graphite, bitumen, oxygen candles, and insulation at a constructor, necessary for the distress beacon
  - Glass to sand: crush glass into raw sand at a shredder
  - Insulation (organic): combine glass and brown bernies at a glass furnace to create insulation
  - Insulation to sand: crush insulation into raw sand at a shredder
  - Hydrogen power: turns hydrogen and oxygen into power and a small amount of steam
  - Oxycan to salt: crush oxycans into salt at a shredder
  - Oxycan: combine salt and iron into an oxycan at a constructor
  - Spline reticulator: combine iron, diamond, and arefacts at a constructor, necessary for the distress beacon
- New explorer buffs
  - Boiling hot (tantrum): explorer thermostasis increased 10x, -0.02% hunger per second
  - Cold: -5% happiness if an explorers' temperature is outside their comfort range
  - Conservatory: +10% happiness for explorers who visit a satisfied conservatory (+20% for nature lovers)
  - Hot: -5% happiness if an explorers' temperature is outside their comfort range
  - Freezing cold (tantrum): explorer thermostasis increased 10x, -0.02% hunger per second
  - Near bookshelf: nearby explorers gain +0.025% stamina per second
  - Near dead explorer: -30% mood if near a dead explorer that isn't in a cryochamber or deep freeze
- Added six new research nodes to unlock in the research tree
  - All newly generated worlds are guaranteed to have enough data chips and artefacts to unlock these new nodes
- Building changes and improvements
  - Liquid tanks can now have a configurable colour, just like gas tanks
  - The storage box and big storage box are both now stackable, providing foundation to buildings above it
  - The glass furnace now needs to have a recipe selected in order to work
  - Most buildings can now be flooded if submerged in more than 50kg of liquid, preventing them from working
  - Research analysers and mainframes now need to be in a laboratory (containing a research desk) to work
  - Changed default build times for many buildings
- New random events
  - Cold meteor: a larger meteor with -150 C contents, much rarer than a normal meteor
  - Hot meteor: a larger meteor with +200 C contents, much rarer than a normal meteor
  - Planet cooling down: ALL background temperatures decrease by 10 C, at most 5 times in a row; adjusted by difficulty level
  - Planet heating up: ALL background temperatures increase by 10 C, at most 5 times in a row; adjusted by difficulty level
- Streamer mode (experimental)
  - Streamers and developers can now directly control the game using a `commands.txt` in their save file directory
  - More information: https://github.com/stormcloakgames/adaptory-streamer-mode/

### Story

- Added lots and lots of conversation alternates to all explorers
- Added "day one" conversations to all explorers
- Added diary entries and conversations for shockwave event
- Explorers can now have conversations about events after they write in their diary about the event, and not just before they write in their diary

### Simulation

- Light sources are no longer blocked by buildings in the background, or by wires, pipes, or natural springs
- Buildings, explorers, and plants will now by default only absorb from the immediate tiles that they occupy
  - This means that gas pumps and liquid pumps can only collect gas/liquids in the 2x1 or 2x2 area that the pump occupies
  - Trees are still able to absorb carbon dioxide from their surroundings
- Gas vents and liquid vents can now only emit into their immediate location
- Elements now have build speed multipliers, based on their hardness
  - For example, a gold building takes 20% less time to build than an iron building, and a granite building takes 15% more time than a marble building
  - An elements' build speed multiplier only applies to the primary element of that building
- Explorers can now do non-urgent personal errands (like eating and writing diary entries) even if the entire world is unsafe
  - They will still prefer to travel somewhere where it is safe (safe oxygen levels, safe temperature, not in space exposure, not on a ladder or in a doorway, etc.)
- Explorers can now dig and build through grates
- Explorers can now perform 2x1 (dx,dy) jumps as well, which has the side effect of making long-distance movement a tiny bit faster
- When an explorer is in the middle of supplying a building, if the buildings' target supplied masses changes (e.g. changing the storage box configuration), they should now stop what they're doing, rather than continue to supply an invalid errand
- The natural spring building itself no longer interacts with the temperature simulation, so that blocked springs don't continually change temperature
- Doors and hatches can now be left open with a new "leave open" checkbox
  - The door will not automatically open when changed, but rather will stay open after an explorer opens the door
- Gas vents and liquid vents can now be manually closed by explorers
- The resource counter now includes data chips and artefacts currently in research desks
- Coal generators and hydrogen generators will now automatically limit resource consumption and power generation to match the demands of the connected network
  - However this will only work as long as there is at least one power consumer on the network (including batteries)
- Simulation fixes
  - Fixed a bug where liquids would not spread out horizontally if they were on top of a solid tile
  - Fixed a bug where a cell with an impassable building (like a tile) could still hold a gas if it was immediately above a liquid
  - Fixed a bug where a cell with a lot of liquid could get "stuck" next to a small amount of the same liquid if the cells were very close in mass
  - Fixed tiles not transferring heat with connected neighbouring tiles
  - Fixed plants' stored masses not transferring heat with the plant itself (e.g. oxybell plants)
  - Fixed a bug where masses stored within an object in a vacuum would not transfer heat with the building itself
- Fixed a simulation bug where power storage was incorrectly charging, discharging, and displaying at 1/24th the intended value
  - Batteries now store 120 Wd (was 5 Wd), but will otherwise charge and discharge at the same rate

### Performance

- Improved the performance of the element simulation
- Improved rendering performance of buried objects within fog of war
- Improved rendering performance in-between simulation frames
- Improved the refresh performance of the new game screen
- Significantly improved the rendering performance of buildings and tilesets
- Significantly improved the rendering performance of power, gas, liquid, and circuit network overlays when open
- Generally improved rendering performance everywhere
- Reduced memory usage, particularly for worlds with thousands of buildings
- Reduced the maximum number of save files listed in the save/load dialog from 100 to 50

### Balance

- Updated world generation
  - World generation now generates a lot more magma mass, to keep the lower levels liquid and hotter for longer
  - Solid element generation (except for transmitite) is now affected by the difficulty level (e.g. 50% on difficult)
  - Rock generated around the crashed ship is now only granite, so that the game doesn't have to introduce multiple building materials so early
  - Tweaked world generation parameters to generate slightly more interesting and distinct areas
  - A single relic will now generate close to the crashed ship site
  - Decreased minimum depth for relic generation to 25% (was 33%)
  - Increased the minimum number of objects attempted to generate in a new world (including ruins)
  - Increased oxygen pocket generation in dirt and start biomes to 10-20 kg/cell (was 2-5 kg/cell)
  - The glacier biome can now generate hydrogen and oxygen pockets
  - Increased the number of artefacts generated at balanced and higher difficulty levels
- Updated explorer buffs
  - Reduced explorer base happiness from 75% to 65% to balance out the positive impacts of personal bedrooms
  - "Sad" buff decreases building speed by 10%, "happy" buff increases building speed by 10%
  - "Lit up" buff now increases movement speed by 20% (was 40%), and now increases building speed by 10%
  - "Starving" debuff now decreases movement/working speed by 30% (was 40%), and decreases building speed by 20%
  - "Near nature" buff for nature lovers now only applies from nearby plants if the plants are not dead
  - "Near relic" buff now increases happiness by 10% (was 5%), reduced nearby relic range to 8 cells (was 10), and no longer occurs from relics stored in storage boxes
- Reduced all explorer movement speeds by 5% to make the game a little bit less intense
- Reduced random event chance across all difficulty levels
  - Relaxed and balanced: -50%
  - Difficult: -31%
  - Hardcore: -25%
- Updated internal event budget increases from each type of world action
  - Test frequency: increased from once every 0.1 days to 0.214 days
  - Digging: increase from 0.002 to 0.0024 per newly dug tile
  - Passage of time: increased from 0 to 0.02 per world day
  - Total digging: reduced from 0.0001 to 0.00005 per total cells dug
  - Artefacts: increased from 0.04 to 0.05 per artefacts unburied
- Explorer dig speed is now proportional to the mass being dug out from a cell
  - Minimum cell dig time is now 0.25 seconds (less than 250 kg)
  - Maximum cell dig time is now 5.0 seconds (greater than 5000 kg)
  - This should make it much faster to clean up the remnants of meteors and meteor showers
- Reduced base explorer dig and build speeds by 20%, increased build speeds of wires and pipes by 20%
- Reduced number of cells contained in a meteor from an average of 15 to 9 (at default difficulty)
- Reduced number of cells contained in a meteorite from an average of 6 to 4 (at default difficulty)
- Reduced world generation resources multiplier in relaxed difficulty from 4x to 2x
- Reduced glowrose plant temperature range from (0 ~ 120 C) to (10 ~ 40 C)
- Added new "manufactured" element type
- Added new "structural solid" element type, which is any rock or any metal
- Beds can now be built out of any structural solid, allowing you to create iron or gold beds
- Glass created in the glass furnace no longer has a minimum temperature of 500°C
- Glass is no longer a valid meteor/meteor shower element
- Cryochamber revival now requires 5kg of each glowrose (was 2kg), and are also now affected by difficulty levels
- Increased the crashed ship ambient temperature from 15 C to 25 C
- Increased tree building requirements from 100kg dirt to 200kg dirt
- Increased battery charge rate from 250 W to 500 W, so that one coal generator can charge a battery at 100%
- Increased base explorer liquid disintegration rate from 1kg/sec to 2kg/sec
- Increased the minimum time between diary entries from 1.0 days to 1.4 days
- Reduced oxygen generator productivity by 50%, so that you can't finish the game with just one oxygen generator
- Reduced burn oxycan recipe additional temperature to 30 K (was 100 K)
- Increased crashed ship supply goals
  - Oxygen: From 250kg to 500kg (default difficulty)
  - Coralite: From 200kg to 400kg (default difficulty)
- Refinement buildings that have not yet selected a recipe, or are missing enough resources to operate, no longer consume power
- Updated research requirements for some buildings
  - Display stand now requires comfort research (was alien research)
  - Wire bridge now requires advanced power research (was basic power research)
  - Salt lamp now requires comfort research (was automation research)
- Added lost thought bubble and top overlay icon to stranded explorers
- Added idle top overlay icon to explorers with nothing to do
- Explorers will now pick up to 3kg of food when hungry (was 2kg), so they're not hungry once they finish eating
- Reduced the minimum time between explorers with no currently assigned bed looking for new beds from 0.1 days to 0.05 days
- Reduced explorers' default temperature to 30 C (was 35 C), initial oxygen temperature to 25 C (was 35 C)

### Accessibility

- Moved accessibility options into a new "Accessibility" options tab
- Added "not connected to liquid/gas network" overlay icons to the oxygen generator, liquid and gas pumps, filters, and vents
- The escape menu now lists "return to game" at the top of the menu, and is highlighted in green
- Instead of "not accessible" and "not suppliable", the pending build errand dialog now says "nobody can reach this" and "can't find resource"
- Added screen shake intensity option
- Right click to unselect sensitivity is no longer 0 pixels, but defaults to 5px, to make this unselect method a bit more forgiving
  - Added option to control right click sensitivity distance
- Increased the interactable bounds of a range slider dot
- Added "fast camera" option and associated keyboard shortcut (default: `Shift`)
  - For example, the camera will move north much faster with `Shift`+`W` than just `W`
- Turned off edge panning when moving the camera with the mouse in fullscreen mode, as it was confusing

### Quality of life

- Added custom selected building dialogs for transmitter and distress beacons
- Connective buildings (such as pipes and wires) can now be replaced with new build errands using different primary elements, and existing connections will be retained
- When a context-sensitive overlay layer is selected (power, liquid, gas, automation), pending buildings in that layer are now rendered above actual buildings, to make replacing existing networks easier
- Selecting an explorer will now also render their current movement path/goal with a faint white line
  - This can be turned off in the Options, "Show explorer paths"
- (Experimental) Temperature values for automation can now be entered in your selected temperature unit (Fahrenheit, Kelvin, etc.) rather than only Celsius
- (Experimental) Mass values for automation can now be entered in your selected mass unit (metric, imperial, etc.) rather than only kg
- When a building has a selected recipe, any input and output masses not relevant to that recipe are no longer displayed in the selected building panel
  - For example, selecting "filter salt water" on the liquid refinery no longer displays "piped in gas" or "supplied solid" masses, since that recipe only uses a single liquid input
- Added pressure overlay (default = `Shift`+`F7`)
- The explorer dropdown list for assignable buildings (such as beds) now include an icon if that explorer is already assigned to a different building
- The pending build errand dialog now lists current and target masses together with red/green icons, making it easier to understand what's missing
- The game can now temporarily display global messages for a few seconds
  - When the game is saved (either manually or automatically), a "Game saved" message will now appear and fade out
- Some buildings now include progress %s in their selected building panel
  - A research desk will show current research progress %
  - Lights and salt lamps will show current light output %
- Selecting a research node in the research tree now highlights ALL unmet prerequisites
- Added the option to display the real world time in the top right
- Added "needs transmitite" overlay icon for transmitter
- The research tree button to start research now uses "missing desk" when there is no research desk in the world
- Oxygen candle holders now display a "no oxycans available" overlay icon if no oxycans are accessible

### Internal

- Updated CHARLI to Update 2
  - CHARLI notifications for random event triggers can now be permanently ignored ("don't remind me again") per save file, but active new events will still be listed, and the guides can still be opened
  - Added a new CHARLI guide for automation and building your first circuit network
  - Extended the "explorer died" guide with more guidance for unlocking revival research
  - Extended the "high pressure" guide with more guidance and multiple steps for reducing and managing pressure
  - Extended the "low oxygen" permament guide with more guidance about the need for long-term oxygen generation
  - Changed "jump to location" link for the "seed self planted" guide to "jump to pant", which automatically selects the new plant
  - Changed "jump to location" link for transmitter guides to "jump to building"
  - Changed "jump to location" links for spring guides to "jump to spring"
  - Selecting an explorer in CHARLI now zooms in the camera and follows the explorer
  - CHARLI cutscenes featuring explorers now play explorer sounds rather than CHARLI sounds
  - Added CHARLI guides for first uncovered relic, explorer having tantrum
  - CHARLI now has more than 60 guides and 200 steps
- In-game database improvements
  - Added icons to all liquids and gases
  - Added room types
  - Added homelands
  - Item types now list all recipes they can be used in
  - Building types now list their default build speed
  - Oxygen, pipes, and wire pages now include the overlay keyboard shortcut to open that overlay
- Homelands are now clickable in a selected explorers' properties tab
- When there's nothing to do, explorers will now sometimes perform short idle animations
- Added animations to solar panels
- Added screen shake to meteors, cargo pods, and crashing ships
- Replaced the darkness renderer with a higher performance, and better looking, renderer
- Added new "temperature" building category
- Refreshed the liquid and gas filter building animations
- Clicking on an explorer in the new game panel now plays a sound
- Added more descriptive labels to all raw element piles and items
- Background stars, liquid shaders, and other rendering effects will now pause while the game is paused
- If a build errand is placed while paused, the game will now display it as "unknown accessibility" and render it with white, until at least one simulation frame has passed
- The tooltip for building errands with multiple elements now displays "element/..." rather than just the primary element
- Renamed "Automatically open all CHARLI events" to "Always show tutorials", to more clearly describe what the checkbox does
- Windowed fullscreen is now the default fullscreen mode on Windows (exclusive fullscreen still seems to work better on Mac)
- Save games will now always be paused when loaded, so that autosaves behave the same as manual saves
- If continuous music is not enabled and no music is playing, completing a research node will now trigger a new music track
- Cryochambers can now be assigned to specific explorers
  - If a cryochamber is unassigned, it will automatically be assigned to a dead explorer that does not already have a cryochamber assigned
  - If a cryochamber is storing an explorer and the assignment is changed, the explorer will be automatically ejected

### Fixes

- Fixed pending tile build errands not rendering as a connected tileset
- Fixed a number of empty or blank diary entries
- Fixed a bug where animated buildings could clip each other depending on the order that they were built
- Fixed the temperature sensor displaying incorrect current values
- Fixed a crash that could occur if unexpected keycodes were pressed
- Fixed the game trying to highlight the next selectable object while trying to place a building blueprint
- Fixed oxycans being a valid source of salt for refining glass in furnaces
- Fixed deconstructing a building made out of multiple elements (such as a cryochamber) not returning all of the elements used in its construction
- Fixed the "advanced research" research node saying that it unlocked artefact research in the research tree, when artefact research is actually unlocked by the "alien research" node
- Fixed selecting a research node requirement in the research information panel not immediately refreshing the research tree layout
- The selected building panel for the crashed ship no longer lists "solid coralite", but instead just lists "coralite"
- Fixed tutorials not being listed in CHARLI's menu if the "Automatically open all CHARLI events" option was turned off
- Fixed CHARLI tutorials saying "press Escape to close the overlay", which would close CHARLI, instead of the overlay
- Fixed the light building not displaying the north connective edge while placing a build errand
- Fixed the select material dropdown in the build panel not always being up-to-date
- Fixed meteors and cargo pods being able to spawn in impassable tiles at the top of the world
- Fixed a very unlikely crash that could occur when trying to calculate building foundations across a multithreaded simulation boundary
- Fixed (missing resources) text sometimes being cut off in the tile information tooltip
- Fixed tooltips rendering behind the highlighted UI element renderer
- Fixed main menu music fading in and out a little bit while going through the screens of starting a new game
- Fixed biome ambiences playing while on the new game dialogs
- Fixed a solar panel being in "working" mode when light levels were between 0 and 1 lux
- Fixed the game being interactable in the padding around CHARLI's dialog
- Fixed "transmitter waiting" CHARLI step temporarily disappearing during the night if no buildings were consuming power during the night
- Fixed vertical alignment of radio buttons in the building properties of automation comparators
- An open dropdown will now automatically close when its parent dialog is closed, preventing a bunch of possible crashes
- Fixed a rare bug where explorer accessibility might not be immediately updated after deconstructing a building at the edge of a chunk boundary
- Fixed "unable to emit" CHARLI guide showing the wrong overlay icon
- Fixed inconsistent punctuation in CHARLI event tooltips
- Fixed long stack traces in the error dialog not word wrapping
- Fixed doors, hatches, and gas tanks being buildable from a distance, but not deconstructable from a distance
- Fixed the "build a ladder" stage of CHARLI's initial tutorial sometimes having a gap in the highlighted world area
- Fixed minor texture filtering artifacts in the tile tileset
- Fixed "research" button on research desks being the wrong font size
- Fixed pending cell errands (e.g. dig) rendering behind the darkness shader
- Fixed world ambience playing quietly in the new game screen
- Fixed a research desk being supplied by 0.1kg of data chips at a time – explorers will now supply 1kg of data chips at a time
- Fixed the game camera continuing to move in the background while the escape menu was open
