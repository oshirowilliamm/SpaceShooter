global.debug = false;


function destruido (_obj = obj_tiro_explosao)
{
    instance_destroy();
    
    //criando explosão
    var _explosao = instance_create_layer(x, y, "Explosoes", _obj);
    _explosao.image_angle = random(359);
}