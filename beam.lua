minetest.register_node("mydeck:beam", {
	description = "Beam",
	tiles = {
		"mydeck_hwood.png^[transformR90",
		"mydeck_hwood.png^[transformR90",
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
			{-0.125, -0.5, -0.5, 0.125, 0, 0.5}, 
		}
	},
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		
		local node = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z})
		local nodeu = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
		local nodea = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name


		if nodeu == "mydeck:post" then
		   minetest.set_node(pos,{name = "mydeck:beam_wbracket", param2=minetest.dir_to_facedir(placer:get_look_dir())})
		end

		if nodea == "mydeck:joists" then
		   minetest.remove_node(pos)
		   minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z},{name = "mydeck:joists_beam", param2=node.param2})
		end

		if nodea == "mydeck:joists_side" then
		   minetest.remove_node(pos)
		   minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z},{name = "mydeck:joists_side_beam", param2=node.param2})
		end

		if nodea == "mydeck:deck_joists" then
		   minetest.remove_node(pos)
		   minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z},{name = "mydeck:deck_joists_beam", param2=node.param2})
		end

		if nodea == "mydeck:deck_joists_side" then
		   minetest.remove_node(pos)
		   minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z},{name = "mydeck:deck_joists_side_beam", param2=node.param2})
		end

		if nodeu == "mydeck:pile_wpost" then
		   minetest.set_node(pos,{name = "mydeck:beam_wbracket", param2=minetest.dir_to_facedir(placer:get_look_dir())})
		end
	end
})
minetest.register_node("mydeck:beam_wbracket", {
	description = "Beam with Bracket",
	tiles = {
		"mydeck_hwood.png^[transformR90^mydeck_beambt_ol.png",
		"mydeck_hwood.png^[transformR90^mydeck_beambt_ol.png",
		"mydeck_hwood.png^mydeck_beambs_ol.png",
		"mydeck_hwood.png^mydeck_beambs_ol.png",
		"mydeck_hwood.png^mydeck_beambf_ol.png",
		"mydeck_hwood.png^mydeck_beambf_ol.png",
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

minetest.register_node("mydeck:joists_beam", {
	description = "Deck Joists with Beam",
	tiles = {
		"mydeck_hwood.png^[transformR90",
		"mydeck_hwood.png",
		"mydeck_hwood.png",
		"mydeck_hwood.png",
		"mydeck_hwood.png",
		"mydeck_hwood.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
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

minetest.register_node("mydeck:joists_beam_wbracket", {
	description = "Deck Joists with Beam and Bracket",
	tiles = {
		"mydeck_hwood.png^[transformR90",
		"mydeck_hwood.png",
		"mydeck_hwood.png^mydeck_beambf_ol.png",
		"mydeck_hwood.png^mydeck_beambf_ol.png",
		"mydeck_hwood.png^mydeck_beambs_ol.png",
		"mydeck_hwood.png^mydeck_beambs_ol.png",
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
minetest.register_node("mydeck:joists_side_beam", {
	description = "Deck Joists side with Beam",
	tiles = {
		"mydeck_hwood.png^[transformR90",
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
minetest.register_node("mydeck:joists_side_beam_wbracket", {
	description = "Deck Joists side with Beam and Bracket",
	tiles = {
		"mydeck_hwood.png^[transformR90",
		"mydeck_hwood.png",
		"mydeck_hwood.png^mydeck_beambf_ol.png",
		"mydeck_hwood.png^mydeck_beambf_ol.png",
		"mydeck_hwood.png^mydeck_beambs_ol.png",
		"mydeck_hwood.png^mydeck_beambs_ol.png",
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

minetest.register_node("mydeck:deck_joists_beam", {
	description = "Deck Joists with Beam",
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

minetest.register_node("mydeck:deck_joists_beam_wbracket", {
	description = "Deck Joists with Beam with Bracket",
	tiles = {
		"mydeck_hwood.png",
		"mydeck_hwood.png",
		"mydeck_hwood.png^mydeck_beambf_ol.png",
		"mydeck_hwood.png^mydeck_beambf_ol.png",
		"mydeck_hwood.png^mydeck_beambs_ol.png",
		"mydeck_hwood.png^mydeck_beambs_ol.png",
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

minetest.register_node("mydeck:deck_joists_side_beam", {
	description = "Deck Joists side with Beam",
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
minetest.register_node("mydeck:deck_joists_side_beam_wbracket", {
	description = "Deck Joists side with Beam with Bracket",
	tiles = {
		"mydeck_hwood.png",
		"mydeck_hwood.png",
		"mydeck_hwood.png^mydeck_beambf_ol.png",
		"mydeck_hwood.png^mydeck_beambf_ol.png",
		"mydeck_hwood.png^mydeck_beambs_ol.png",
		"mydeck_hwood.png^mydeck_beambs_ol.png",
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
