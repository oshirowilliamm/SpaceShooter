function destruido(_obj = obj_tiro_explosao)
{
    instance_destroy();
    
    //criando explosão
    var _explosao = instance_create_layer(x, y, "Explosoes", _obj);
    _explosao.image_angle = random(359);
}

function screenshake(_shake)
{
    if (!instance_exists(obj_screenshake)) exit;
    
    with (obj_screenshake) 
    {
        if (_shake > shake)
        {
            shake = _shake;
        }
    }
}

function som(_snd, _p = .2)
{
    //som de explodindo
    var _pitch = random_range(1 - _p, 1 + _p);
    audio_play_sound(_snd, 0, 0, , , _pitch);
}


#region Efeito Mola

    function inicia_efeito_mola()
    {
        //tamanho do player
        xscale = 1;
        yscale = 1;
    }
    
    function efeito_mola(_xscale, _yscale)
    {
        xscale = _xscale;
        yscale = _yscale;
    }
    
    function retorna_mola(_qtd)
    {
        xscale = lerp(xscale, 1, _qtd);
        yscale = lerp(yscale, 1, _qtd);
    }
    
    function desenha_efeito_mola()
    {
        draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
    }

#endregion


#region Efeito Branco
    
    function inicia_efeito_branco()
    {
        tomei_tiro = 0;
    }
    
    function efeito_branco(_tempo)
    {
        tomei_tiro = _tempo;
    }
    
    function retorna_branco()
    {
        if (tomei_tiro > 0) tomei_tiro--;
    }
    
    function desenha_efeito_branco(_funcao_desenho = draw_self)
    {
        if (tomei_tiro)
        {
            //efeito de piscar branco quando levar tiro
            shader_set(sh_branco);
            _funcao_desenho();
            shader_reset();
        }
        else
        {
            //desenha normal com efeito de mola
            _funcao_desenho();
        }
    }
    
#endregion
