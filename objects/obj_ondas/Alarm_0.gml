//criando primeira onda
layer_sequence_create("Seq_inimigos", 0, 0, ondas[atual]);

//setando a proxima onda
if (atual < array_length(ondas) - 1)
{
    atual++;
    
    //reiniciando o alarme
    alarm[0] = 320;
}
