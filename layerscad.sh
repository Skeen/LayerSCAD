#!/bin/bash

INPUT_FILE=$1

OUTPUT_DIR=output
XML_FILE=$OUTPUT_DIR/merge.xml
QCAD_MERGE=./qcad/qcad/merge

rm -rf $OUTPUT_DIR
mkdir -p $OUTPUT_DIR

LAYERS=$(grep -o 'layer(".*")' $INPUT_FILE | tr -d '"' | grep -o "(.*)" | tr -d '(' | tr -d ')' | cut -d',' -f1)

echo '<?xml version="1.0" encoding="UTF-8"?>' > $XML_FILE
echo '<merge xmlns="http://qcad.org/merge/elements/1.0/" unit="Millimeter">' >> $XML_FILE

for LAYER in $LAYERS; do
    echo $LAYER
    FILENAME=$INPUT_FILE.$LAYER.dxf
    echo "<item src=\"$FILENAME\">" >> $XML_FILE
    echo '<insert/>' >> $XML_FILE
    echo '</item>' >> $XML_FILE

    openscad -o $OUTPUT_DIR/$FILENAME --render -D show_layer="\"$LAYER\"" $INPUT_FILE
done

echo '</merge>' >> $XML_FILE

$QCAD_MERGE -o $OUTPUT_DIR/combined.dxf $XML_FILE
