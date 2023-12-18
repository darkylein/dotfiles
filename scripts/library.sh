#!/bin/bash
#  _     _ _
# | |   (_) |__  _ __ __ _ _ __ _   _
# | |   | | '_ \| '__/ _` | '__| | | |
# | |___| | |_) | | | (_| | |  | |_| |
# |_____|_|_.__/|_|  \__,_|_|   \__, |
#                               |___/
#
# -----------------------------------------------------
# by darkylein (2023)

# ------------------------------------------------------
# Function: Is package installed
# ------------------------------------------------------
_isInstalledPacman() {
    package="$1";
    check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

_isInstalledYay() {
    package="$1";
    check="$(yay -Qs --color always "${package}" | grep "local" | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

# ------------------------------------------------------
# Function: Install all package if not installed
# ------------------------------------------------------
_installPackagesPacman() {
    toInstall=();

    for pkg; do
        if [[ $(_isInstalledPacman "${pkg}") == 0 ]]; then
            echo "${pkg} is already installed.";
            continue;
        fi;

        toInstall+=("${pkg}");
    done;

    if [[ "${toInstall[@]}" == "" ]] ; then
        # echo "All pacman packages are already installed.";
        return;
    fi;

    printf "Packages not installed:\n%s\n" "${toInstall[@]}";
    sudo pacman --noconfirm -S "${toInstall[@]}";
}

_installPackagesYay() {
    toInstall=();

    for pkg; do
        if [[ $(_isInstalledYay "${pkg}") == 0 ]]; then
            echo "${pkg} is already installed.";
            continue;
        fi;

        toInstall+=("${pkg}");
    done;

    if [[ "${toInstall[@]}" == "" ]] ; then
        # echo "All packages are already installed.";
        return;
    fi;

    printf "AUR ackages not installed:\n%s\n" "${toInstall[@]}";
    yay --noconfirm -S "${toInstall[@]}";
}


# ------------------------------------------------------
# Function: Create symbolic links
# ------------------------------------------------------
_installSymLink() {
    name="$1"
    symlink="$2";
    linksource="$3";
    linktarget="$4";

    while true; do
        read -p "DO YOU WANT TO INSTALL ${name}? (Existing dotfiles will be removed!) (Yy/Nn): " yn
        case $yn in
            [Yy]* )
                if [ -L "${symlink}" ]; then
                    rm ${symlink}
                    ln -s ${linksource} ${linktarget}
		            echo "Symlink ${linksource} -> ${linktarget} created."
                    echo ""
    		    else
	    	        if [ -d ${symlink} ]; then
                        rm -rf ${symlink}/
		    		    ln -s ${linksource} ${linktarget}
                        echo "Symlink for directory ${linksource} -> ${linktarget} created."
                        echo ""
           		    else
	    	            if [ -f ${symlink} ]; then
                            rm ${symlink}
                    		ln -s ${linksource} ${linktarget}
                            echo "Symlink to file ${linksource} -> ${linktarget} created."
                            echo ""
		                else
		                    ln -s ${linksource} ${linktarget}
	                        echo "New symlink ${linksource} -> ${linktarget} created."
                            echo ""
                	    fi
                	fi
        	    fi
        break;;
            [Nn]* )
                echo ""
            break;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}


# ------------------------------------------------------
# Function: Execute command (and ask nicely)
# ------------------------------------------------------
_execCommand() {
    description="$1";
    command="$2";

    while true; do
    read -r -p "DO YOU WANT TO ${description} NOW? (Yy/Nn): " yn
    case $yn in
        [Yy]* )
            eval "$command"
        break;;
        [Nn]* )
#          exit;
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done
}

# ------------------------------------------------------
# Function: Enable daemons
# ------------------------------------------------------
_enableDaemons() {
  description="$1";
  command="$2";

  while true; do
  read -r -p "DO YOU WANT TO enable daemons NOW? (Yy/Nn): " yn
  case $yn in
    [Yy]* )
      for daemon; do
        sudo systemctl enable "$daemon"
        echo "Daemon $daemon enabled"
  done;
    break;;
    [Nn]* )
#      exit;
    break;;
    * ) echo "Please answer yes or no.";;
  esac
done
}

_disableDaemons() {
  description="$1";
  command="$2";

  while true; do
  read -r -p "DO YOU WANT TO disable and stop daemons NOW? (Yy/Nn): " yn
  case $yn in
    [Yy]* )
      for daemon; do
        sudo systemctl disable "$daemon"
        sudo systemctl stop "$daemon"
        echo "Daemon $daemon stopped and disabled"
  done;
    break;;
    [Nn]* )
#      exit;
    break;;
    * ) echo "Please answer yes or no.";;
  esac
done
}
