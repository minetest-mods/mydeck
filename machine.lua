local material = {}
local shape = {}
local make_ok = 0
local make_ok2 = 0
local make_ok3 = 0
local anzahl = {}
local brushcount = {}
local cbruchcount = {}

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
	if  inv:is_empty("ingot") and
	    inv:is_empty("res") and
	    inv:is_empty("wool") and
	    inv:is_empty("steel") and
	    inv:is_empty("stick") and
	    inv:is_empty("brush") and
	    inv:is_empty("dye") and
	    inv:is_empty("cbrush") then
	return true
	else
	return false
	end
end,

on_construct = function(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string("formspec", "invsize[12,10;]"..
		"background[-0.15,-0.25;12.40,10.75;mydeck_background.png]"..
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

		"label[9.5,0.5;Craft Stain Brush]"..
		"label[10.5,1;Wool]"..
		"list[current_name;wool;9.5,1;1,1;]"..
		"label[10.5,2;Steel Ingot]"..
		"list[current_name;steel;9.5,2;1,1;]"..
		"label[10.5,3;Stick]"..
		"list[current_name;stick;9.5,3;1,1;]"..
		"button[9.5,4;1,1;mbrush;Make]"..
		"label[10.5,5;Brush]"..
		"list[current_name;brush;9.5,5;1,1;]"..
		"label[10.5,6;Dye]"..
		"list[current_name;dye;9.5,6;1,1;]"..
		"button[9.5,7;1,1;mcbrush;Make]"..
		"list[current_name;cbrush;9.5,8;1,1;]"..

		"list[current_player;main;0.5,6;8,4;]")
	meta:set_string("infotext", "Deck Machine")
	local inv = meta:get_inventory()
	inv:set_size("ingot", 1)
	inv:set_size("res", 1)
	inv:set_size("wool", 1)
	inv:set_size("steel", 1)
	inv:set_size("stick", 1)
	inv:set_size("brush", 1)
	inv:set_size("dye", 1)
	inv:set_size("cbrush", 1)
end,

on_receive_fields = function(pos, formname, fields, sender)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()

if fields["joists"] 
or fields["joistside"]
or fields["joistend"] 
or fields["joistsidend"] 
or fields["joistendr"]
or fields["joistsidendr"]

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
local gwood = minetest.registered_aliases[ingotstack:get_name()]
	if not gwood then
	    gwood = ingotstack:get_name()
	end
local allwood = minetest.registered_items[gwood]

	if allwood and allwood.groups and allwood.groups["wood"] then
				make_ok = "1"
		end

-----------------------------------------------------------------------
		if make_ok == "1" then
			local give = {}
			for i = 0, anzahl-1 do
				give[i+1]=inv:add_item("res",shape)
			end
			ingotstack:take_item()
			inv:set_stack("ingot",1,ingotstack)
		end            	
end --if fields
----------------------------------------------------------------------
	if fields["pile"] then
		make_ok = "0"
		anzahl = "1"
		shape = "mydeck:pile"
		if inv:is_empty("ingot") then
			return
		end
	
		local ingotstack = inv:get_stack("ingot", 1)
		local resstack = inv:get_stack("res", 1)
	if ingotstack:get_name()== "default:stone" then
			material = "mydeck:pile"
			make_ok = "1"
	end
-----------------------------------------------------------------------
		if make_ok == "1" then
			local give = {}
			for i = 0, anzahl-1 do
				give[i+1]=inv:add_item("res",shape)
			end
			ingotstack:take_item()
			inv:set_stack("ingot",1,ingotstack)
		end            	
end --if fields
---------------------------------------------------------------------

for i in ipairs (color_tab) do
local col = color_tab[i][1]
local coldesc = color_tab[i][2]
local alpha = color_tab[i][3]


		local woolstack = inv:get_stack("wool", 1)
		local steelstack = inv:get_stack("steel", 1)
		local stickstack = inv:get_stack("stick", 1)
		local brushstack = inv:get_stack("brush", 1)
		local dyestack = inv:get_stack("dye", 1)

if fields["mbrush"]
then
	if fields["mbrush"] then
		make_ok2 = "0"
		if inv:is_empty("wool") or
		   inv:is_empty("steel") or
		   inv:is_empty("stick") then
		return
		end
	end

	if woolstack:get_name()== "wool:"..col and
	   steelstack:get_name()=="default:steel_ingot" and
	   stickstack:get_name()== "default:stick" then
			material = "mydeck:stain_brush"
			make_ok2 = "1"
	end

	if inv:is_empty("brush") and
	   make_ok2 == "1" then
		inv:add_item("brush",material)
		woolstack:take_item()
		inv:set_stack("wool",1,woolstack)
		steelstack:take_item()
		inv:set_stack("steel",1,steelstack)
		stickstack:take_item()
		inv:set_stack("stick",1,stickstack)
	end

end --if fields

if fields["mcbrush"]
then

	if fields["mcbrush"] then
		make_ok3 = "0"
		if inv:is_empty("brush") or
		   inv:is_empty("dye") then
			return
		end
	end

		if brushstack:get_name()=="mydeck:stain_brush" and
		   dyestack:get_name()=="dye:"..col then
				material = "mydeck:stain_brush_"..col
				make_ok3 = "1"
		end

	if inv:is_empty("cbrush") and 
	   make_ok3 == "1" then
		inv:add_item("cbrush",material)	
		brushstack:take_item()
		inv:set_stack("brush",1,brushstack)
		dyestack:take_item()
		inv:set_stack("dye",1,dyestack)
	end
	

end --if fields
end --color table
end --on_recieve
})

--Craft

minetest.register_craft({
		output = 'mydeck:machine',
		recipe = {
			{'', '', ''},
			{'default:wood', 'default:tree', 'default:wood'},
			{'default:tree', "default:wood", 'default:tree'},		
		}
})













