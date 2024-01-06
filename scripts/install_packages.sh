#!/bin/bash

packagesPacmanBase=($(_read_lines_from_file "$(dirname "$0")/packages/packman_base.txt"))
packagesYayBase=($(_read_lines_from_file "$(dirname "$0")/packages/yay_base.txt"))
packagesPacman=($(_read_lines_from_file "$(dirname "$0")/packages/packman_base.txt"))
packagesYay=($(_read_lines_from_file "$(dirname "$0")/packages/yay.txt"))

_installPackagesPacman "${packagesPacmanBase[@]}";
_installPackagesYay "${packagesYayBase[@]}";
_installPackagesPacman "${packagesPacman[@]}";
_installPackagesYay "${packagesYay[@]}";
