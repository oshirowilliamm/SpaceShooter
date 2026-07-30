//diminuindo a vida
vida_atual--;

var _valor = vida_atual / vida_max;

//ficando transparente
image_alpha = _valor;

//perdendo velocidade
hspd = _valor * hspd_original * _valor;
vspd = _valor * vspd_original * _valor;

//cor
var _nova_cor = merge_colour(c_white, cor_original, _valor);
image_blend = _nova_cor;

//tamanho menor
image_xscale = _valor * escala_original;
image_yscale = image_xscale;


//movimento
x += hspd;
y += vspd;

//destruindo
if (vida_atual <= 0) instance_destroy();