function cria_particulas(_vida_min = 30, _vida_max = 60, _x = 0, _y = 0, _hspd = 0, _vspd = 0, _cor = c_white)
{
    //checando se o obj existe
    if (!instance_exists(obj_part_manager)) instance_create_depth(0, 0, 0, obj_part_manager);
        
    with (obj_part_manager) 
    {
        //quantas particulas vou criar
        var _qtd = irandom_range(10, 50);
        
        //variaveis da particula
        var _dir = point_direction(0, 0, _hspd, _vspd);
        var _spd = abs(_hspd) + abs(_vspd);
        
        repeat (_qtd) 
        {
        	//criando as particulas
            var _xx = _x + random_range(-12, 12);
            var _yy = _y + random_range(_spd, _spd * 4);
            var _part = instance_create_layer(_xx, _yy, "Particulas", obj_part_tiro);
            
            //criando as variaveis
            var _dir_part   = _dir + random_range(-30, 30);
            var _tam        = random_range(.2, .5);
            var _vida       = random_range(_vida_min, _vida_max);
            var _spd_extra  = random_range(.1, 5);
            
            //setando as variaveis
            with (_part) 
            {
                hspd_original     = lengthdir_x(_spd + _spd_extra, _dir_part);
                vspd_original     = lengthdir_y(_spd + _spd_extra, _dir_part);
                escala_original   = _tam;
                image_angle       = _dir_part;
                vida_max          = _vida;
                vida_atual        = _vida;
                cor_original      = _cor;
                sprite_index      = choose(spr_part_quadrado, spr_part_triangulo);
            }
        }
    }
}