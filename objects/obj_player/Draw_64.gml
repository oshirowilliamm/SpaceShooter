draw_set_font(fnt_padrao);

if (global.debug)
{
    draw_text(20, 20, "Level Tiro: " + string(level_tiro));
}

//desenhando a vida
desenha_icone(vida, 50, spr_vida);

//desenhando escudos
desenha_icone(escudo, 20, spr_escudo)

draw_set_font(-1);