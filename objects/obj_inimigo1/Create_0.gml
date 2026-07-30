#region Variáveis

//tiros
espera_tiro = random_range(1, 2) * game_get_speed(gamespeed_fps);
timer_tiro = game_get_speed(gamespeed_fps) * 2;

criando_sequence = in_sequence;

#endregion


#region Métodos

atirando = function()
{
    //caindo o timer
    timer_tiro--;
    
    //so cria o tiro se o timer deixar
    if (timer_tiro <= 0)
    {
        //criando tiro
        var _tiro = instance_create_layer(x, y, "Tiro", obj_tiro_inimigo1);
        _tiro.vspd = 4;
        
        //som de tiro
        som(snd_enemy_laser);
        
        //resetando timer
        timer_tiro = espera_tiro;
    }
}

morrendo = function()
{
    destruido(obj_inimigo_explosao);
    
    //criando powerup
    var _chance = random(99);
    
    if (_chance > 95)
    {
        instance_create_layer(x, y, "Level", obj_powerup);   
    }
    
    //criando screenshake
    screenshake(50);
    
    //hitstop
    ativa_hitstop(5);
    
    //som de explodindo
    som(snd_explosion);
}

#endregion