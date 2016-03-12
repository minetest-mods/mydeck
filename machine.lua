
minetest.register_node("mydeck:machine", {
	description = "Deck Machine",
	tiles = {
		"mydeck_hwood.png",
		"mydeck_hwood.png",
		"mydeck_machs.png",
		"mydeck_machs.png^[transformFX",
		"mydeck_machf.png",
		"mydeck_machf.png",
		},
	inventory_image = "mydeck_mach_inv.png",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5,       1.5, -0.375, -0.25}, 
			{-0.5, -0.5, -0.1875,    1.5, -0.375, 0.125}, 
			{-0.5, -0.5, 0.1875,     1.5, -0.375, 0.5}, 
			{-0.375, -0.375, -0.5,  -0.25, -0.3125, 0.5}, 
			{0.25, -0.375, -0.5,     0.375, -0.3125, 0.5}, 
			{-0.5, -0.3125, -0.5,    1.5, -0.1875, -0.25},
			{-0.5, -0.3125, -0.1875, 1.5, -0.1875, 0.125}, 
			{-0.5, -0.3125, 0.1875,  1.5, -0.1875, 0.5}, 
			{-0.375, -0.1875, -0.5, -0.25, -0.125, 0.5}, 
			{0.25, -0.1875, -0.5,    0.375, -0.125, 0.5}, 
			{-0.5, -0.125, -0.5,     1.5, 0, -0.25}, 
			{-0.5, -0.125, -0.1875 , 1.5, 0, 0.125}, 
			{-0.5, -0.125, 0.1875,   1.5, 0, 0.5}, 
			{1.25, -0.1875, -0.5,    1.375, -0.125, 0.5}, 
			{1.375, -0.375, -0.5,    1.25, -0.3125, 0.5},
		}
	},

	after_place_node = function(pos, placer)
	local meta = minetest.get_meta(pos);
			meta:set_string("owner",  (placer:get_player_name() or ""));
			meta:set_string("infotext",  "Deck Machine (owned by " .. (placer:get_player_name() or "") .. ")");
		end,

