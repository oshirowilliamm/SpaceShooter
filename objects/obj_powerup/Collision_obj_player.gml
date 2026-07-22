//se destruindo
instance_destroy();

//criando explosao
var _explosao = instance_create_layer(x, y, layer, obj_tiro_explosao);
_explosao.image_angle = random(359);

//ganhando level do player
other.ganha_level();