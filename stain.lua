
local USES = 200

local color_tab = {
{"black", 	"Black",		"^[colorize:black:200"},
{"blue", 	"Blue",			"^[colorize:#0B0B3B:150"},
{"brown", 	"Brown",		"^[colorize:#190B07:140"},
{"cyan", 	"Cyan",			"^[colorize:cyan:75"},
{"dark_green", 	"Dark Green",		"^[colorize:#071907:150"},
{"dark_grey", 	"Dark Grey",		"^[colorize:#1C1C1C:150"},
{"green", 	"Green",		"^[colorize:green:75"},
{"grey", 	"Grey",			"^[colorize:#848484:100"},
{"magenta", 	"Magenta",		"^[colorize:magenta:75"},
{"orange",	"Orange",		"^[colorize:orange:75"},
{"pink", 	"Pink",			"^[colorize:#FE2E9A:75"},
{"red", 	"Red",			"^[colorize:#B40404:75"},
{"violet", 	"Violet",		"^[colorize:#08088A:100"},
{"white", 	"White",		"^[colorize:white:100"},
{"yellow", 	"Yellow",		"^[colorize:yellow:75"},
}

minetest.register_craftitem("mydeck:stain_brush",{
	description = "Stain Brush",
	inventory_image = "mydeck_paint_brush.png",
	groups = {mydeckstainbrush=1},
})

minetest.register_craft({
	output = 'mydeck:stain_brush',
	recipe = {
		{'wool:white'},
		{'group:stick'},
	}
})

local stainables = {
	"mydeck:deck_boards", "mydeck:deck_joists", "mydeck:deck_joists_side",  "mydeck:deck_joists_end",
	"mydeck:deck_joists_side_end", "mydeck:deck_joists_endr",  "mydeck:deck_joists_side_endr", "mydeck:rail",
	"mydeck:rail_corner", "mydeck:rail_icorner", "mydeck:beam", "mydeck:beam_wbracket", "mydeck:joists_beam",
	"mydeck:joists_beam_wbracket", "mydeck:joists_side_beam", "mydeck:joists_side_beam_wbracket",
	"mydeck:deck_joists_beam", "mydeck:deck_joists_beam_wbracket", "mydeck:deck_joists_side_beam",
	"mydeck:deck_joists_side_beam_wbracket", "mydeck:joists", "mydeck:joists_side", "mydeck:joists_end",
	"mydeck:joists_side_end", "mydeck:joists_endr", "mydeck:joists_side_endr", "mydeck:pile", "mydeck:pile_wpost",
	"mydeck:post", "mydeck:stairs", "mydeck:stairsb", "mydeck:stairs_ocorner", "mydeck:stairs_icorner",
	"mydeck:stairs_railr", "mydeck:stairs_raill", "mydeck:lattice", "mydeck:stairs_raill_end",
	"mydeck:stairs_railr_end", "mydeck:deck_beam"
}

function stain_node(pos, node, col, itemstack)
	local nname = node.name
	if not (string.sub(nname, 1, 7) == "mydeck:") then
		return
	end

	local s, e
	s, e = string.find(nname, "_[^_]+$")
	if s and e then
		local ncolor = string.sub(nname, s + 1, e)
		for i, entry in ipairs(color_tab) do
			local color = entry[1]
			if ncolor == color then
				if color == col then
					return
				end
				nname = string.sub(nname, 1, s - 2)
				break
			end
		end
	end

	for i, name in ipairs(stainables) do
		if nname == name then
			minetest.set_node(pos,{name = name.."s_"..col, param2 = node.param2})
			if not minetest.setting_getbool("creative_mode") then
				itemstack:add_wear(65535 / (USES - 1))
			end
			return itemstack
		end
	end
end

for i, entry in ipairs(color_tab) do
local col = entry[1]
local coldesc = entry[2]
local alpha = entry[3]


minetest.register_craft({
	type = "shapeless",
	output = 'mydeck:stain_brush_'..col,
	recipe = {'dye:'..col, 'group:mydeckstainbrush'}
})

minetest.register_tool("mydeck:stain_brush_"..col, {
	description = coldesc.." Stain Brush",
	inventory_image = "mydeck_paint_brush_"..col..".png",
	groups = {not_in_creative_inventory=1, mydeckstainbrush=1},
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end
		local pos = pointed_thing.under
		local node = minetest.get_node(pos)

		return stain_node(pos, node, col, itemstack)
	end
})