can_dig = function(pos,player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	return inv:is_empty("ingot") and inv:is_empty("res")
end,

on_construct = function(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string("formspec", "invsize[9,10;]"..
		"background[-0.15,-0.25;9.3,10.75;mydeck_background.png]"..
		"label[6,4;Wood:]"..
		"list[current_name;ingot;6,4.5;1,1;]"..
		"label[7.5,4;Output:]"..
		"list[current_name;res;7.5,4.5;1,1;]"..
		"label[0.5,0.5;Joists]"..
		"item_image_button[0.5,1;1,1;mydeck:joists;joists; ]"..
		"item_image_button[1.5,1;1,1;mydeck:joists_side;joistside; ]"..
		"item_image_button[2.5,1;1,1;mydeck:joists_end;joistend; ]"..
		"item_image_button[3.5,1;1,1;mydeck:joists_side_end;joistsidend; ]"..
		"item_image_button[4.5,1;1,1;mydeck:joists_endr;joistendr; ]"..
		"item_image_button[5.5,1;1,1;mydeck:joists_side_endr;joistsidendr; ]"..

		"label[7.5,0.5;Pile]"..
		"item_image_button[7.5,1;1,1;mydeck:pile;pile; ]"..
		"label[7.5,2;Requires]"..
		"label[7.5,2.5;Stone]"..

		"label[0.5,2;Pile Post Beam and Stairs]"..
		"item_image_button[0.5,2.5;1,1;mydeck:post;post; ]"..
		"item_image_button[1.5,2.5;1,1;mydeck:beam;beam; ]"..
		"item_image_button[2.5,2.5;1,1;mydeck:stairs;stairs; ]"..
		"item_image_button[3.5,2.5;1,1;mydeck:stairs_ocorner;stairso; ]"..
		"item_image_button[4.5,2.5;1,1;mydeck:stairs_icorner;stairsi; ]"..
		"item_image_button[5.5,2.5;1,1;mydeck:stairs_raill;sraill; ]"..
		"item_image_button[6.5,2.5;1,1;mydeck:stairs_railr;srailr; ]"..
		"label[0.5,3.5;Deck Boards and Rail]"..
		"item_image_button[0.5,4;1,1;mydeck:deck_boards;deckb; ]"..
		"item_image_button[1.5,4;1,1;mydeck:rail;rail; ]"..
		"item_image_button[2.5,4;1,1;mydeck:rail_corner;railc; ]"..
		"item_image_button[3.5,4;1,1;mydeck:rail_icorner;railic; ]"..
		"item_image_button[4.5,4;1,1;mydeck:lattice;lattice; ]"..

		"list[current_player;main;0.5,6;8,4;]")
	meta:set_string("infotext", "Deck Machine")
	local inv = meta:get_inventory()
	inv:set_size("ingot", 1)
	inv:set_size("res", 1)
end,

allow_metadata_inventory_put = function(pos, listname, index, stack, player)
	if listname == "res" then
		return 0
	else
		return stack:get_count()
	end
end,

allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
	return 0
end,

on_receive_fields = function(pos, formname, fields, sender)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()

	local material_group = "wood"
	local ingotstack = inv:get_stack("ingot", 1)
	local resstack = inv:get_stack("res", 1)
	local anzahl = 0
	local shape

	if fields["joists"] then
		anzahl = "2"
		shape = "mydeck:joists"
	elseif fields["joistside"] then
		anzahl = "2"
		shape = "mydeck:joists_side"
	elseif fields["joistend"] then
		anzahl = "2"
		shape = "mydeck:joists_end"
	elseif fields["joistsidend"] then
		anzahl = "2"
		shape = "mydeck:joists_side_endr"
	elseif fields["joistendr"] then
		anzahl = "2"
		shape = "mydeck:joists_endr"
	elseif fields["joistsidendr"] then
		anzahl = "2"
		shape = "mydeck:joists_side_end"
	elseif fields["post"] then
		anzahl = "4"
		shape = "mydeck:post"
	elseif fields["beam"] then
		anzahl = "1"
		shape = "mydeck:beam"
	elseif fields["stairs"] then
		anzahl = "1"
		shape = "mydeck:stairs"
	elseif fields["stairso"] then
		anzahl = "1"
		shape = "mydeck:stairs_ocorner"
	elseif fields["stairsi"] then
		anzahl = "1"
		shape = "mydeck:stairs_icorner"
	elseif fields["sraill"] then
		anzahl = "3"
		shape = "mydeck:stairs_raill"
	elseif fields["srailr"] then
		anzahl = "3"
		shape = "mydeck:stairs_railr"
	elseif fields["deckb"] then
		anzahl = "4"
		shape = "mydeck:deck_boards"
	elseif fields["rail"] then
		anzahl = "2"
		shape = "mydeck:rail"
	elseif fields["railc"] then
		anzahl = "1"
		shape = "mydeck:rail_corner"
	elseif fields["railic"] then
		anzahl = "4"
		shape = "mydeck:rail_icorner"
	elseif fields["lattice"] then
		anzahl = "4"
		shape = "mydeck:lattice"
	elseif fields["pile"] then
		anzahl = "1"
		shape = "mydeck:pile"
		material_group = "stone"
	else
		return false
	end

	if ingotstack:is_empty() or minetest.get_item_group(ingotstack:get_name(), material_group) == 0 then
		return true
	end
	if not resstack:is_empty() and resstack:get_name() ~= shape then
		return true
	end

	for i = 0, anzahl-1 do
		inv:add_item("res", shape)
	end
	ingotstack:take_item()
	inv:set_stack("ingot" ,1, ingotstack)
end
})

minetest.register_craft({
		output = 'mydeck:machine',
		recipe = {
			{'', '', ''},
			{'group:wood', 'group:tree', 'group:wood'},
			{'group:tree', "group:wood", 'group:tree'},
		}
})

