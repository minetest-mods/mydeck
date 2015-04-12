minetest.register_node("mydeck:beams", {
	description = "Beam",
	tiles = {
		"mydeck_hwood.png^[transformR90^mydeck_tint1.png",
		"mydeck_hwood.png^[transformR90^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = "mydeck:beam",
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.5, 0.125, 0, 0.5}, 
		}
	},
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		
		local node = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name


		if node == "mydeck:post" then
		   minetest.set_node(pos,{name = "mydeck:beam_wbracket", param2=minetest.dir_to_facedir(placer:get_look_dir())})
		end
	end
})
minetest.register_node("mydeck:beam_wbrackets", {
	description = "Beam with Bracket",
	tiles = {
		"mydeck_hwood.png^mydeck_tint1.png^[transformR90^mydeck_beambt_ol.png",
		"mydeck_hwood.png^mydeck_tint1.png^[transformR90^mydeck_beambt_ol.png",
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_beambs_ol.png",
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_beambs_ol.png",
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_beambf_ol.png",
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_beambf_ol.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = "mydeck:beam",
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125,  -0.5, -0.5,    0.125,   0,      0.5}, 
			{0.125,   -0.5, -0.125,  0.1875, -0.1875, 0.125}, 
			{-0.1875, -0.5, -0.125, -0.125,  -0.1875, 0.125}, 
		}
	}
})

minetest.register_node("mydeck:joists_beams", {
	description = "Deck Joists with Beam",
	tiles = {
		"mydeck_hwood.png^[transformR90^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = {
		max_items = 2,
		items = {
			{
			items = {"mydeck:joists"},
			},
			{
			items = {"mydeck:beam"},
			},
		}
		},

	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, -0.375, 0.375, 0.5},
			{0, 0, -0.5, 0.125, 0.375, 0.5}, 
			{-0.5, -0.5, -0.125, 0.5, 0, 0.125}, 
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0.5, 0.375, 0.5}, 
			{-0.5, -0.5, -0.125, 0.5, 0, 0.125}, 
		}
	},
})

minetest.register_node("mydeck:joists_beam_wbrackets", {
	description = "Deck Joists with Beam and Bracket",
	tiles = {
		"mydeck_hwood.png^[transformR90^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_beambf_ol.png",
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_beambf_ol.png",
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_beambs_ol.png",
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_beambs_ol.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = {
		max_items = 2,
		items = {
			{
			items = {"mydeck:joists"},
			},
			{
			items = {"mydeck:beam"},
			},
		}
		},

	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, -0.375, 0.375, 0.5},
			{0, 0, -0.5, 0.125, 0.375, 0.5}, 
			{-0.5, -0.5, -0.125, 0.5, 0, 0.125}, 

			{-0.125,  -0.5,  0.125,  0.125, -0.1875,  0.1875}, 
			{-0.125, -0.5, -0.1875, 0.125, -0.1875, -0.125},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0.5, 0.375, 0.5}, 
			{-0.5, -0.5, -0.125, 0.5, 0, 0.125}, 
		}
	},
})
minetest.register_node("mydeck:joists_side_beams", {
	description = "Deck Joists side with Beam",
	tiles = {
		"mydeck_hwood.png^[transformR90^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = {
		max_items = 2,
		items = {
			{
			items = {"mydeck:joists_side"},
			},
			{
			items = {"mydeck:beam"},
			},
		}
		},

	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, -0.375, 0.375, 0.5}, 
			{0, 0, -0.5, 0.125, 0.375, 0.5}, 
			{0.375, 0, -0.5, 0.5, 0.375, 0.5}, 
			{-0.5, -0.5, -0.125, 0.5, 0, 0.125}, 
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0.5, 0.375, 0.5}, 
			{-0.5, -0.5, -0.125, 0.5, 0, 0.125}, 
		}
	},
})
minetest.register_node("mydeck:joists_side_beam_wbrackets", {
	description = "Deck Joists side with Beam and Bracket",
	tiles = {
		"mydeck_hwood.png^[transformR90^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_beambf_ol.png",
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_beambf_ol.png",
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_beambs_ol.png",
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_beambs_ol.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = {
		max_items = 2,
		items = {
			{
			items = {"mydeck:joists_side"},
			},
			{
			items = {"mydeck:beam"},
			},
		}
		},

	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, -0.375, 0.375, 0.5}, 
			{0, 0, -0.5, 0.125, 0.375, 0.5}, 
			{0.375, 0, -0.5, 0.5, 0.375, 0.5}, 
			{-0.5, -0.5, -0.125, 0.5, 0, 0.125}, 
			{-0.125, -0.5, 0.125, 0.125, -0.1875, 0.1875}, 
			{-0.125, -0.5, -0.1875, 0.125, -0.1875, -0.125},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0.5, 0.375, 0.5}, 
			{-0.5, -0.5, -0.125, 0.5, 0, 0.125}, 
		}
	},
})

