//criando primeira onda
layer_sequence_create("Seq_inimigos", 0, 0, ondas[atual]);

//setando a proxima onda
if (atual < array_length(ondas) - 1)
{
    atual++;
    
    //reiniciando o alarme
    alarm[0] = 320;
}
else
{
    //reiniciando o alarme
    alarm[0] = 320;
    
    var _x = 64;
    //criando os inimigos 3
    repeat (3) 
    {
    	instance_create_layer(_x, -32, "Inimigo", obj_inimigo3);
        _x += 64;
    }
}
