## Creating Custom Charts
The Brookie Chart Visualizer is made with the intention of allowing custom files to be visualized, instead of only allowing the hard coded default shows.

This section is a guide on creating custom files for individual songs, as well as full show movements.

### Individual Songs
For this visualizer, charts are stored in files marked with the *.CHART file extension. These files are just JSON structures.

`"G13_charts":[
    {
      "counts":0.0,
      "side":1.0,
      "front_back_marker":1.0,
      "front_back_steps":-6.0,
      "yard_line":20.0,
      "outside_inside_steps":2.0
    },
    ...
],
"G13_symbol":"^",
"G13_type":1.0,
"G13_instrument":11,`

The "chart" attribute is self-explanatory, though it does need to reference this list of front-back markers to be usable.

0. front_hash,
1. back_hash,
2. front_sideline,
3. back_sideline

"symbol" is also self-explanatory. These can be pulled directly from the coordinate sheets. But "type" and "instrument" need to be implied.

In this example, `G13` is a member of the Colorguard, so their "type" and "instrument" need to be set accordingly (Colorguard and Majorette techincally don't need to have an instrument set, but it helps keep consistancy.)

Both values are enumerated as follows:

instrument:

0. none,
1. alto_sax,
2. baritone_horn,
3. clarinet,
4. trombone,
5. flute,
6. mellophone,
7. battery_percussion,
8. tenor_sax,
9. tuba,
10. trumpet,
11. pole,
12. baton

type:

0. band,
1. colorguard,
2. majorette,
3. front_ensemble

(I normally just set front ensemble to use "battery_percussion" as their instrument, even though they're not battery).

If you have enough free time, you can absolutely plug in all the coordinates for an entire marching band manually, though it would take a lot of work. Trust me on that. I know.

The *.chart files store the positions of the marchers' dots.

Individual songs also require audio and song properties. These are stored as OGG Vorbis files and *.JSON structures respectively.
The [**Show Movements**](#show-movements) section details how these files are formatted.

## Show Movements
To create full show movements (like the examples on the main menu), the steps are relatively simple.

Shows are stored as *.SHOW files, which are effectively renamed *.ZIP archives.

These files contain two folders: "charts" and "music".

"charts" contains the *.CHART files for each of the movements.

"music" contains the properties and audio for each of the songs. Song audio is stored in the OGG Vorbis format, edited to stay at a constant tempo. Music properties are stored as *.JSON structures that state the song's tempo and time signature.

The *.show file also contains a *.JSON structure giving the file paths and information for each of the songs.

`{
  "name": "Four Elements",
  "songs" : [
	{
		"name" : "Sylva Drill 2026 Mov 1",
		"chart" : "charts/part_one_earth.chart",
		"music" : "music/part_one_earth_const.ogg",
		"properties": "music/part_one_earth.json"
	},
	{
		"name" : "Sylva Drill 26 Mov 2",
		"chart" : "charts/part_two_water.chart",
		"music" : "music/part_two_water.ogg",
		"properties": "music/part_two_water.json"
	},
	{
		"name" : "Sylva Drill 26 Mov 3",
		"chart" : "charts/part_three_air.chart",
		"music" : "music/part_three_air_const.ogg",
		"properties": "music/part_three_air.json"
	},
	{
		"name" : "Sylva Drill 26 Mov 4",
		"chart" : "charts/part_four_fire_finale.chart",
		"music" : "music/part_four_fire_finale.ogg",
		"properties": "music/part_four_fire_finale.json"
	},
  ]
}`
