local material = {}
local shape = {}
local make_ok = {}
local anzahl = {}

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
	groups = {cracky=2},
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
	local meta = minetest.env:get_meta(pos);
			meta:set_string("owner",  (placer:get_player_name() or ""));
			meta:set_string("infotext",  "Deck Machine (owned by " .. (placer:get_player_name() or "") .. ")");
		end,

can_dig = function(pos,player)
	local meta = minetest.env:get_meta(pos);
	local inv = meta:get_inventory()
	if not inv:is_empty("ingot") then
		return false
	elseif not inv:is_empty("res") then
		return false
	end
	return true
end,

on_construct = function(pos)
	local meta = minetest.env:get_meta(pos)
	meta:set_string("formspec", "invsize[10,11;]"..
		"background[-0.15,-0.25;10.40,11.75;mydeck_background.png]"..
		"label[4,5;Wood:]"..
		"list[current_name;ingot;4,5.5;1,1;]"..
		"label[6.5,5;Output:]"..
		"list[current_name;res;6.5,5.5;1,1;]"..
		"label[0,0;Choose Deck Parts:]"..
		"label[0.5,0.5;Joists]"..
		"image_button[0.5,1;1,1;mydeck_mach1.png;joists; ]"..
		"image_button[1.5,1;1,1;mydeck_mach2.png;joistside; ]"..
		"image_button[2.5,1;1,1;mydeck_mach3.png;joistend; ]"..
		"image_button[3.5,1;1,1;mydeck_mach4.png;joistsidend; ]"..
		"image_button[4.5,1;1,1;mydeck_mach5.png;joistendr; ]"..
		"image_button[5.5,1;1,1;mydeck_mach6.png;joistsidendr; ]"..
		"image_button[7,1;1,1;mydeck_mach20.png;brush; ]"..
		"label[0.5,2;Pile Post Beam and Stairs]"..
		"image_button[0.5,2.5;1,1;mydeck_mach7.png;pile; ]"..
		"image_button[1.5,2.5;1,1;mydeck_mach8.png;post; ]"..
		"image_button[2.5,2.5;1,1;mydeck_mach9.png;beam; ]"..
		"image_button[3.5,2.5;1,1;mydeck_mach14.png;stairs; ]"..
		"image_button[4.5,2.5;1,1;mydeck_mach15.png;stairso; ]"..
		"image_button[5.5,2.5;1,1;mydeck_mach16.png;stairsi; ]"..
		"image_button[6.5,2.5;1,1;mydeck_mach17.png;sraill; ]"..
		"image_button[7.5,2.5;1,1;mydeck_mach18.png;srailr; ]"..
		"label[0.5,3.5;Deck Boards and Rail]"..
		"image_button[0.5,4;1,1;mydeck_mach10.png;deckb; ]"..
		"image_button[1.5,4;1,1;mydeck_mach11.png;rail; ]"..
		"image_button[2.5,4;1,1;mydeck_mach12.png;railc; ]"..
		"image_button[3.5,4;1,1;mydeck_mach13.png;railic; ]"..
		"image_button[4.5,4;1,1;mydeck_mach19.png;lattice; ]"..

		"list[current_player;main;1,7;8,4;]")
	meta:set_string("infotext", "Deck Machine")
	local inv = meta:get_inventory()
	inv:set_size("ingot", 1)
	inv:set_size("res", 1)
end,

on_receive_fields = function(pos, formname, fields, sender)
	local meta = minetest.env:get_meta(pos)
	local inv = meta:get_inventory()

if fields["joists"] 
or fields["joistside"]
or fields["joistend"] 
or fields["joistsidend"] 
or fields["joistendr"]
or fields["joistsidendr"]
or fields["brush"]

or fields["pile"]
or fields["post"]
or fields["beam"]
or fields["stairs"]
or fields["stairso"]
or fields["stairsi"]
or fields["sraill"]
or fields["srailr"]

or fields["deckb"]
or fields["rail"]
or fields["railc"]
or fields["railic"]
or fields["lattice"]
then

	if fields["joists"] then
		make_ok = "0"
		anzahl = "2"
		shape = "mydeck:joists"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["joistside"] then
		make_ok = "0"
		anzahl = "2"
		shape = "mydeck:joists_side"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["joistend"] then
		make_ok = "0"
		anzahl = "2"
		shape = "mydeck:joists_end"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["joistsidend"] then
		make_ok = "0"
		anzahl = "2"
		shape = "mydeck:joists_side_endr"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["joistendr"] then
		make_ok = "0"
		anzahl = "2"
		shape = "mydeck:joists_endr"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["joistsidendr"] then
		make_ok = "0"
		anzahl = "2"
		shape = "mydeck:joists_side_end"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["brush"] then
		make_ok = "0"
		anzahl = "2"
		shape = "mydeck:stain_brush"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["pile"] then
		make_ok = "0"
		anzahl = "1"
		shape = "mydeck:pile"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["post"] then
		make_ok = "0"
		anzahl = "4"
		shape = "mydeck:post"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["beam"] then
		make_ok = "0"
		anzahl = "1"
		shape = "mydeck:beam"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["stairs"] then
		make_ok = "0"
		anzahl = "1"
		shape = "mydeck:stairs"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["stairso"] then
		make_ok = "0"
		anzahl = "1"
		shape = "mydeck:stairs_ocorner"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["stairsi"] then
		make_ok = "0"
		anzahl = "1"
		shape = "mydeck:stairs_icorner"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["sraill"] then
		make_ok = "0"
		anzahl = "3"
		shape = "mydeck:stairs_raill"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["srailr"] then
		make_ok = "0"
		anzahl = "3"
		shape = "mydeck:stairs_railr"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["deckb"] then
		make_ok = "0"
		anzahl = "4"
		shape = "mydeck:deck_boards"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["rail"] then
		make_ok = "0"
		anzahl = "2"
		shape = "mydeck:rail"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["railc"] then
		make_ok = "0"
		anzahl = "1"
		shape = "mydeck:rail_corner"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["railic"] then
		make_ok = "0"
		anzahl = "4"
		shape = "mydeck:rail_icorner"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["lattice"] then
		make_ok = "0"
		anzahl = "4"
		shape = "mydeck:lattice"
		if inv:is_empty("ingot") then
			return
		end
	end

	
		local ingotstack = inv:get_stack("ingot", 1)
		local resstack = inv:get_stack("res", 1)
----------------------------------------------------------------------------------
--register nodes
----------------------------------------------------------------------------------
		if ingotstack:get_name()=="default:wood" then
				make_ok = "1"
		end

----------------------------------------------------------------------
		if make_ok == "1" then
			local give = {}
			for i = 0, anzahl-1 do
				give[i+1]=inv:add_item("res",shape)
			end
			ingotstack:take_item()
			inv:set_stack("ingot",1,ingotstack)
		end            	
end
end


})

--Craft

minetest.register_craft({
		output = 'mydeck:machine',
		recipe = {
			{'', '', ''},
			{'default:wood', 'default:tree', 'default:wood'},
			{'default:tree', "default:wood", 'default:tree'},		
		},
})













