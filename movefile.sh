#!/bin/bash

#The MIT License (MIT)
#
#Copyright (c) 2016 pseudaria (pseudaria@gmail.com)
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated #documentation files (the "Software"), to deal in the Software without restriction, including without limitation the #rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit #persons to whom the Software is furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the #Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE #WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR #COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR #OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

readonly HOME="Insert Home Directory"

if [$HOME = "Insert Home Directory"]
  then
    echo "Please insert home directory in script."
    exit 1
fi

readonly PIC_DIR="$HOME/Pictures"
readonly DOC_DIR="$HOME/Documents"
readonly ARCHIVE_DIR="$HOME/Archives"
readonly ETC_DIR="$HOME/Etcs"

readonly DIR=("$PIC_DIR" "$DOC_DIR" "$ARCHIVE_DIR" "$ETC_DIR")

readonly PIC_TYPE=("jpg" "jpeg" "gif" "png")

readonly DOC_TYPE=("txt" "xls" "xlsx" "pdf" "doc" "docx" "odt" "ods" "obj" "hwp")

readonly ARCHIVE_TYPE=("zip" "tar")

readonly ETC_TYPE=("torrent" "blend")

# Make DIR
for dir in "${DIR[@]}"
do
    if [ ! -d "$dir" ]
      then
        mkdir $dir
    fi
done

# FOR PIC
for pic in "${PIC_TYPE[@]}"
do
    if [ ! -d "$PIC_DIR/$pic" ]
      then
      mkdir "$PIC_DIR/$pic"
    fi

    find . -maxdepth 1 -name "*.$pic" -type f -print0 | xargs -0 mv --target-directory="$PIC_DIR/$pic"
done

# FOR DOC
for doc in "${DOC_TYPE[@]}"
do
    if [ ! -d "$DOC_DIR/$doc" ]
      then
      mkdir "$DOC_DIR/$doc"
    fi

    find . -maxdepth 1 -name "*.$doc" -type f -print0 | xargs -0 mv --target-directory="$DOC_DIR/$doc"
done

# FOR ARCHIVE
for arc in "${ARCHIVE_TYPE[@]}"
do
    if [ ! -d "$ARCHIVE_DIR/$arc" ]
      then
      mkdir "$ARCHIVE_DIR/$arc"
    fi

    if [ $arc = "tar" ]
      then
        find . -maxdepth 1 -name "*.$arc*" -type f -print0 | xargs -0 mv --target-directory="$ARCHIVE_DIR/$arc"
      else
        find . -maxdepth 1 -name "*.$arc" -type f -print0 | xargs -0 mv --target-directory="$ARCHIVE_DIR/$arc"
    fi
done

# FOR ETC
for etc in "${ETC_TYPE[@]}"
do
    if [ ! -d "$ETC_DIR/$etc" ]
      then
      mkdir "$ETC_DIR/$etc"
    fi

    find . -maxdepth 1 -name "*.$etc" -type f -print0 | xargs -0 mv --target-directory="$ETC_DIR/$etc"
done

exit 0
