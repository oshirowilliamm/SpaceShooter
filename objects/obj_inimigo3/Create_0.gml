vida = 10;
estado = "chegando";
tempo_carregando = game_get_speed(gamespeed_fps) * 2;
timer_carregando = 0;
contador = 0;
decidir_direcao = false;

spd = 1;
vspd = 0;
hspd = 0;

inicia_efeito_mola();
inicia_efeito_branco();

state_machine = function()
{
    switch (estado) 
    {
    	case "chegando":
            //indo pra baixo
            if (y < 160)
            {
                vspd = spd;
            }
            else
            {
                vspd = 0;
                estado = "carregando";
            }
        break;
        
        case "carregando":
            //correndo o tempo
            timer_carregando++;
            
            //quando passar 3 segundos, ele muda de estado
            if (timer_carregando >= tempo_carregando)
            {
                estado = choose("atirando", "atirando2");
                timer_carregando = 0;
                contador++;
            }
        break;
        
        case "atirando":
            if (instance_exists(obj_player))
            {
                //atirando
                var _tiro = instance_create_layer(x, y, "Tiro", obj_tiro_inimigo3);
                
                //atirando na direção do player
                var _dir = point_direction(x, y, obj_player.x, obj_player.y);
                
                //velocidade do tiro
                var _hspd = lengthdir_x(_tiro.spd, _dir);
                var _vspd = lengthdir_y(_tiro.spd, _dir);
                _tiro.hspd = _hspd;
                _tiro.vspd = _vspd;
                
                //direção
                _tiro.direction = _dir;
                _tiro.image_angle = _dir + 90;
                
                //som de tiro
                som(snd_enemy_laser);
            }
            
            if (contador < 3)
            {
                //volta a carregar
                estado = "carregando";
            }
            else
            {
                //fugindo
                estado = "fugindo";
            }
            
        break;
        
        case "atirando2":
            var _ang = 255;
            repeat (3) 
            {
            	//atirando
                var _tiro = instance_create_layer(x, y, "Tiro", obj_tiro_inimigo3b);
                
                //velocidade do tiro
                var _hspd = lengthdir_x(_tiro.spd, _ang);
                var _vspd = lengthdir_y(_tiro.spd, _ang);
                _tiro.hspd = _hspd;
                _tiro.vspd = _vspd;
                
                //direção
                _tiro.direction = _ang;
                _tiro.image_angle = _tiro.direction + 90;
                
                _ang += 15;
            }
            
            //som de tiro
            som(snd_enemy_laser);
            
            if (contador < 3)
            {
                //volta a carregar
                estado = "carregando";
            }
            else
            {
                //fugindo
                estado = "fugindo";
            }
            
        break;
        
        case "fugindo":
            if (!decidir_direcao)
            {
                hspd = lengthdir_x(spd * 2, random(359));
                vspd = lengthdir_y(spd * 2, random(359));
                decidir_direcao = true;
            }
            //se destruindo ao sair da room
            if (y < -50 || y > room_height + 50 || x < -50 || x > room_width + 50)
            {
                instance_destroy();
            }
        break;
    }
}

morrendo = function()
{
    //efeito mola
    efeito_mola(1.5, .8);
    efeito_branco(2);
    
    if (vida > 1)
    {
        //perdendo vida
        vida--;
        
        //hitstop
        ativa_hitstop(2);
    }
    else
    {
        //morrendo
        destruido(obj_inimigo_explosao);
        
        //criando powerup
        var _chance = random(99);
        
        if (_chance > 95)
        {
            instance_create_layer(x, y, "Level", obj_powerup);   
        }
        
        //criando screenshake
        screenshake(50);
        
        //som de explosao
        som(snd_explosion);
    }
}