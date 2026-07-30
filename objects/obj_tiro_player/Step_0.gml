if (global.hitstop) exit;

//tamanho do tiro volta ao normal
image_xscale = lerp(image_xscale, 1, .1);
image_yscale = lerp(image_yscale, 1, .1);

//aumenta velocidade
vspd = lerp(vspd, -spd, .1);

y += vspd;

//criando rastro
var _rastro = instance_create_depth(x, y, depth, obj_rastro_tiro);
_rastro.cor = cor;