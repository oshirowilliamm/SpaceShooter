controles();

//mudando level do tiro
if (keyboard_check_pressed(ord("O")))
{
    if (level_tiro > 1) level_tiro--;
}
if (keyboard_check_pressed(ord("L")))
{
    if (level_tiro < 3) level_tiro++;
}

//ativando debug
if (keyboard_check_pressed(vk_tab))
{
    global.debug = !global.debug;
}