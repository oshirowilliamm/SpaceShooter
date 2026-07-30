global.hitstop = false;

//ativando o hitstop
function ativa_hitstop(_tempo = 15)
{
    //checando a existencia do obj
    var _existe = instance_exists(obj_hitstop);
    if (!_existe) instance_create_depth(0, 0, 0, obj_hitstop);
    
    //efeito
    global.hitstop = true;
    obj_hitstop.timer_hitstop = _tempo;
    
    //travando os bgs
    trava_backgrounds(obj_hitstop.lista_bgs);
}

//checando as backgrounds
function pega_backgrounds()
{
    //pegando todas as layers
    var _layers = layer_get_all();
    var _bgs = [];
    
    for (var i = 0; i < array_length(_layers); i++)
    {
        var _atual = _layers[i];
        
        //pegando id da camada de background
        var _camada = layer_background_get_id(_atual);
        
        //camadas q n são backgrounds, retornam -1
        //pegando so as camadas de background
        if (_camada != -1)
        {
            array_push(_bgs, _atual);
        }
    }
    
    //retornando as camadas de backgrounds
    return _bgs;
}

function trava_backgrounds(_bgs)
{
    for (var i = 0; i < array_length(_bgs); i++)
    {
        var _atual = _bgs[i];
        
        //pegando as velocidades atuais
        array_push(obj_hitstop.bgs_hspeed, layer_get_hspeed(_atual));
        array_push(obj_hitstop.bgs_vspeed, layer_get_vspeed(_atual));
        
        //zerando a velocidade
        layer_hspeed(_atual, 0);
        layer_vspeed(_atual, 0);
    }
}

function destrava_backgrounds(_bgs, _hspd, _vspd)
{
    for (var i = 0; i < array_length(_bgs); i++)
    {
        var _atual  = _bgs[i];
        var _hspeed = _hspd[i];
        var _vspeed = _vspd[i];
        
        layer_hspeed(_atual, _hspeed);
        layer_vspeed(_atual, _vspeed);
    }
}