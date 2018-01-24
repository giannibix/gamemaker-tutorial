///spider_idle_state

// Look for player
if (instance_exists(Player)){
    var dist = distance_to_object(Player);
    
    if (dist < sight && alarm[0] <= 0){
        image_speed = 0.5;
        
        // Face player
        if (Player.x != x){
            image_xscale = sign(Player.x-x);
        }
    }

}
