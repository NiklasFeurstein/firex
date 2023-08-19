#!/bin/bash

##################        LINK        ##################
### https://github.com/Ajatt-Tools/transformers_ocr ####

echo "Installing transformers_ocr now"

paru -S --noconfirm --needed transformers_ocr > /dev/null 2>> log.txt
transformers_ocr download > /dev/null 2>> log.txt
