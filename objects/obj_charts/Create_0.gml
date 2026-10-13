type = marchers.colorguard;

symbol = "^";
label = "G13"

song_name = "";
show = false;

chart_export_cleanup = false;
chart_export_path = ""

charts_exported = true;

colors = global.preferences.color_marchers;
labels = global.preferences.label_marchers;

charts = [
	{
		counts: 0,
		side: 1,
		front_back_marker: front_back.back_hash,
		front_back_steps: -6, //negative values mean behind
		yard_line: 20,
		outside_inside_steps: 2, //negative values mean outside
	},
	{
		counts: 36,
		side: 1,
		front_back_marker: front_back.back_hash,
		front_back_steps: -6, //negative values mean behind
		yard_line: 20,
		outside_inside_steps: 2, //negative values mean outside
	},
	{
		counts: 16,
		side: 1,
		front_back_marker: front_back.back_hash,
		front_back_steps: -6, //negative values mean behind
		yard_line: 20,
		outside_inside_steps: 2, //negative values mean outside
	},
	{
		counts: 16,
		side: 1,
		front_back_marker: front_back.back_hash,
		front_back_steps: -6, //negative values mean behind
		yard_line: 20,
		outside_inside_steps: 2, //negative values mean outside
	},
	{
		counts: 16,
		side: 1,
		front_back_marker: front_back.back_hash,
		front_back_steps: -6, //negative values mean behind
		yard_line: 20,
		outside_inside_steps: 2, //negative values mean outside
	},
	{
		counts: 24,
		side: 1,
		front_back_marker: front_back.back_hash,
		front_back_steps: -4, //negative values mean behind
		yard_line: 15,
		outside_inside_steps: 2, //negative values mean outside
	},
	{
		counts: 56,
		side: 1,
		front_back_marker: front_back.back_hash,
		front_back_steps: -4, //negative values mean behind
		yard_line: 15,
		outside_inside_steps: 2, //negative values mean outside
	},
	{
		counts: 16,
		side: 1,
		front_back_marker: front_back.back_hash,
		front_back_steps: 5, //negative values mean behind
		yard_line: 20,
		outside_inside_steps: 0, //negative values mean outside
	},
	{
		counts: 24,
		side: 1,
		front_back_marker: front_back.back_hash,
		front_back_steps: 12, //negative values mean behind
		yard_line: 20,
		outside_inside_steps: 0, //negative values mean outside
	},
	{
		counts: 80,
		side: 1,
		front_back_marker: front_back.back_hash,
		front_back_steps: 12, //negative values mean behind
		yard_line: 20,
		outside_inside_steps: 0, //negative values mean outside
	},
]

chart = 0;
chart_old = 0;

step_width = 13;

fifty_yard = 1146; //x
yard_spacing = 21.1; //x

enum marchers {
	band,
	colorguard,
	majorette,
	front_ensemble
}

enum front_back {
	front_hash,
	back_hash,
	front_sideline,
	back_sideline,
	front_hash_ncaa,
	back_hash_ncaa
}

front_back_prop = [
	{ _y: 924, name: "Front Hash (HS)" },
	{ _y: 557, name: "Back Hash (HS)" },
	{ _y: 1293, name: "Front side line" },
	{ _y: 188, name: "Back side line" },
	{ _y: 872, name: "Front Hash (NCAA)" },
	{ _y: 608, name: "Back Hash (NCAA)" }
];

instrument = -1;

enum instruments {
	none,
	alto_sax,
	baritone_horn,
	clarinet,
	trombone,
	flute,
	mellophone,
	battery_percussion,
	tenor_sax,
	tuba,
	trumpet,
	pole,
	baton
}