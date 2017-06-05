# OpenSCAD Layer
A script to generate multiple `.DXF` files from a single OpenSCAD source, and optionally combine them into a single document.

## Installing
Combining depends on the `qcad` merge tool, which is a part of the `qcad` package:

* http://www.ribbonsoft.com/en/qcad-documentation/qcad-command-line-tools#merge
* https://github.com/qcad/qcad

The path to the merge tool, can be set inside the `layerscad.sh` file.

## Usage (OpenSCAD)

    use <layer.scad>;

    ...

    layer("{{ LAYER_NAME }}")
    {
        square([5,5]);
    }

## Usage (tool)
After the file has been setup, one can generate the (possibly) combined `.DXF` file(s), by running:

    ./layerscad.sh [ -combine ] {{ INPUT_FILE }}

## Ceveats
* All layers must be present within `{{ INPUT_FILE }}`.

A workaround if this is not the case, is dummy layers.
Aka:

    layer("LAYER_NOT_IN_MAIN_DOCUMENT") {}
