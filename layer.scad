module layer(name, colour)
{
    // If no show_layer is provided, show it all
    if(show_layer == undef)
        color(colour)
        children();
    // If a layer is provided, only show that
    else if(name == show_layer)
        children();
}
