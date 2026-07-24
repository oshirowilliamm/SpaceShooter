vida = 10;
estado = "chegando";
tempo_carregando = game_get_speed(gamespeed_fps) * 3;
timer_carregando = 0;

state_machine = function()
{
    switch (estado) 
    {
    	case "chegando":
            //indo pra baixo
            if (y < 160)
            {
                y++;
            }
            else
            {
                estado = "carregando";
            }
        break;
        
        case "carregando":
            //correndo o tempo
            timer_carregando++;
            
            //quando passar 3 segundos, ele muda de estado
            if (timer_carregando > tempo_carregando)
            {
                estado = "atirando";
            }
        break;
        
        case "atirando":
            //atirando
            var _tiro = instance_create_layer(x, y, "Tiro", obj_tiro_inimigo2);
            _tiro.vspeed = 4;
        break;
    }
}

morrendo = function()
{
    if (vida > 1)
    {
        //perdendo vida
        vida--;
    }
    else
    {
        //morrendo
        destruido(obj_inimigo_explosao);
    }
    
    //criando powerup
    var _chance = random(99);
    
    if (_chance > 95)
    {
        instance_create_layer(x, y, "Level", obj_powerup);   
    }
}