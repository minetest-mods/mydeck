minetest.register_node("mydeck:stairss", {
	description = "Stairs",
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
	drop = "mydeck:stairs",
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1},
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
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		
		local nodedown = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name


--		if nodedown == "air" then
		   minetest.set_node(pos,{name = "mydeck:stairsbs", param2=minetest.dir_to_facedir(placer:get_look_dir())})
--		end
	end
})
minetest.register_abm({
	nodenames = {"mydeck:stairss"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		local nodeu = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name


		if nodeu == "air" then
		   minetest.set_node(pos,{name = "mydeck:stairsbs", param2 = node.param2})
		end
	end,
})
minetest.register_abm({
	nodenames = {"mydeck:stairsbs"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		local nodeu = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name


		if nodeu ~= "air" then
		   minetest.set_node(pos,{name = "mydeck:stairss", param2 = node.param2})
		end
	end,
})
minetest.register_node("mydeck:stairsbs", {
	description = "Stairs",
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
	drop = "mydeck:stairs",
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1},
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

minetest.register_node("mydeck:stairs_ocorners", {
	description = "Stairs Outside Corner",
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
	drop = "mydeck:stairs_ocorner",
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1},
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

minetest.register_node("mydeck:stairs_icorners", {
	description = "Stairs Inside Corner",
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
	drop = "mydeck:stairs_icorner",
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1},
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


minetest.register_node("mydeck:stairs_railrs", {
	description = "Right Stairs Stained",
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
	drop = "mydeck:stairs_railr",
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1},
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
minetest.register_node("mydeck:stairs_raills", {
	description = "Left Stairs Rail Stained",
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
	drop = "mydeck:stairs_raill",
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1},
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



minetest.register_node("mydeck:stairs_railr_ends", {
	description = "Stairs",
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
	drop = "mydeck:stairs_railr",
	sunlight_propagates = true,
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1},
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
minetest.register_node("mydeck:stairs_raill_ends", {
	description = "Stairs",
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
	drop = "mydeck:stairs_raill",
	sunlight_propagates = true,
	groups = {cracky = 2, choppy = 2, not_in_creative_inventory=1},
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






