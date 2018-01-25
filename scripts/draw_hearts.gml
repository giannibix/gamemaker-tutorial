///draw_hearts()

// Draw heart soaces
for (var i=0; i<maxhp; i++){
    draw_sprite_ext(spr_heart, 0, 24+i*36, 20, 1, 1, 0, c_black, 0.5);
}

// Draw hearts
for (var i=0; i<hp; i++){
    draw_sprite_ext(spr_heart, 0, 24+i*36, 20, 1, 1, 0, c_white, 1);
}

// Draw sapphire count
draw_set_halign(fa_right);

draw_set_font(font_start);
var sapphiretext = "x"+string(sapphires);
draw_text_colour(view_wview[0] - 16, 8, sapphiretext,c_white,c_white,c_white,c_white,1);
var text_width=string_width(sapphiretext)

draw_sprite(spr_sapphire_gui,0,view_wview[0]-32-text_width,22);

// Draw timer
time+=1;
draw_text_colour(view_wview[0]/2+64, 8, "Time: "+string(time/room_speed),c_white,c_white,c_white,c_white,1);



