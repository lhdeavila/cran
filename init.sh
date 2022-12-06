#!/bin/sh
# author: eleAche
# description: cran environment for Debian Linux. https://cran.r-project.org/

cran_packages(){
	apt-cache search "^r-.*" | sort
}

# get started
cran_install(){
	echo "[+] preparing the environment... " > /dev/stderr
	apt-get -y update
	apt-get install -y r-base r-base-dev
	apt-get install -y libatlas3-base || apt-get install -y libopenblas-base
	echo "[+] ready! " > /dev/stderr
}

# support
cran_support() {
	apt-cache rdepends r-base-core
}

about(){
echo -e "\e[1;30m"
cat << 'EOF'
--==[ this script was written for educational |
    | purposes only.                 eleAche. ]==--
EOF
echo -e "\e[m"
}

# main
cran_install >/dev/null && cat << 'EOF'
_______________________________

Write 'R' to interact with R
>_ R

To see the available packages (there are many) enter the following command
R> install.packages()

For an introduction to the language, see:
https://cran.r-project.org/doc/manuals/r-release/R-intro.pdf

An introduction to applications of R:
https://doc.lagout.org/science/Artificial%20Intelligence/Machine%20learning/Machine%20Learning%20for%20Hackers_%20Case%20Studies%20and%20Algorithms%20to%20Get%20You%20Started%20%5BConway%20%26%20White%202012-02-25%5D.pdf
_______________________________
EOF

about
