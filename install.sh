if [ -d ~/.cd ]; then
    echo -e "You already have cd.sh installed."
    exit
fi

echo -e "Cloning cd.sh..."
OUT=$(/usr/bin/env git clone -q https://github.com/jmelis/cd.sh ~/.cd 2>&1)

if [ "$?" != "0" ]; then
    echo "$OUT"
fi

echo -e "Backing up to ~/.bashrc.pre-cd.sh";
cp ~/.bashrc ~/.bashrc.pre-cd.sh;

echo -e "\nsource ~/.cd/cd.sh" >> ~/.bashrc
echo ""
echo -e "cd.sh is now installed."
echo -e "Open a new terminal or run '\033[0;32msource ~/.cd/cd.sh\033[0m'"
