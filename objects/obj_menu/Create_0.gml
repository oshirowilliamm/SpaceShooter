menu = ["Jogar", "Tutorial", "Sair"];
atual = 0;
margem = 20;

controla_menu = function()
{
    //indo pra baixo
    if (keyboard_check_pressed(vk_down))
    {
        //mudando o atual
        atual++;
        
        //som
        audio_stop_sound(snd_botao_menu);
        som(snd_botao_menu, .1);
        
        //zerando a margem
        margem = 0;
    }
    
    //indo pra cima
    if (keyboard_check_pressed(vk_up))
    {
        //mudando o atual
        atual--;
        
        //som
        audio_stop_sound(snd_botao_menu);
        som(snd_botao_menu, .1);
        
        //zerando a margem
        margem = 0;
    }
    
    //limitando o atual
    atual = clamp(atual, 0, 2);
    //efeito da margem
    margem = lerp(margem, 20, .1);
    
    //funcionamento do menu
    ativa_menu();
    
}

ativa_menu = function()
{
    if (keyboard_check_pressed(vk_enter))
    {
        switch (atual) 
        {
            //jogar
        	case 0:
                //chamando transição 1
                chama_transicao("transicao", sq_transicao1);
                
                global.destino = rm_game;
                global.transicao = true;
            break;
            
            //tutorial
            case 1:
                //chamando transição 1
                chama_transicao("transicao", sq_transicao1);
                
                global.destino = rm_tutorial;
                global.transicao = true;
            break;
            
            //sair
            case 2:
                game_end();
            break;
        }
    }
}

desenha_menu = function()
{
    draw_set_valign(1);
    draw_set_font(fnt_menu);
    
    var _ycentro = display_get_gui_height() / 2;
    var _alt = string_height("I");
    
    //textos
    for (var i = 0; i < array_length(menu); i++)
    {
        var _margem = 0;
        var _cor = c_white;
        
        if (i == atual)
        {
            //cor
            _cor = c_red;
            
            //margem do x
            _margem = margem;
        }
        
        //posição
        var _y = _ycentro + (i * _alt - 50);
        var _x = 20 + _margem;
        
        //textos das opções
        draw_set_colour(_cor);
        draw_text(_x, _y, menu[i]);
        draw_set_colour(-1);
    }
    
    draw_set_font(-1);
    draw_set_valign(-1);    
}