minetest.register_node("mydeck:deck_joists_beams", {
	description = "Deck Joists with Beam",
	tiles = {
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = {
		max_items = 3,
		items = {
			{
			items = {"mydeck:deck_boards"},
			},
			{
			items = {"mydeck:joists"},
			},
			{
			items = {"mydeck:beam"},
			},
		}
		},
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, -0.375, 0.375, 0.5}, 
			{0, 0, -0.5, 0.125, 0.375, 0.5},  
			{-0.5, -0.5, -0.125, 0.5, 0, 0.125}, 
			{-0.5, 0.375,  0.2725, 0.5, 0.5,  0.5}, 
			{-0.5, 0.375,  0.0225, 0.5, 0.5,  0.25}, 
			{-0.5, 0.375, -0.2275, 0.5, 0.5,  0}, 
			{-0.5, 0.375, -0.4775, 0.5, 0.5, -0.25},  
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, -0.125, 0.5, 0, 0.125},
		}
	},
})

minetest.register_node("mydeck:deck_joists_beam_wbrackets", {
	description = "Deck Joists with Beam with Bracket",
	tiles = {
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_beambf_ol.png",
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_beambf_ol.png",
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_beambs_ol.png",
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_beambs_ol.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = {
		max_items = 3,
		items = {
			{
			items = {"mydeck:deck_boards"},
			},
			{
			items = {"mydeck:joists"},
			},
			{
			items = {"mydeck:beam"},
			},
		}
		},
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, -0.375, 0.375, 0.5}, 
			{0, 0, -0.5, 0.125, 0.375, 0.5}, 
			{-0.5, -0.5, -0.125, 0.5, 0, 0.125}, 
			{-0.5, 0.375,  0.2725, 0.5, 0.5,  0.5}, 
			{-0.5, 0.375,  0.0225, 0.5, 0.5,  0.25}, 
			{-0.5, 0.375, -0.2275, 0.5, 0.5,  0}, 
			{-0.5, 0.375, -0.4775, 0.5, 0.5, -0.25},  
			{-0.125, -0.5, 0.125, 0.125, -0.1875, 0.1875}, 
			{-0.125, -0.5, -0.1875, 0.125, -0.1875, -0.125},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, -0.125, 0.5, 0, 0.125},
		}
	},
})

minetest.register_node("mydeck:deck_joists_side_beams", {
	description = "Deck Joists side with Beam",
	tiles = {
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = {
		max_items = 3,
		items = {
			{
			items = {"mydeck:deck_boards"},
			},
			{
			items = {"mydeck:joists_side"},
			},
			{
			items = {"mydeck:beam"},
			},
		}
		},
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, -0.375, 0.375, 0.5}, 
			{0, 0, -0.5, 0.125, 0.375, 0.5}, 
			{0.375, 0, -0.5, 0.5, 0.375, 0.5}, 
			{-0.5, -0.5, -0.125, 0.5, 0, 0.125}, 
			{-0.5, 0.375,  0.2725, 0.5, 0.5,  0.5}, 
			{-0.5, 0.375,  0.0225, 0.5, 0.5,  0.25}, 
			{-0.5, 0.375, -0.2275, 0.5, 0.5,  0}, 
			{-0.5, 0.375, -0.4775, 0.5, 0.5, -0.25}, 
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, -0.125, 0.5, 0, 0.125},
		}
	},
})
minetest.register_node("mydeck:deck_joists_side_beam_wbrackets", {
	description = "Deck Joists side with Beam with Bracket",
	tiles = {
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png",
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_beambf_ol.png",
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_beambf_ol.png",
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_beambs_ol.png",
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_beambs_ol.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = {
		max_items = 3,
		items = {
			{
			items = {"mydeck:deck_boards"},
			},
			{
			items = {"mydeck:joists_side"},
			},
			{
			items = {"mydeck:beam"},
			},
		}
		},
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, -0.375, 0.375, 0.5}, 
			{0, 0, -0.5, 0.125, 0.375, 0.5}, 
			{0.375, 0, -0.5, 0.5, 0.375, 0.5}, 
			{-0.5, -0.5, -0.125, 0.5, 0, 0.125}, 
			{-0.5, 0.375,  0.2725, 0.5, 0.5,  0.5}, 
			{-0.5, 0.375,  0.0225, 0.5, 0.5,  0.25}, 
			{-0.5, 0.375, -0.2275, 0.5, 0.5,  0}, 
			{-0.5, 0.375, -0.4775, 0.5, 0.5, -0.25},  
			{-0.125, -0.5, 0.125, 0.125, -0.1875, 0.1875}, 
			{-0.125, -0.5, -0.1875, 0.125, -0.1875, -0.125},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, -0.125, 0.5, 0, 0.125},
		}
	},
})
