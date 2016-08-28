#!/bin/bash

#
# Source: https://mwop.net/blog/134-exuberant-ctags-with-PHP-in-Vim.html
#

ctags -e -R --languages=php --exclude="CVS" --php-kinds=f \
--regex-PHP='/abstract class ([^ ]*)/\1/c/' \
--regex-PHP='/interface ([^ ]*)/\1/c/' \
--regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/'