minetest.register_node("mydeck:deck_boardss_"..col, {
	description = "Deck Boards Stained",
	tiles = {"mydeck_hwood.png"..alpha},

	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = "mydeck:deck_boards",
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
})

minetest.register_node("mydeck:deck_beams_"..col, {
	description = "Deck on Beam Stained",
	tiles = {
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png^[transformR90"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = "mydeck:deck_beam",
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

minetest.register_node("mydeck:deck_joistss_"..col, {
	description = "Deck Joists Stained",
	tiles = {
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
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

minetest.register_node("mydeck:deck_joists_sides_"..col, {
	description = "Deck Joists Side Stained",
	tiles = {
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
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


minetest.register_node("mydeck:deck_joists_ends_"..col, {
	description = "Deck Joists with End Plate Stained",
	tiles = {
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
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

minetest.register_node("mydeck:deck_joists_side_ends_"..col, {
	description = "Deck Joists Side with End Plate Stained",
	tiles = {
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
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

minetest.register_node("mydeck:deck_joists_endrs_"..col, {
	description = "Deck Joists Side with Wall Plate stained",
	tiles = {
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
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

minetest.register_node("mydeck:deck_joists_side_endrs_"..col, {
	description = "Deck Joists Side with Wall Plate Stained",
	tiles = {
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
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

minetest.register_node("mydeck:beams_"..col, {
	description = "Beam Stained",
	tiles = {
		"mydeck_hwood.png^[transformR90"..alpha,
		"mydeck_hwood.png^[transformR90"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
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
})

minetest.register_node("mydeck:beam_wbrackets_"..col, {
	description = "Beam with Bracket Stained",
	tiles = {
		"mydeck_hwood.png"..alpha.."^[transformR90^mydeck_beambt_ol.png",
		"mydeck_hwood.png"..alpha.."^[transformR90^mydeck_beambt_ol.png",
		"mydeck_hwood.png"..alpha.."^mydeck_beambs_ol.png",
		"mydeck_hwood.png"..alpha.."^mydeck_beambs_ol.png",
		"mydeck_hwood.png"..alpha.."^mydeck_beambf_ol.png",
		"mydeck_hwood.png"..alpha.."^mydeck_beambf_ol.png",
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

minetest.register_node("mydeck:joists_beams_"..col, {
	description = "Deck Joists with Beam Stained",
	tiles = {
		"mydeck_hwood.png^[transformR90"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
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

minetest.register_node("mydeck:joists_beam_wbrackets_"..col, {
	description = "Deck Joists with Beam and Bracket Stained",
	tiles = {
		"mydeck_hwood.png^[transformR90"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha.."^mydeck_beambf_ol.png",
		"mydeck_hwood.png"..alpha.."^mydeck_beambf_ol.png",
		"mydeck_hwood.png"..alpha.."^mydeck_beambs_ol.png",
		"mydeck_hwood.png"..alpha.."^mydeck_beambs_ol.png",
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

minetest.register_node("mydeck:joists_side_beams_"..col, {
	description = "Deck Joists side with Beam Stained",
	tiles = {
		"mydeck_hwood.png^[transformR90"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
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

minetest.register_node("mydeck:joists_side_beam_wbrackets_"..col, {
	description = "Deck Joists side with Beam and Bracket Stained",
	tiles = {
		"mydeck_hwood.png^[transformR90"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha.."^mydeck_beambf_ol.png",
		"mydeck_hwood.png"..alpha.."^mydeck_beambf_ol.png",
		"mydeck_hwood.png"..alpha.."^mydeck_beambs_ol.png",
		"mydeck_hwood.png"..alpha.."^mydeck_beambs_ol.png",
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

minetest.register_node("mydeck:deck_joists_beams_"..col, {
	description = "Deck Joists with Beam Stained",
	tiles = {
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
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

minetest.register_node("mydeck:deck_joists_beam_wbrackets_"..col, {
	description = "Deck Joists with Beam with Bracket Stained",
	tiles = {
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha.."^mydeck_beambf_ol.png",
		"mydeck_hwood.png"..alpha.."^mydeck_beambf_ol.png",
		"mydeck_hwood.png"..alpha.."^mydeck_beambs_ol.png",
		"mydeck_hwood.png"..alpha.."^mydeck_beambs_ol.png",
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

minetest.register_node("mydeck:deck_joists_side_beams_"..col, {
	description = "Deck Joists side with Beam Stained",
	tiles = {
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
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

minetest.register_node("mydeck:deck_joists_side_beam_wbrackets_"..col, {
	description = "Deck Joists side with Beam with Bracket Stained",
	tiles = {
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha.."^mydeck_beambf_ol.png",
		"mydeck_hwood.png"..alpha.."^mydeck_beambf_ol.png",
		"mydeck_hwood.png"..alpha.."^mydeck_beambs_ol.png",
		"mydeck_hwood.png"..alpha.."^mydeck_beambs_ol.png",
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

minetest.register_node("mydeck:joistss_"..col, {
	description = "Deck Joists Stained",
	tiles = {
		"mydeck_hwood.png^[transformR90"..alpha,
		"mydeck_hwood.png^[transformR90"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = "mydeck:joists",
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
})

minetest.register_node("mydeck:joists_sides_"..col, {
	description = "Deck Joists Side Stained",
	tiles = {
		"mydeck_hwood.png^[transformR90"..alpha,
		"mydeck_hwood.png^[transformR90"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = "mydeck:joists_side",
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
})

minetest.register_node("mydeck:joists_ends_"..col, {
	description = "Deck Joists with End Plate Stained",
	tiles = {
		"mydeck_hwood.png^mydeck_joistend_ol.png^[transformR180"..alpha,
		"mydeck_hwood.png^mydeck_joistend_ol.png"..alpha,
		"mydeck_hwood.png^mydeck_joistend_ol.png^[transformR90"..alpha,
		"mydeck_hwood.png^mydeck_joistend_ol.png^[transformR270"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = "mydeck:joists_end",
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

minetest.register_node("mydeck:joists_side_ends_"..col, {
	description = "Deck Joists Side with End Plate Stained",
	tiles = {
		"mydeck_hwood.png^mydeck_joistend_ol.png"..alpha,
		"mydeck_hwood.png^mydeck_joistend_ol.png^[transformR180"..alpha,
		"mydeck_hwood.png^mydeck_joistend_ol.png^[transformR270"..alpha,
		"mydeck_hwood.png^mydeck_joistend_ol.png^[transformR90"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = "mydeck:joists_side_end",
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

minetest.register_node("mydeck:joists_endrs_"..col, {
	description = "Deck Joists Side with Wall Plate Stained",
	tiles = {
		"mydeck_hwood.png^mydeck_joistend_ol.png"..alpha,
		"mydeck_hwood.png^mydeck_joistend_ol.png^[transformR180"..alpha,
		"mydeck_hwood.png^mydeck_joistend_ol.png^[transformR270"..alpha,
		"mydeck_hwood.png^mydeck_joistend_ol.png^[transformR90"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = "mydeck:joists_endr",
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

minetest.register_node("mydeck:joists_side_endrs_"..col, {
	description = "Deck Joists Side with Wall Plate Stained",
	tiles = {
		"mydeck_hwood.png^mydeck_joistend_ol.png^[transformR180"..alpha,
		"mydeck_hwood.png^mydeck_joistend_ol.png"..alpha,
		"mydeck_hwood.png^mydeck_joistend_ol.png^[transformR90"..alpha,
		"mydeck_hwood.png^mydeck_joistend_ol.png^[transformR270"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = "mydeck:joists_side_endr",
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

minetest.register_node("mydeck:lattices_"..col, {
	description = "Lattice Stained",
	tiles = {
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = "mydeck:lattice",
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
			{-0.5, -0.125,  0.375, 0.5, -0.0625, 0.4375},
			{-0.5, 0,       0.375, 0.5, 0.0625,  0.4375},
			{-0.5, 0.125,   0.375, 0.5, 0.1875,  0.4375},
			{-0.5, 0.25,    0.375, 0.5, 0.3125,  0.4375},
			{-0.5, 0.375,   0.375, 0.5, 0.4375,  0.4375},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.5, 0.5, 0.5, 0.375},
			}
		},
})

minetest.register_node("mydeck:pile_wposts_"..col, {
	description = "Pile Stained",
	tiles = {
		"mydeck_hwood.png"..alpha.."^mydeck_piletp_ol.png^[transformR90",
		"mydeck_concrete.png",
		"mydeck_hwood.png"..alpha.."^mydeck_piles_ol.png",
		"mydeck_hwood.png"..alpha.."^mydeck_piles_ol.png",
		"mydeck_hwood.png"..alpha.."^mydeck_pilef_ol.png",
		"mydeck_hwood.png"..alpha.."^mydeck_pilef_ol.png",
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
			items = {"mydeck:pile"},
			},
			{
			items = {"mydeck:post"},
			},
		}
		},

	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5}, 
			{-0.4375, -0.5, -0.4375, 0.4375, -0.3125, 0.4375}, 
			{-0.375, -0.5, -0.375, 0.375, -0.25, 0.375}, 
			{-0.25, -0.25, -0.1875, -0.1875, 0.25, 0.1875}, 
			{-0.1875, -0.5, -0.1875, 0.1875, -0.1875, 0.1875}, 
			{0.1875, -0.5, -0.1875, 0.25, 0.25, 0.1875}, 
			{-0.1875, -0.5, -0.1875, 0.1875, 0.5, 0.1875}, 
		}
	}
})

minetest.register_node("mydeck:posts_"..col, {
	description = "Post Stained",
	tiles = {
		"mydeck_hwood.png"..alpha.."^[transformR90",
		"mydeck_hwood.png"..alpha.."^[transformR90",
		"mydeck_hwood.png"..alpha.."^[transformR90",
		"mydeck_hwood.png"..alpha.."^[transformR90",
		"mydeck_hwood.png"..alpha.."^[transformR90",
		"mydeck_hwood.png"..alpha.."^[transformR90",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = "mydeck:post",
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.1875, 0.1875, 0.5, 0.1875},
		}
	},
})

minetest.register_node("mydeck:rails_"..col, {
	description = "Deck Rail Stained",
	tiles = {
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png^mydeck_rwood_ol.png"..alpha,
		"mydeck_hwood.png^mydeck_rwood_ol.png"..alpha,
		"mydeck_hwood.png^mydeck_rwood_ol.png"..alpha,
		"mydeck_hwood.png^mydeck_rwood_ol.png"..alpha,
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sounds = default.node_sound_wood_defaults(),
	drop = "mydeck:rail",
	sunlight_propagates = true,
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

minetest.register_node("mydeck:rail_corners_"..col, {
	description = "Deck Rail Corner Stained",
	tiles = {
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png^mydeck_rwood_ol.png"..alpha,
		"mydeck_hwood.png^mydeck_rwood_ol.png"..alpha,
		"mydeck_hwood.png^mydeck_rwood_ol.png"..alpha,
		"mydeck_hwood.png^mydeck_rwood_ol.png"..alpha,
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "mydeck:rail_corner",
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

minetest.register_node("mydeck:rail_icorners_"..col, {
	description = "Deck Rail Corner Stained",
	tiles = {
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png^mydeck_rwood_ol.png"..alpha,
		"mydeck_hwood.png^mydeck_rwood_ol.png"..alpha,
		"mydeck_hwood.png^mydeck_rwood_ol.png"..alpha,
		"mydeck_hwood.png^mydeck_rwood_ol.png"..alpha,
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "mydeck:rail_icorner",
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

minetest.register_node("mydeck:stairss_"..col, {
	description = "Stairs Stained",
	tiles = {
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = "mydeck:stairs",
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.25, -0.5, 0.5, -0.125, -0.125}, 
			{-0.5, 0.0625, -0.1875, 0.5, 0.1875, 0.1875}, 
			{-0.5, 0.375, 0.125, 0.5, 0.5, 0.5}, 

			{-0.375, -0.5, -0.4375, -0.25, -0.25, -0.125}, 
			{-0.375, -0.1875, -0.125, -0.25, 0.0625, 0.1875}, 
			{-0.375, -0.4375, -0.125, -0.25, -0.1875, -0.0625}, 
			{-0.375, -0.375, -0.125, -0.25, -0.25, 0}, 
			{-0.375, -0.3125, -0.0625, -0.25, -0.1875, 0.0625}, 
			{-0.375, -0.25, 0, -0.25, 0, 0.125}, 
			{-0.375, 0.125, 0.1875, -0.25, 0.375, 0.5}, 
			{-0.375, -0.125, 0.1875, -0.25, 0.1875, 0.25},
			{-0.375, -0.0625, 0.25, -0.25, 0.25, 0.3125}, 
			{-0.375, 0, 0.3125, -0.25, 0.375, 0.375}, 
			{-0.375, 0.0625, 0.3125, -0.25, 0.3125, 0.4375}, 

			{0.375, -0.5,    -0.4375, 0.25, -0.25,   -0.125}, 
			{0.375, -0.1875, -0.125,  0.25,  0.0625,  0.1875}, 
			{0.375, -0.4375, -0.125,  0.25, -0.1875, -0.0625}, 
			{0.375, -0.375,  -0.125,  0.25, -0.25,    0}, 
			{0.375, -0.3125, -0.0625, 0.25, -0.1875,  0.0625}, 
			{0.375, -0.25,    0,      0.25,  0,       0.125},
			{0.375,  0.125,   0.1875, 0.25,  0.375,   0.5},
			{0.375, -0.125,   0.1875, 0.25,  0.1875,  0.25}, 
			{0.375, -0.0625,  0.25,   0.25,  0.25,    0.3125},
			{0.375,  0,       0.3125, 0.25,  0.375,   0.375},
			{0.375,  0.0625,  0.3125, 0.25,  0.3125,  0.4375},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.125, -0.1875}, 
			{-0.5, -0.5, -0.1875, 0.5, 0.1875, 0.125}, 
			{-0.5, -0.5, 0.125, 0.5, 0.5, 0.5}, 
			}
		},
})

minetest.register_abm({
	nodenames = {"mydeck:stairss_"..col},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		local nodeu = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name

		if nodeu == "air" then
		   minetest.set_node(pos,{name = "mydeck:stairsbs_"..col, param2 = node.param2})
		end
	end,
})

minetest.register_abm({
	nodenames = {"mydeck:stairsbs_"..col},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		local nodeu = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name

		if nodeu ~= "air" then
		   minetest.set_node(pos,{name = "mydeck:stairss_"..col, param2 = node.param2})
		end
	end,
})

minetest.register_node("mydeck:stairsbs_"..col, {
	description = "Stairs Stained",
	tiles = {
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = "mydeck:stairs",
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.25, -0.5, 0.5, -0.125, -0.125}, 
			{-0.5, 0.0625, -0.1875, 0.5, 0.1875, 0.1875}, 
			{-0.5, 0.375, 0.125, 0.5, 0.5, 0.5}, 

			{-0.375, -0.5, -0.4375, -0.25, -0.25, -0.125}, 
			{-0.375, -0.1875, -0.125, -0.25, 0.0625, 0.1875}, 
			{-0.375, -0.4375, -0.125, -0.25, -0.1875, -0.0625}, 
			{-0.375, -0.375, -0.125, -0.25, -0.25, 0}, 
			{-0.375, -0.3125, -0.0625, -0.25, -0.1875, 0.0625}, 
			{-0.375, -0.25, 0, -0.25, 0, 0.125}, 
			{-0.375, 0.125, 0.1875, -0.25, 0.375, 0.5}, 
			{-0.375, -0.125, 0.1875, -0.25, 0.1875, 0.25},
			{-0.375, -0.0625, 0.25, -0.25, 0.25, 0.3125}, 
			{-0.375, 0, 0.3125, -0.25, 0.375, 0.375}, 
			{-0.375, 0.0625, 0.3125, -0.25, 0.3125, 0.4375}, 

			{0.375, -0.5,    -0.4375, 0.25, -0.25,   -0.125}, 
			{0.375, -0.1875, -0.125,  0.25,  0.0625,  0.1875}, 
			{0.375, -0.4375, -0.125,  0.25, -0.1875, -0.0625}, 
			{0.375, -0.375,  -0.125,  0.25, -0.25,    0}, 
			{0.375, -0.3125, -0.0625, 0.25, -0.1875,  0.0625}, 
			{0.375, -0.25,    0,      0.25,  0,       0.125},
			{0.375,  0.125,   0.1875, 0.25,  0.375,   0.5},
			{0.375, -0.125,   0.1875, 0.25,  0.1875,  0.25}, 
			{0.375, -0.0625,  0.25,   0.25,  0.25,    0.3125},
			{0.375,  0,       0.3125, 0.25,  0.375,   0.375},
			{0.375,  0.0625,  0.3125, 0.25,  0.3125,  0.4375},

			{-0.375, -0.5625, -0.4375, -0.25, -0.5, -0.1875 },
			{-0.375, -0.625,  -0.5, -0.25, -0.5625, -0.25   },
			{-0.375, -0.6875, -0.5, -0.25, -0.5625, -0.3125 }, 
			{-0.375, -0.75,   -0.5, -0.25, -0.5625, -0.375  },
			{-0.375, -0.8125, -0.5, -0.25, -0.5625, -0.4375 }, 

			{0.375, -0.5625, -0.4375, 0.25, -0.5, -0.1875 },
			{0.375, -0.625,  -0.5, 0.25, -0.5625, -0.25   },
			{0.375, -0.6875, -0.5, 0.25, -0.5625, -0.3125 }, 
			{0.375, -0.75,   -0.5, 0.25, -0.5625, -0.375  },
			{0.375, -0.8125, -0.5, 0.25, -0.5625, -0.4375 }, 
			{-0.5, -0.625, -0.5, 0.5, -0.5, -0.4375},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.125, -0.1875}, 
			{-0.5, -0.5, -0.1875, 0.5, 0.1875, 0.125}, 
			{-0.5, -0.5, 0.125, 0.5, 0.5, 0.5}, 
			}
		},
})

minetest.register_node("mydeck:stairs_ocorners_"..col, {
	description = "Stairs Outside Corner Stained",
	tiles = {
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = "mydeck:stairs_ocorner",
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.25,   -0.5,    0.5,   -0.125, -0.125 }, 
			{-0.5,  0.0625, -0.1875, 0.1875, 0.1875, 0.1875}, 
			{-0.5,  0.375,   0.125, -0.125,  0.5,    0.5   }, 

			{0.125,   -0.25,      -0.5,     0.5,   -0.125,  0.5}, 
			{-0.1875,  0.0625,    -0.1875,  0.1875, 0.1875, 0.5},

			{-0.375,  -0.5,       -0.4375, -0.25,  -0.25,   -0.125  }, 
			{-0.375,  -0.1875,    -0.125,  -0.25,   0.0625,  0.1875 }, 
			{-0.375,  -0.4375,    -0.125,  -0.25,  -0.1875, -0.0625 }, 
			{-0.375,  -0.375,     -0.125,  -0.25,  -0.25,    0      }, 
			{-0.375,  -0.3125,    -0.0625, -0.25,  -0.1875,  0.0625 }, 
			{-0.375,  -0.25,       0,      -0.25,   0,       0.125  }, 
			{-0.375,   0.125,      0.1875, -0.25,   0.375,   0.5    },
			{-0.375,  -0.125,      0.1875, -0.25,   0.1875,  0.25   }, 
			{-0.375,  -0.0625,     0.25,   -0.25,   0.25,    0.3125 }, 
			{-0.375,   0,          0.3125, -0.25,   0.375,   0.375  }, 
			{-0.375,   0.0625,     0.3125, -0.25,   0.3125,  0.4375 }, 

			{ 0.4375, -0.5,        0.375, 0.125,   -0.25,    0.25 }, 
			{ 0.125,  -0.1875,     0.375, - 0.1875,   0.0625,  0.25 }, 
			{ 0.125,  -0.4375,     0.375, 0.0625,  -0.1875,  0.25 }, 
			{ 0.125,  -0.375,      0.375,  0,       -0.25,    0.25 }, 
			{ 0.0625, -0.3125,     0.375,  -0.0625,  -0.1875,  0.25 }, 
			{ 0 ,     -0.25,       0.375,  -0.125,    0,       0.25 }, 
			{-0.1875,  0.125,      0.375,  -0.5,      0.375,   0.25 },
			{-0.1875, -0.125,      0.375,  -0.25,     0.1875,  0.25 }, 
			{-0.25,   -0.0625,     0.375,  -0.3125,  0.25,    0.25 }, 
			{-0.3125,  0,          0.375,  -0.375,   0.375,   0.25 }, 
			{-0.3125,  0.0625,     0.375,  -0.4375,  0.3125,  0.25 }, 
	
			{0.1875, -0.5, -0.1875, 0.4375, -0.125, -0.4375},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.125, 0.5}, 
			{-0.5, -0.5, -0.1875, 0.1875, 0.1875, 0.5},
			{-0.5, -0.5, 0.125, -0.125, 0.5, 0.5},  
			}
		},
})

minetest.register_node("mydeck:stairs_icorners_"..col, {
	description = "Stairs Inside Corner Stained",
	tiles = {
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = "mydeck:stairs_icorner",
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.25,   -0.5,    -0.125,   -0.125, -0.125 }, 
			{-0.5,  0.0625, -0.1875, 0.1875, 0.1875, 0.1875}, 
			{-0.5, 0.375, 0.125, 0.5, 0.5, 0.5}, 
  
			{-0.1875,  0.0625, -0.5, 0.1875, 0.1875, -0.1875}, 
			{0.125, 0.375, -0.5, 0.5, 0.5, 0.5}, 

			{-0.375,  -0.5,       -0.4375, -0.25,  -0.25,   -0.125  }, 
			{-0.375,  -0.1875,    -0.125,  -0.25,   0.0625,  0.1875 }, 
			{-0.375,  -0.4375,    -0.125,  -0.25,  -0.1875, -0.0625 }, 
			{-0.375,  -0.375,     -0.125,  -0.25,  -0.25,    0      }, 
			{-0.375,  -0.3125,    -0.0625, -0.25,  -0.1875,  0.0625 }, 
			{-0.375,  -0.25,       0,      -0.25,   0,       0.125  }, 
			{-0.375,   0.125,      0.1875, -0.25,   0.375,   0.5    },
			{-0.375,  -0.125,      0.1875, -0.25,   0.1875,  0.25   }, 
			{-0.375,  -0.0625,     0.25,   -0.25,   0.25,    0.3125 }, 
			{-0.375,   0,          0.3125, -0.25,   0.375,   0.375  }, 
			{-0.375,   0.0625,     0.3125, -0.25,   0.3125,  0.4375 }, 

			{-0.4375, -0.5,        -0.375, -0.125,   -0.25,    -0.25 }, 
			{-0.125,  -0.1875,     -0.375,  0.1875,   0.0625,  -0.25 }, 
			{-0.125,  -0.4375,     -0.375, -0.0625,  -0.1875,  -0.25 }, 
			{-0.125,  -0.375,      -0.375,  0,       -0.25,    -0.25 }, 
			{-0.0625, -0.3125,     -0.375,  0.0625,  -0.1875,  -0.25 }, 
			{ 0 ,     -0.25,       -0.375,  0.125,    0,       -0.25 }, 
			{ 0.1875,  0.125,      -0.375,  0.5,      0.375,   -0.25 },
			{ 0.1875, -0.125,      -0.375,  0.25,     0.1875,  -0.25 }, 
			{ 0.25,   -0.0625,     -0.375,  0.3125,   0.25,    -0.25 }, 
			{ 0.3125,  0,          -0.375,  0.375,    0.375,   -0.25 }, 
			{ 0.3125,  0.0625,     -0.375,  0.4375,   0.3125,  -0.25 }, 
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5,   -0.5,    -0.1875,   -0.125, -0.1875 }, 
			{-0.5,  -0.5, -0.1875, 0.125, 0.1875, 0.125}, 
			{-0.5, -0.5, 0.125, 0.5, 0.5, 0.5}, 
  
			{-0.1875,  -0.5, -0.5, 0.125, 0.1875, 0.125}, 
			{0.125, -0.5, -0.5, 0.5, 0.5, 0.5},
			}
		},
})

minetest.register_node("mydeck:stairs_railrs_"..col, {
	description = "Right Stairs Stained",
	tiles = {
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = "mydeck:stairs_railr",
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{0.3125, -0.5, 0.4375, 0.5, 0.375, 0.5}, -- NodeBox1
			{0.3125, -1.5, -0.4375, 0.5, -0.5, -0.5}, -- NodeBox1
			{0.3125, 0.375, 0.4375, 0.5, 0.5, 0.5}, -- NodeBox2
			{0.3125, 0.3125, 0.375, 0.5, 0.4375, 0.4375}, -- NodeBox3
			{0.3125, 0.25, 0.3125, 0.5, 0.375, 0.375}, -- NodeBox4
			{0.3125, 0.1875, 0.25, 0.5, 0.3125, 0.3125}, -- NodeBox5
			{0.3125, 0.125, 0.1875, 0.5, 0.25, 0.25}, -- NodeBox6
			{0.3125, 0.0625, 0.125, 0.5, 0.1875, 0.1875}, -- NodeBox7
			{0.3125, 0, 0.0625, 0.5, 0.125, 0.125}, -- NodeBox8
			{0.3125, -0.0625, 0, 0.5, 0.0625, 0.0625}, -- NodeBox9
			{0.3125, -0.125, -0.0625, 0.5, 0, 0}, -- NodeBox10
			{0.3125, -0.1875, -0.125, 0.5, -0.0625, -0.0625}, -- NodeBox11
			{0.3125, -0.25, -0.1875, 0.5, -0.125, -0.125}, -- NodeBox12
			{0.3125, -0.3125, -0.25, 0.5, -0.1875, -0.1875}, -- NodeBox13
			{0.3125, -0.375, -0.3125, 0.5, -0.25, -0.25}, -- NodeBox14
			{0.3125, -0.4375, -0.375, 0.5, -0.3125, -0.3125}, -- NodeBox15
			{0.3125, -0.5, -0.4375, 0.5, -0.375, -0.375}, -- NodeBox16
			{0.3125, -0.5, -0.5, 0.5, -0.4375, -0.4375}, -- NodeBox17
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{0.3125, -0.5,   -0.5,    0.5,   0.5, 0.5 }, 
			}
		},
})

minetest.register_node("mydeck:stairs_raills_"..col, {
	description = "Left Stairs Rail Stained",
	tiles = {
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	drop = "mydeck:stairs_raill",
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, 0.4375, -0.5, 0.375, 0.5}, -- NodeBox1
			{-0.3125, -1.5, -0.4375, -0.5, -0.5, -0.5}, -- NodeBox1
			{-0.3125, 0.375, 0.4375, -0.5, 0.5, 0.5}, -- NodeBox2
			{-0.3125, 0.3125, 0.375, -0.5, 0.4375, 0.4375}, -- NodeBox3
			{-0.3125, 0.25, 0.3125, -0.5, 0.375, 0.375}, -- NodeBox4
			{-0.3125, 0.1875, 0.25, -0.5, 0.3125, 0.3125}, -- NodeBox5
			{-0.3125, 0.125, 0.1875, -0.5, 0.25, 0.25}, -- NodeBox6
			{-0.3125, 0.0625, 0.125, -0.5, 0.1875, 0.1875}, -- NodeBox7
			{-0.3125, 0, 0.0625, -0.5, 0.125, 0.125}, -- NodeBox8
			{-0.3125, -0.0625, 0, -0.5, 0.0625, 0.0625}, -- NodeBox9
			{-0.3125, -0.125, -0.0625, -0.5, 0, 0}, -- NodeBox10
			{-0.3125, -0.1875, -0.125, -0.5, -0.0625, -0.0625}, -- NodeBox11
			{-0.3125, -0.25, -0.1875, -0.5, -0.125, -0.125}, -- NodeBox12
			{-0.3125, -0.3125, -0.25, -0.5, -0.1875, -0.1875}, -- NodeBox13
			{-0.3125, -0.375, -0.3125, -0.5, -0.25, -0.25}, -- NodeBox14
			{-0.3125, -0.4375, -0.375, -0.5, -0.3125, -0.3125}, -- NodeBox15
			{-0.3125, -0.5, -0.4375, -0.5, -0.375, -0.375}, -- NodeBox16
			{-0.3125, -0.5, -0.5, -0.5, -0.4375, -0.4375}, -- NodeBox17
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5,   -0.5,    -0.5,   0.5, 0.5 }, 
			}
		},
})

minetest.register_node("mydeck:stairs_railr_ends_"..col, {
	description = "Stairs Stained",
	tiles = {
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "mydeck:stairs_railr",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{0.3125, -0.5, 0.4375, 0.5, 0.375, 0.5}, 
			{0.3125, 0.375, 0.4375, 0.5, 0.5, 0.5}, 
			{0.3125, 0.3125, 0.375, 0.5, 0.4375, 0.4375}, 
			{0.3125, 0.25, 0.3125, 0.5, 0.375, 0.375}, 
			{0.3125, 0.1875, 0.25, 0.5, 0.3125, 0.3125}, 
			{0.3125, 0.125, 0.1875, 0.5, 0.25, 0.25}, 
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{0.3125, -0.5,   0.1875,    0.5,   0.5, 0.5 }, 
			}
		},
})

minetest.register_node("mydeck:stairs_raill_ends_"..col, {
	description = "Stairs Stained",
	tiles = {
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
		"mydeck_hwood.png"..alpha,
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "mydeck:stairs_raill",
	sunlight_propagates = true,
	sounds = default.node_sound_wood_defaults(),
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1, flammable = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, 0.4375, -0.5, 0.375, 0.5},
			{-0.3125, 0.375, 0.4375, -0.5, 0.5, 0.5}, 
			{-0.3125, 0.3125, 0.375, -0.5, 0.4375, 0.4375}, 
			{-0.3125, 0.25, 0.3125, -0.5, 0.375, 0.375}, 
			{-0.3125, 0.1875, 0.25, -0.5, 0.3125, 0.3125}, 
			{-0.3125, 0.125, 0.1875, -0.5, 0.25, 0.25}, 
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5,   0.1875,    -0.5,   0.5, 0.5 }, 
			}
		},
})

end -- for colors

