function chama_transicao(_camada, _sequence)
{
    //chamando transição 1
    layer_sequence_create(_camada, 0, 0, _sequence);
}

function muda_room_transicao()
{
    room_goto(global.destino);
}

function finaliza_transicao()
{
    global.transicao = false;
}