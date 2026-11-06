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
uniform_variant = global.preferences.uniform;

enum uniforms {
	normal,
	_2025,
	summer,
	raincoat
}

uniform_variants = {
	normal: {
		band: 0,
		front_ensemble: 0,
		colorguard: 0,
		majorette: 0
	},
	_2025:  {
		band: 0,
		front_ensemble: 0,
		colorguard: 1,
		majorette: 0
	},
	summer: {
		band: 10,
		front_ensemble: 10,
		colorguard: 2,
		majorette: 0
	},
	raincoat: {
		band: 11,
		front_ensemble: 11,
		colorguard: 3,
		majorette: 1
	}
}

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