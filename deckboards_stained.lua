minetest.register_node("mydeck:deck_boardss", {
	description = "Deck Boards Stained",
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
	drop = "mydeck:deck_boards",
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1},
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
		local node = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name

		
		if node == "mydeck:joists" then
		   minetest.set_node(pos,{name = "air"})
		end
		if node == "mydeck:joists" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:deck_joists", param2=minetest.dir_to_facedir(placer:get_look_dir())})
		end
		if node == "mydeck:joists_side" then
		   minetest.set_node(pos,{name = "air"})
		end
		if node == "mydeck:joists_side" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:deck_joists_side", param2=minetest.dir_to_facedir(placer:get_look_dir())})
		end
		if node == "mydeck:joists_beam" then
		   minetest.set_node(pos,{name = "air"})
		end
		if node == "mydeck:joists_beam" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:deck_joists_beam", param2=minetest.dir_to_facedir(placer:get_look_dir())})
		end

		if node == "mydeck:joists_side_beam" then
		   minetest.set_node(pos,{name = "air"})
		end
		if node == "mydeck:joists_side_beam" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:deck_joists_side_beam", param2=minetest.dir_to_facedir(placer:get_look_dir())})
		end

		if node == "mydeck:joists_end" then
		   minetest.set_node(pos,{name = "air"})
		end
		if node == "mydeck:joists_end" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:deck_joists_end", param2=minetest.dir_to_facedir(placer:get_look_dir())})
		end

		if node == "mydeck:joists_side_end" then
		   minetest.set_node(pos,{name = "air"})
		end
		if node == "mydeck:joists_side_end" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:deck_joists_side_end", param2=minetest.dir_to_facedir(placer:get_look_dir())})
		end

		if node == "mydeck:joists_endr" then
		   minetest.set_node(pos,{name = "air"})
		end
		if node == "mydeck:joists_endr" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:deck_joists_endr", param2=minetest.dir_to_facedir(placer:get_look_dir())})
		end

		if node == "mydeck:joists_side_endr" then
		   minetest.set_node(pos,{name = "air"})
		end
		if node == "mydeck:joists_side_endr" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:deck_joists_side_endr", param2=minetest.dir_to_facedir(placer:get_look_dir())})
		end

		if node == "mydeck:joists_beam_wbracket" then
		   minetest.set_node(pos,{name = "air"})
		end
		if node == "mydeck:joists_beam_wbracket" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:deck_joists_beam_wbracket", param2=minetest.dir_to_facedir(placer:get_look_dir())})
		end

		if node == "mydeck:joists_side_beam_wbracket" then
		   minetest.set_node(pos,{name = "air"})
		end
		if node == "mydeck:joists_side_beam_wbracket" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:deck_joists_side_beam_wbracket", param2=minetest.dir_to_facedir(placer:get_look_dir())})
		end
	end,

})

minetest.register_node("mydeck:deck_joistss", {
	description = "Deck Joists Stained",
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

	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1},
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

minetest.register_node("mydeck:deck_joists_sides", {
	description = "Deck Joists Side Stained",
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
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1},
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


minetest.register_node("mydeck:deck_joists_ends", {
	description = "Deck Joists with End Plate Stained",
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
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1},
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

minetest.register_node("mydeck:deck_joists_side_ends", {
	description = "Deck Joists Side with End Plate Stained",
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
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1},
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

minetest.register_node("mydeck:deck_joists_endrs", {
	description = "Deck Joists Side with Wall Plate stained",
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
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1},
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

minetest.register_node("mydeck:deck_joists_side_endrs", {
	description = "Deck Joists Side with Wall Plate Stained",
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
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1},
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
