///boss_lift_state

image_index = 1;
if (vspd>=-16) vspd -= 0.5;
move(Solid);

if (place_meeting(x,y-42, Solid)){
    vspd= 0;
    state = boss_chase_state;
}
