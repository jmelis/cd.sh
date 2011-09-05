if [ -d ~/.cd ]; then
    echo -e "\033[0;33mYou already have cd.sh installed.\033[0m"
    exit
fi

echo -e "\033[0;34mCloning cd.sh...\033[0m"
/usr/bin/env git clone https://github.com/jmelis/cd.sh ~/.cd

echo -e "\033[0;33mBacking up to ~/.bashrc.pre-cd.sh\033[0m";
cp ~/.bashrc ~/.bashrc.pre-cd.sh;

echo -e  "\033[0;34mSource cd.sh with bash.\033[0m"
echo -e "\nsource ~/.cd/cd.sh" >> ~/.bashrc

echo -e "\n\n \033[0;32mcd.sh is now installed.\033[0m"
echo -e "Open a new terminal or run '\033[0;32msource ~/.cd/cd.sh\033[0m'"
