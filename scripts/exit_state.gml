///exit_state

if (image_alpha > 0){
    image_alpha -= 0.25;    
} else{
    if (room != room_last){
        room_goto_next();
    } else {
        //calculate score
        score = PlayerStats.sapphires; //* (((PlayerStats.time)>999?1:1000-PlayerStats.time)/10)
        
        // Open highscores
        ini_open("settings.ini");
        PlayerStats.highscore = ini_read_real("Score","highscore",0);
        if (score > PlayerStats.highscore){
            PlayerStats.highscore = score;
            ini_write_real("Score","highscore",PlayerStats.highscore);
        }
        ini_close();

        room_goto(rm_highscore);
    }
}
