///snake_move_left_state
var wall_left = place_meeting(x-1,y,Solid);
var ledge_left = !position_meeting(bbox_left-1,bbox_bottom+1,Solid);

if (wall_left || ledge_left){
    state = snake_move_right_state;
}


// Control the snake sprite
image_xscale = -1;

// Move snake
x-=1;
