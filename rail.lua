minetest.register_node("mydeck:rail", {
	description = "Deck Rail",
	tiles = {
		"mydeck_hwood.png",
		"mydeck_hwood.png",
		"mydeck_hwood.png^mydeck_rwood_ol.png",
		"mydeck_hwood.png^mydeck_rwood_ol.png",
		"mydeck_hwood.png^mydeck_rwood_ol.png",
		"mydeck_hwood.png^mydeck_rwood_ol.png",
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
			{-0.5, -0.5, 0.3125, -0.4375, 0.375, 0.5}, 
			{-0.5, 0.375, 0.25, 0.5, 0.5, 0.5},
			{0.4375, -0.5, 0.3125, 0.5, 0.5, 0.5}, 
			{-0.5, -0.375, 0.3125, 0.5, -0.25, 0.5}, 
			{-0.375, -0.25, 0.375, -0.3125, 0.375, 0.4375}, 
			{-0.25, -0.25, 0.375, -0.1875, 0.375, 0.4375}, 
			{0.3125, -0.25, 0.375, 0.375, 0.375, 0.4375}, 
			{0.1875, -0.25, 0.375, 0.25, 0.375, 0.4375}, 
			{0.0625, -0.25, 0.375, 0.125, 0.375, 0.4375}, 
			{-0.125, -0.25, 0.375, -0.0625, 0.375, 0.4375},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.3125, 0.5, 0.5, 0.5},
		}
	}
})
minetest.register_node("mydeck:rail_corner", {
	description = "Deck Rail Corner",
	tiles = {
		"mydeck_hwood.png",
		"mydeck_hwood.png",
		"mydeck_hwood.png^mydeck_rwood_ol.png",
		"mydeck_hwood.png^mydeck_rwood_ol.png",
		"mydeck_hwood.png^mydeck_rwood_ol.png",
		"mydeck_hwood.png^mydeck_rwood_ol.png",
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
			{-0.5, -0.5, 0.3125, -0.4375, 0.375, 0.5}, 
			{-0.5, 0.375, 0.25, 0.5, 0.5, 0.5}, 
			{0.3125, -0.5, 0.3125, 0.5, 0.5, 0.5}, 
			{-0.5, -0.375, 0.3125, 0.5, -0.25, 0.5}, 
			{-0.375, -0.25, 0.375, -0.3125, 0.375, 0.4375}, 
			{-0.25, -0.25, 0.375, -0.1875, 0.375, 0.4375}, 
			{0.1875, -0.25, 0.375, 0.25, 0.375, 0.4375}, 
			{0.0625, -0.25, 0.375, 0.125, 0.375, 0.4375}, 
			{-0.125, -0.25, 0.375, -0.0625, 0.375, 0.4375},
			{0.3125, -0.5, -0.5, 0.5, 0.5, -0.4375}, 
			{0.3125, -0.375, -0.5, 0.5, -0.25, 0.5}, 
			{0.25, 0.375, -0.5, 0.5, 0.5, 0.5}, 
			{0.375, -0.25, -0.375, 0.4375, 0.375, -0.3125}, 
			{0.375, -0.25, -0.25, 0.4375, 0.375, -0.1875}, 
			{0.375, -0.25, -0.125, 0.4375, 0.375, -0.0625}, 
			{0.375, -0.25, 0.1875, 0.4375, 0.375, 0.25}, 
			{0.375, -0.25, 0.0625, 0.4375, 0.375, 0.125}, 
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.3125, 0.5, 0.5, 0.5},
			{0.3125, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
	}
})
minetest.register_node("mydeck:rail_icorner", {
	description = "Deck Rail Corner",
	tiles = {
		"mydeck_hwood.png",
		"mydeck_hwood.png",
		"mydeck_hwood.png^mydeck_rwood_ol.png",
		"mydeck_hwood.png^mydeck_rwood_ol.png",
		"mydeck_hwood.png^mydeck_rwood_ol.png",
		"mydeck_hwood.png^mydeck_rwood_ol.png",
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
			{0.3125, -0.5, 0.4375, 0.5, 0.375, 0.5}, 
			{0.4375, -0.5, 0.3125, 0.5, 0.375, 0.4375}, 
			{0.25, 0.375, 0.25, 0.5, 0.5, 0.5}, 
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{0.3125, -0.5, 0.4375, 0.5, 0.375, 0.5}, 
			{0.4375, -0.5, 0.3125, 0.5, 0.375, 0.4375},
			{0.25, 0.375, 0.25, 0.5, 0.5, 0.5}, 
		}
	}
})









