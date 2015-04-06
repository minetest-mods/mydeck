minetest.register_craftitem("mydeck:stain_brush",{
--	description = "Stain Brush",
	inventory_image = "mydeck_brush.png",

})

minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:deck_boards" then
	minetest.set_node(pos,{name = "mydeck:deck_boardss", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:deck_joists" then
	minetest.set_node(pos,{name = "mydeck:deck_joistss", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:deck_joists_side" then
	minetest.set_node(pos,{name = "mydeck:deck_joists_sides", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:deck_joists_end" then
	minetest.set_node(pos,{name = "mydeck:deck_joists_ends", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:deck_joists_side_end" then
	minetest.set_node(pos,{name = "mydeck:deck_joists_side_ends", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:deck_joists_endr" then
	minetest.set_node(pos,{name = "mydeck:deck_joists_endrs", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:deck_joists_side_endr" then
	minetest.set_node(pos,{name = "mydeck:deck_joists_side_endrs", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:rail" then
	minetest.set_node(pos,{name = "mydeck:rails", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:rail_corner" then
	minetest.set_node(pos,{name = "mydeck:rail_corners", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:rail_icorner" then
	minetest.set_node(pos,{name = "mydeck:rail_icorners", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:beam" then
	minetest.set_node(pos,{name = "mydeck:beams", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:beam_wbracket" then
	minetest.set_node(pos,{name = "mydeck:beam_wbrackets", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:joists_beam" then
	minetest.set_node(pos,{name = "mydeck:joists_beams", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:joists_beam_wbracket" then
	minetest.set_node(pos,{name = "mydeck:joists_beam_wbrackets", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:joists_side_beam" then
	minetest.set_node(pos,{name = "mydeck:joists_side_beams", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:joists_side_beam_wbracket" then
	minetest.set_node(pos,{name = "mydeck:joists_side_beam_wbrackets", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:deck_joists_beam" then
	minetest.set_node(pos,{name = "mydeck:deck_joists_beams", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:deck_joists_beam_wbracket" then
	minetest.set_node(pos,{name = "mydeck:deck_joists_beam_wbrackets", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:deck_joists_side_beam" then
	minetest.set_node(pos,{name = "mydeck:deck_joists_side_beams", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:deck_joists_side_beam_wbracket" then
	minetest.set_node(pos,{name = "mydeck:deck_joists_side_beam_wbrackets", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:joists" then
	minetest.set_node(pos,{name = "mydeck:joistss", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:joists_side" then
	minetest.set_node(pos,{name = "mydeck:joists_sides", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:joists_end" then
	minetest.set_node(pos,{name = "mydeck:joists_ends", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:joists_side_end" then
	minetest.set_node(pos,{name = "mydeck:joists_side_ends", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:joists_endr" then
	minetest.set_node(pos,{name = "mydeck:joists_endrs", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:joists_side_endr" then
	minetest.set_node(pos,{name = "mydeck:joists_side_endrs", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:pile" then
	minetest.set_node(pos,{name = "mydeck:piles", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:pile_wpost" then
	minetest.set_node(pos,{name = "mydeck:pile_wposts", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:post" then
	minetest.set_node(pos,{name = "mydeck:posts", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:stairs" then
	minetest.set_node(pos,{name = "mydeck:stairss", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:stairsb" then
	minetest.set_node(pos,{name = "mydeck:stairsbs", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:stairs_ocorner" then
	minetest.set_node(pos,{name = "mydeck:stairs_ocorners", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:stairs_icorner" then
	minetest.set_node(pos,{name = "mydeck:stairs_icorners", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:stairs_icorner" then
	minetest.set_node(pos,{name = "mydeck:stairs_icorners", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:stairs_railr" then
	minetest.set_node(pos,{name = "mydeck:stairs_railrs", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:stairs_raill" then
	minetest.set_node(pos,{name = "mydeck:stairs_raills", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:lattice" then
	minetest.set_node(pos,{name = "mydeck:lattices", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:stairs_raill_end" then
	minetest.set_node(pos,{name = "mydeck:stairs_raill_ends", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:stairs_railr_end" then
	minetest.set_node(pos,{name = "mydeck:stairs_railr_ends", param2=node.param2})
	end

	if puncher:get_wielded_item():get_name() == "mydeck:stain_brush"
	and node.name == "mydeck:deck_beam" then
	minetest.set_node(pos,{name = "mydeck:deck_beams", param2=node.param2})
	end
end)








