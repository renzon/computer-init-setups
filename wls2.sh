sudo apt-get update
# Nice PS1
echo -e 'export PS1="\W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "' >> ~/.bashrc


# Install dev stuff
sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm gettext libncurses5-dev tk-dev tcl-dev blt-dev libgdbm-dev git python-dev python3-dev aria2 vim libnss3-tools python3-venv liblzma-dev libpq-dev

# XLaunch configuration:
## Install on windows: https://sourceforge.net/projects/vcxsrv/
## During initialization you need check "Disable Access Control" every time, or it will not work
echo -e 'export DISPLAY=$(route.exe print | grep 0.0.0.0 | head -1 | awk '{print $4}'):0.0' >> ~/.bashrc

#Pyenv
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
echo -e 'export PATH="~/.pyenv/bin:$PATH"' >> ~/.bashrc
echo -e 'eval "$(pyenv init -)"\n' >> ~/.bashrc


# Pycharm
mkdir ~/bin
wget https://download.jetbrains.com/python/pycharm-professional-2021.2.2.tar.gz -O ~/bin/pycharm-professional-2021.2.2.tar.gz
tar -xf ~/bin/pycharm-professional-2021.2.2.tar.gz --directory ~/bin
rm ~/bin/pycharm-professional-2021.2.2.tar.gz
touch ~/.bash_aliases
echo -e 'alias charm="bash ~/bin/pycharm-2021.2.2/bin/pycharm.sh > /dev/null 2>&1 &"' >> ~/.bash_aliases

# SSH: https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54
ssh-keygen -o -a 100 -t ed25519

