minetest.register_node("mydeck:deck_boards", {
	description = "Deck Boards",
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
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1,stain=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.375,  0.2725, 0.5, -0.5,  0.5}, 
			{-0.5, -0.375,  0.0225, 0.5, -0.5,  0.25}, 
			{-0.5, -0.375, -0.2275, 0.5, -0.5,  0}, 
			{-0.5, -0.375, -0.4775, 0.5, -0.5, -0.25}, 
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.375,  -0.5, 0.5, -0.5,  0.5}, 
		}
	},


	after_place_node = function(pos, placer, itemstack, pointed_thing)
		
		local deck = minetest.get_node({x=pos.x, y=pos.y, z=pos.z}).name
		local node = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z})
		local nodeu = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name

		
		if nodeu == "mydeck:joists" then
		   minetest.remove_node(pos)
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:deck_joists", param2=node.param2})
		end
		if nodeu == "mydeck:joists_side" then
		   minetest.remove_node(pos)
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:deck_joists_side", param2=node.param2})
		end
		if nodeu == "mydeck:joists_beam" then
		   minetest.remove_node(pos)
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:deck_joists_beam", param2=node.param2})
		end

		if nodeu == "mydeck:joists_side_beam" then
		   minetest.remove_node(pos)
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:deck_joists_side_beam", param2=node.param2})
		end

		if nodeu == "mydeck:joists_end" then
		   minetest.remove_node(pos)
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:deck_joists_end", param2=node.param2})
		end

		if nodeu == "mydeck:joists_side_end" then
		   minetest.remove_node(pos)
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:deck_joists_side_end", param2=node.param2})
		end

		if nodeu == "mydeck:joists_endr" then
		   minetest.remove_node(pos)
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:deck_joists_endr", param2=node.param2})
		end

		if nodeu == "mydeck:joists_side_endr" then
		   minetest.remove_node(pos)
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:deck_joists_side_endr", param2=node.param2})
		end

		if nodeu == "mydeck:joists_beam_wbracket" then
		   minetest.remove_node(pos)
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:deck_joists_beam_wbracket", param2=node.param2})
		end

		if nodeu == "mydeck:joists_side_beam_wbracket" then
		   minetest.remove_node(pos)
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:deck_joists_side_beam_wbracket", param2=node.param2})
		end

		if nodeu == "mydeck:beam" then
		   minetest.remove_node(pos)
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:deck_beam", param2=node.param2})
		end
	end,

})
minetest.register_node("mydeck:deck_beam", {
	description = "Deck on Beam",
	tiles = {
		"mydeck_hwood.png",
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
	sounds = default.node_sound_wood_defaults(),	drop = {
		max_items = 2,
		items = {
			{
			items = {"mydeck:deck_boards"},
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
			{-0.125, -0.5, -0.5, 0.125, -0.125, 0.5}, 
			{-0.5, 0,  0.2725, 0.5, -0.125,  0.5}, 
			{-0.5, 0,  0.0225, 0.5, -0.125,  0.25}, 
			{-0.5, 0, -0.2275, 0.5, -0.125,  0}, 
			{-0.5, 0, -0.4775, 0.5, -0.125, -0.25},
		}
	},
})
minetest.register_node("mydeck:deck_joists", {
	description = "Deck Joists",
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
		max_items = 2,
		items = {
			{
			items = {"mydeck:deck_boards"},
			},
			{
			items = {"mydeck:joists"},
			},
		}
		},

	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, -0.375, 0.375, 0.5}, 
			{0, 0, -0.5, 0.125, 0.375, 0.5}, 
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
		}
	},
})

minetest.register_node("mydeck:deck_joists_side", {
	description = "Deck Joists Side",
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
		max_items = 2,
		items = {
			{
			items = {"mydeck:deck_boards"},
			},
			{
			items = {"mydeck:joists_side"},
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
		}
	},
})


minetest.register_node("mydeck:deck_joists_end", {
	description = "Deck Joists with End Plate",
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
		max_items = 2,
		items = {
			{
			items = {"mydeck:deck_boards"},
			},
			{
			items = {"mydeck:joists_end"},
			},
		}
		},
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, -0.375, 0.375, 0.5}, 
			{0, 0, -0.5, 0.125, 0.375, 0.5}, 
			{-0.5, 0, 0.375, 0.5, 0.375, 0.5}, 
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
		}
	},
})

minetest.register_node("mydeck:deck_joists_side_end", {
	description = "Deck Joists Side with End Plate",
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
		max_items = 2,
		items = {
			{
			items = {"mydeck:deck_boards"},
			},
			{
			items = {"mydeck:joists_side_end"},
			},
		}
		},
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, -0.375, 0.375, 0.5}, 
			{0, 0, -0.5, 0.125, 0.375, 0.5}, 
			{-0.5, 0, -0.5, 0.5, 0.375, -0.375}, 
			{0.375, 0, -0.5, 0.5, 0.375, 0.5}, 
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
		}
	},
})

minetest.register_node("mydeck:deck_joists_endr", {
	description = "Deck Joists Side with Wall Plate",
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
		max_items = 2,
		items = {
			{
			items = {"mydeck:deck_boards"},
			},
			{
			items = {"mydeck:joists_endr"},
			},
		}
		},
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, -0.375, 0.375, 0.5}, 
			{0, 0, -0.5, 0.125, 0.375, 0.5}, 
			{-0.5, 0, -0.5, 0.5, 0.375, -0.375}, 
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
		}
	},
})

minetest.register_node("mydeck:deck_joists_side_endr", {
	description = "Deck Joists Side with Wall Plate",
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
		max_items = 2,
		items = {
			{
			items = {"mydeck:deck_boards"},
			},
			{
			items = {"mydeck:joists_side_endr"},
			},
		}
		},
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, -0.375, 0.375, 0.5}, 
			{0, 0, -0.5, 0.125, 0.375, 0.5}, 
			{-0.5, 0, 0.5, 0.5, 0.375, 0.375}, 
			{0.375, 0, -0.5, 0.5, 0.375, 0.5}, 
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
		}
	},
})
