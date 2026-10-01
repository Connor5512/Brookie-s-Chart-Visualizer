# Brookie's Chart Visualizer
- An experimental marching band coordinate visualizer.

I got extremely bored one day, so to challenge myself, I decided to make a visualizer for marching band coordinates. As a member of my school's competition marching band, I wanted to have some sort of visual for what we are supposed to look like on the field.

Of course, tools for this sort of thing already exist, but those are paid software that also include functionality to create charts (after all, that _is_ what they're primarily supposed to be used for). But as a broke high school student, I didn't want to have to resort to purchasing software that I would never use ever again.

So instead, I made this program.

## Reading the Field
For those unfamiliar with marching band, we use the coordinate system to tell each member where on the field they are supposed to go. These sets of coordinates are called "charts" or "sets" depending on the band director, though coordinate sheets will almost always list them as "Sets". Individual charts for each marcher are referred to as "dots." 

![Example coordinate sheet](example-coordinate-sheet.png)

The first part of the chart tells how many counts it should take to arrive at a dot.

The second part of a chart tells which side of the field the marcher is positioned on. Think of reading a book. Side 1 means the marcher is on the left side of the field (when looked at from the home stands), and Side 2 means the marcher is on the right side.

The third part of the chart tells how many steps inside or outside of a yard line the marcher is. Inside means toward the 50 yard line in the center of the field, and outside means away from it. The step size can vary depending on the chart, but it almost always refers to an 8:5 step size (8 steps per 5 yards).

The last part of the chart tells how far forwards or backwards the marcher is, using the sidelines and hashes as reference. "Front" means closer to the home stands, and "Back" means further from them.

While individual dots don't do much on their own, they can form pictures and imagery when in combination with other members.

![Example chart](example-chart.png)

## File Formats
For this visualizer, charts are stored in files marked with the *.BRCV file extension. These files are just JSON structures.

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

as is "symbol". Both can be pulled directly from the coordinate sheets. But "type" and "instrument" need to be implied.

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
