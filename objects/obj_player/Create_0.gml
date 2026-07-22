#region Variáveis

spd = 2;
hspd = 0;
vspd = 0;

//tiros
espera_tiro = 10;
timer_tiro = 0;
level_tiro = 1;

//vida
vida = 3;

//escudo
escudo = 3;
meu_escudo = noone;

#endregion



#region Métodos

//metodo de controle do player
controles = function()
{
    //pegando as teclas
    var _right  = keyboard_check(ord("D")) || keyboard_check(vk_right);
    var _left   = keyboard_check(ord("A")) || keyboard_check(vk_left);
    var _up     = keyboard_check(ord("W")) || keyboard_check(vk_up);
    var _down   = keyboard_check(ord("S")) || keyboard_check(vk_down);
    var _atirar = keyboard_check(vk_space) || mouse_check_button(mb_left);
    
    //velocidades vertical e horizontal
    hspd = (_right - _left) * spd;
    vspd = (_down - _up) * spd;
    
    //movimentação
    x += hspd;
    y += vspd;
    
    //limitando posição do player na room
    y = clamp(y, sprite_height / 2, room_height - sprite_height / 2);
    x = clamp(x, sprite_width / 2, room_width - sprite_width / 2);
    
    //atirando
    atirando(_atirar);
}

//atirando
atirando = function(_atirar)
{
    //diminuindo timer do tiro
    timer_tiro--;
    
    //se apertou o botão e o timer deixar, pode atirar
    if (_atirar && timer_tiro <= 0)
    {
        switch (level_tiro) 
        {
        	case 1: tiro1(); break;
            case 2: tiro2(); break;
            case 3: tiro3(); break;
            
            default: tiro1(); break;
        }
        
        //resetando timer do tiro
        timer_tiro = espera_tiro;
    }
}

//primeiro tiro (padrão)
tiro1 = function()
{
    var _tiro = instance_create_layer(x, y, "Tiro", obj_tiro_player);
    _tiro.vspeed = -10; //indo pra cima
}

//segundo tiro (dois tiros)
tiro2 = function()
{
    var _tiro = instance_create_layer(x - 12, y, "Tiro", obj_tiro_player);
    _tiro.vspeed = -10; //indo pra cima
    
    _tiro = instance_create_layer(x + 12, y, "Tiro", obj_tiro_player);
    _tiro.vspeed = -10; //indo pra cima
}

//terceiro tiro (tres tiros)
tiro3 = function()
{
    tiro1();
    tiro2();
}

//ganhando level 
ganha_level = function()
{
    if (level_tiro < 3) level_tiro++;
}

//desenha icones
desenha_icone = function(_icone, _espaco, _sprite)
{
    //posição
    var _x = 20;
    var _y = display_get_gui_height() - _espaco;
    
    //desenhando icone
    repeat (_icone) 
    {
    	draw_sprite_ext(_sprite, 0, _x, _y, 1, 1, 0, c_white, .6);
        
        _x += 30;
    }
}

//perde vida
perde_vida = function()
{
    //perdendo vida
    if (vida > 1)
    {
        vida--;
    }
    //morrendo
    else
    {
        instance_destroy();
    }
}

usa_escudo = function()
{
    if (keyboard_check_pressed(ord("E")))
    {   
        //perdendo escudo
        if (escudo > 0 && meu_escudo == noone)
        {
            //perdendo escudo
            escudo--;
            
            //criando o escudo
            meu_escudo = instance_create_layer(x, y, "Escudo", obj_escudo);
        }
    }
}

#endregion