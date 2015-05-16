minetest.register_node("mydeck:stairs", {
	description = "Stairs",
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
	nodenames = {"mydeck:stairs"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		local nodeu = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name


		if nodeu == "air" then
		   minetest.set_node(pos,{name = "mydeck:stairsb", param2 = node.param2})
		end
	end,
})
minetest.register_abm({
	nodenames = {"mydeck:stairsb"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		local nodeu = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name


		if nodeu ~= "air" then
		   minetest.set_node(pos,{name = "mydeck:stairs", param2 = node.param2})
		end
	end,
})

minetest.register_node("mydeck:stairsb", {
	description = "Stairs",
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

minetest.register_node("mydeck:stairs_ocorner", {
	description = "Stairs Outside Corner",
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

minetest.register_node("mydeck:stairs_icorner", {
	description = "Stairs Inside Corner",
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

minetest.register_node("mydeck:stairs_railr", {
	description = "Right Hand Rail",
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
			{0.3125, -0.5, 0.4375, 0.5, 0.375, 0.5}, 
			{0.3125, -1.5, -0.4375, 0.5, -0.5, -0.5}, 
			{0.3125, 0.375, 0.4375, 0.5, 0.5, 0.5}, 
			{0.3125, 0.3125, 0.375, 0.5, 0.4375, 0.4375}, 
			{0.3125, 0.25, 0.3125, 0.5, 0.375, 0.375}, 
			{0.3125, 0.1875, 0.25, 0.5, 0.3125, 0.3125}, 
			{0.3125, 0.125, 0.1875, 0.5, 0.25, 0.25}, 
			{0.3125, 0.0625, 0.125, 0.5, 0.1875, 0.1875}, 
			{0.3125, 0, 0.0625, 0.5, 0.125, 0.125}, 
			{0.3125, -0.0625, 0, 0.5, 0.0625, 0.0625},
			{0.3125, -0.125, -0.0625, 0.5, 0, 0}, 
			{0.3125, -0.1875, -0.125, 0.5, -0.0625, -0.0625}, 
			{0.3125, -0.25, -0.1875, 0.5, -0.125, -0.125}, 
			{0.3125, -0.3125, -0.25, 0.5, -0.1875, -0.1875}, 
			{0.3125, -0.375, -0.3125, 0.5, -0.25, -0.25}, 
			{0.3125, -0.4375, -0.375, 0.5, -0.3125, -0.3125}, 
			{0.3125, -0.5, -0.4375, 0.5, -0.375, -0.375}, 
			{0.3125, -0.5, -0.5, 0.5, -0.4375, -0.4375}, 


		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{0.3125, -0.5,   -0.5,    0.5,   0.5, 0.5 }, 
			}
		},
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		
		local node = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z})
		local nodeu = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name

		if nodeu == "mydeck:stairs" or
		   nodeu == "mydeck:stairsb" or
		   nodeu == "mydeck:stairss" or
		   nodeu == "mydeck:stairsbs" then
		   minetest.set_node(pos,{name = "mydeck:stairs_railr", param2=minetest.dir_to_facedir(placer:get_look_dir())})
		else
		
		   minetest.set_node(pos,{name = "mydeck:stairs_railr_end", param2=minetest.dir_to_facedir(placer:get_look_dir())})
		
		end
	end,
})


minetest.register_node("mydeck:stairs_raill", {
	description = "Left Hand Rail",
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
			{-0.3125, -0.5, 0.4375, -0.5, 0.375, 0.5}, 
			{-0.3125, -1.5, -0.4375, -0.5, -0.5, -0.5}, 
			{-0.3125, 0.375, 0.4375, -0.5, 0.5, 0.5}, 
			{-0.3125, 0.3125, 0.375, -0.5, 0.4375, 0.4375}, 
			{-0.3125, 0.25, 0.3125, -0.5, 0.375, 0.375}, 
			{-0.3125, 0.1875, 0.25, -0.5, 0.3125, 0.3125}, 
			{-0.3125, 0.125, 0.1875, -0.5, 0.25, 0.25}, 
			{-0.3125, 0.0625, 0.125, -0.5, 0.1875, 0.1875}, 
			{-0.3125, 0, 0.0625, -0.5, 0.125, 0.125}, 
			{-0.3125, -0.0625, 0, -0.5, 0.0625, 0.0625}, 
			{-0.3125, -0.125, -0.0625, -0.5, 0, 0}, 
			{-0.3125, -0.1875, -0.125, -0.5, -0.0625, -0.0625}, 
			{-0.3125, -0.25, -0.1875, -0.5, -0.125, -0.125}, 
			{-0.3125, -0.3125, -0.25, -0.5, -0.1875, -0.1875}, 
			{-0.3125, -0.375, -0.3125, -0.5, -0.25, -0.25}, 
			{-0.3125, -0.4375, -0.375, -0.5, -0.3125, -0.3125}, 
			{-0.3125, -0.5, -0.4375, -0.5, -0.375, -0.375}, 
			{-0.3125, -0.5, -0.5, -0.5, -0.4375, -0.4375}, 


		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5,   -0.5,    -0.5,   0.5, 0.5 }, 
			}
		},
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		
		local node = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z})
		local nodeu = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name

		if nodeu == "mydeck:stairs" or
		   nodeu == "mydeck:stairsb" or
		   nodeu == "mydeck:stairss" or
		   nodeu == "mydeck:stairsbs" then
		   minetest.set_node(pos,{name = "mydeck:stairs_raill", param2=minetest.dir_to_facedir(placer:get_look_dir())})
		else
		
		   minetest.set_node(pos,{name = "mydeck:stairs_raill_end", param2=minetest.dir_to_facedir(placer:get_look_dir())})
		
		end
	end,
})


minetest.register_node("mydeck:stairs_railr_end", {
	description = "Stairs",
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
minetest.register_node("mydeck:stairs_raill_end", {
	description = "Stairs",
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







