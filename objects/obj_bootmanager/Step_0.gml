/// @description

global.font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ 0123456789", false, 1);

draw_set_font(global.font);
room_goto(rm_frontend);