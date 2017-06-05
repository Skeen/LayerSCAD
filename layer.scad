module layer(name, colour)
{
    if(show_layer == undef)
        color(colour)
        children();

    if(name == show_layer)
        children();
}
