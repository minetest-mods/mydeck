
minetest.register_node("mydeck:joists", {
	description = "Deck Joists",
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
			{-0.5, 0, -0.5, -0.375, 0.375, 0.5}, 
			{0, 0, -0.5, 0.125, 0.375, 0.5}, 
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0.5, 0.375, 0.5}, 
		}
	},
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		
		local nodeu = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z})
		local p2 = nodeu.param2 + 1
			if p2 >= 4 then 
				p2 = 0
			end


		if nodeu.name == "mydeck:beam" then
		   minetest.remove_node(pos)
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:joists_beam", param2=p2})
		end
		if nodeu.name == "mydeck:beam_wbracket" then
		   minetest.remove_node(pos)
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:joists_beam_wbracket", param2=p2})
		end
	end
})

minetest.register_node("mydeck:joists_side", {
	description = "Deck Joists Side",
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
			{-0.5, 0, -0.5, -0.375, 0.375, 0.5}, 
			{0, 0, -0.5, 0.125, 0.375, 0.5}, 
			{0.375, 0, -0.5, 0.5, 0.375, 0.5}, 
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0.5, 0.375, 0.5}, 
		}
	},
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		
		local node = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z})
		local p2 = node.param2 + 1
			if p2 >= 4 then 
				p2 = 0
			end

		if node.name == "mydeck:beam_wbracket" then
		   minetest.remove_node(pos)
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:joists_side_beam_wbracket", param2=node.param2})
		end
		if node.name == "mydeck:beam" then
		   minetest.remove_node(pos)
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:joists_side_beam", param2=node.param2})
		end
	end
})


minetest.register_node("mydeck:joists_end", {
	description = "Deck Joists with End Plate",
	tiles = {
		"mydeck_hwood.png^mydeck_joistend_ol.png^[transformR180",
		"mydeck_hwood.png^mydeck_joistend_ol.png",
		"mydeck_hwood.png^mydeck_joistend_ol.png^[transformR90",
		"mydeck_hwood.png^mydeck_joistend_ol.png^[transformR270",
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
			{-0.5, 0, -0.5, -0.375, 0.375, 0.5}, 
			{0, 0, -0.5, 0.125, 0.375, 0.5}, 
			{-0.5, 0, 0.375, 0.5, 0.375, 0.5},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0.5, 0.375, 0.5},  
		}
	},
})

minetest.register_node("mydeck:joists_side_end", {
	description = "Deck Joists Side with End Plate",
	tiles = {
		"mydeck_hwood.png^mydeck_joistend_ol.png",
		"mydeck_hwood.png^mydeck_joistend_ol.png^[transformR180",
		"mydeck_hwood.png^mydeck_joistend_ol.png^[transformR270",
		"mydeck_hwood.png^mydeck_joistend_ol.png^[transformR90",
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
			{-0.5, 0, -0.5, -0.375, 0.375, 0.5}, 
			{0, 0, -0.5, 0.125, 0.375, 0.5}, 
			{-0.5, 0, -0.5, 0.5, 0.375, -0.375}, 
			{0.375, 0, -0.5, 0.5, 0.375, 0.5}, 
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0.5, 0.375, 0.5},  
		}
	},
})

minetest.register_node("mydeck:joists_endr", {
	description = "Deck Joists Side with Wall Plate",
	tiles = {
		"mydeck_hwood.png^mydeck_joistend_ol.png",
		"mydeck_hwood.png^mydeck_joistend_ol.png^[transformR180",
		"mydeck_hwood.png^mydeck_joistend_ol.png^[transformR270",
		"mydeck_hwood.png^mydeck_joistend_ol.png^[transformR90",
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
			{-0.5, 0, -0.5, -0.375, 0.375, 0.5}, 
			{0, 0, -0.5, 0.125, 0.375, 0.5},
			{-0.5, 0, -0.5, 0.5, 0.375, -0.375},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0.5, 0.375, 0.5}, 
		}
	},
})

minetest.register_node("mydeck:joists_side_endr", {
	description = "Deck Joists Side with Wall Plate",
	tiles = {
		"mydeck_hwood.png^mydeck_joistend_ol.png^[transformR180",
		"mydeck_hwood.png^mydeck_joistend_ol.png",
		"mydeck_hwood.png^mydeck_joistend_ol.png^[transformR90",
		"mydeck_hwood.png^mydeck_joistend_ol.png^[transformR270",
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
			{-0.5, 0, -0.5, -0.375, 0.375, 0.5}, 
			{0, 0, -0.5, 0.125, 0.375, 0.5}, 
			{-0.5, 0, 0.5, 0.5, 0.375, 0.375}, 
			{0.375, 0, -0.5, 0.5, 0.375, 0.5},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0.5, 0.375, 0.5}, 
		}
	},
})
