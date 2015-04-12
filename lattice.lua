minetest.register_node("mydeck:lattice", {
	description = "Lattice",
	tiles = {
		"mydeck_hwood.png",
		"mydeck_hwood.png",
		"mydeck_hwood.png",
		"mydeck_hwood.png",
		"mydeck_hwood.png",
		"mydeck_hwood.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.4375, -0.375, 0.5,   0.5}, -- NodeBox1
			{-0.3125, -0.5, 0.4375, -0.25, 0.5,    0.5}, -- NodeBox2
			{-0.1875, -0.5, 0.4375, -0.125, 0.5,   0.5}, -- NodeBox3
			{-0.0625, -0.5, 0.4375, 0, 0.5,        0.5}, -- NodeBox4
			{0.0625, -0.5,  0.4375, 0.125, 0.5,    0.5}, -- NodeBox5
			{0.1875, -0.5,  0.4375, 0.25, 0.5,     0.5}, -- NodeBox6
			{0.3125, -0.5,  0.4375, 0.375, 0.5,    0.5}, -- NodeBox7
			{0.4375, -0.5,  0.4375, 0.5, 0.5,      0.5}, -- NodeBox8

			{-0.5, -0.5,    0.375, 0.5, -0.4375, 0.4375}, -- NodeBox9
			{-0.5, -0.375,  0.375, 0.5, -0.3125, 0.4375}, -- NodeBox10
			{-0.5, -0.25,   0.375, 0.5, -0.1875, 0.4375}, -- NodeBox11
			{-0.5, -0.125,  0.375, 0.5, -0.0625, 0.4375}, -- NodeBox12
			{-0.5, 0,       0.375, 0.5, 0.0625,  0.4375}, -- NodeBox13
			{-0.5, 0.125,   0.375, 0.5, 0.1875,  0.4375}, -- NodeBox14
			{-0.5, 0.25,    0.375, 0.5, 0.3125,  0.4375}, -- NodeBox15
			{-0.5, 0.375,   0.375, 0.5, 0.4375,  0.4375}, -- NodeBox16
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.5, 0.5, 0.5, 0.375},
			}
		},
})

