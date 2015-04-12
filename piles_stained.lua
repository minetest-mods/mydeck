

minetest.register_node("mydeck:pile_wposts", {
	description = "Pile",
	tiles = {
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_piletp_ol.png^[transformR90",
		"mydeck_concrete.png",
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_piles_ol.png",
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_piles_ol.png",
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_pilef_ol.png",
		"mydeck_hwood.png^mydeck_tint1.png^mydeck_pilef_ol.png",
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
minetest.register_node("mydeck:posts", {
	description = "Post",
	tiles = {
		"mydeck_hwood.png^mydeck_tint1.png^[transformR90",
		"mydeck_hwood.png^mydeck_tint1.png^[transformR90",
		"mydeck_hwood.png^mydeck_tint1.png^[transformR90",
		"mydeck_hwood.png^mydeck_tint1.png^[transformR90",
		"mydeck_hwood.png^mydeck_tint1.png^[transformR90",
		"mydeck_hwood.png^mydeck_tint1.png^[transformR90",
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
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		
		local deck = minetest.get_node({x=pos.x, y=pos.y, z=pos.z}).name
		local node = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
		local nodeu = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name


		if node == "mydeck:pile" then
		   minetest.set_node(pos,{name = "air"})
		end
		if node == "mydeck:pile" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "mydeck:pile_wpost", param2=minetest.dir_to_facedir(placer:get_look_dir())})
		end
		
		if nodeu == "mydeck:beam" then
		   minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z},{name = "mydeck:beam_wbracket", param2=minetest.dir_to_facedir(placer:get_look_dir())})
		end
		if nodeu == "mydeck:joists_beam" then
		   minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z},{name = "mydeck:joists_beam_wbracket", param2=minetest.dir_to_facedir(placer:get_look_dir())})
		end
		if nodeu == "mydeck:joists_side_beam" then
		   minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z},{name = "mydeck:joists_side_beam_wbracket", param2=minetest.dir_to_facedir(placer:get_look_dir())})
		end
		if nodeu == "mydeck:deck_joists_beam" then
		   minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z},{name = "mydeck:deck_joists_beam_wbracket", param2=minetest.dir_to_facedir(placer:get_look_dir())})
		end
		if nodeu == "mydeck:deck_joists_side_beam" then
		   minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z},{name = "mydeck:deck_joists_side_beam_wbracket", param2=minetest.dir_to_facedir(placer:get_look_dir())})
		end
	end
})







