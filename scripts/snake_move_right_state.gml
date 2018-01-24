///snake_move_right_state
var wall_right = place_meeting(x+1,y,Solid);
var ledge_right = !position_meeting(bbox_right+1,bbox_bottom+1,Solid);

if (wall_right || ledge_right){
    state = snake_move_left_state;
}


// Control the snake sprite
image_xscale = 1;

// Move snake
x+=1;
