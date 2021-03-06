///move_state()


if (!place_meeting(x,y+1,Solid)){
    vspd += grav;
    
    // Player is in the air
    sprite_index = spr_player_jump
    image_speed = 0;
    image_index = (vspd > 0);
    
    if (up_release && vspd < -6){
        vspd = -6;
    }
    
} else {
    vspd = 0;
    
    if (up){
        vspd = -jspd;
        audio_play_sound(snd_jump,5,false);
    }
    
    // Player on ground
    if (hspd == 0) sprite_index = spr_player_idle
    else { 
        sprite_index = spr_player_walk
        image_speed = 0.6;
    }
}


if (right || left) {
    hspd += (right-left)*acc;
    hspd_dir = right-left;
    
    if (hspd > spd) hspd = spd;
    if (hspd < -spd) hspd = -spd;
}
else {
    apply_friction(acc);
}

if (hspd != 0){
    image_xscale = sign(hspd);
}

// Play landing sound
if (place_meeting(x,y+vspd+1, Solid) && vspd > 0){
    audio_emitter_pitch(audio_em,random_range(0.8,1.2));
    audio_emitter_gain(audio_em,0.2);
    audio_play_sound_on(audio_em,snd_step,false,6);
}

move(Solid);

// Check for ledge grab state
var falling = y-yprevious>0;
var no_wall_previous = !position_meeting(x+17*image_xscale, yprevious, Solid)
var is_wall_current = position_meeting(x+17*image_xscale, y, Solid);

if (falling && no_wall_previous && is_wall_current){
    hspd = vspd = 0;
    
    // Move against ledge
    while (!place_meeting(x+image_xscale, y, Solid)){
        x+=image_xscale;
    }
    
    while (position_meeting(x+17*image_xscale, y-1, Solid)){
        y-=1;
    }
    
    sprite_index = spr_player_ledge_grab;
    state = ledge_grab_state;
    
    //Play ledge grab sound
    audio_emitter_pitch(audio_em,1.5);
    audio_emitter_gain(audio_em,0.1);
    audio_play_sound_on(audio_em,snd_step,false,6);
}

