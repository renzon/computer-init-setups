sudo apt-get update
# Nice PS1
echo -e 'export PS1="\W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "' >> ~/.bashrc


# Install dev stuff
sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm gettext libncurses5-dev tk-dev tcl-dev blt-dev libgdbm-dev git python3-dev aria2 vim libnss3-tools liblzma-dev libpq-dev


#Pyenv
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
echo -e 'export PATH="~/.pyenv/bin:$PATH"' >> ~/.bashrc
echo -e 'eval "$(pyenv init --path)"\n' >> ~/.bashrc
echo -e 'eval "$(pyenv virtualenv-init -)"\n' >> ~/.bashrc

# Pycharm
mkdir ~/bin
wget https://download.jetbrains.com/python/pycharm-professional-2021.2.2.tar.gz -O ~/bin/pycharm-professional-2021.2.2.tar.gz
tar -xf ~/bin/pycharm-professional-2021.2.2.tar.gz --directory ~/bin
rm ~/bin/pycharm-professional-2021.2.2.tar.gz
touch ~/.bash_aliases
echo -e 'alias charm="bash ~/bin/pycharm-2021.2.2/bin/pycharm.sh > /dev/null 2>&1 &"' >> ~/.bash_aliases


sudo apt remove docker docker-engine docker.io containerd runc
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce
sudo usermod -aG docker $USER

# SSH: https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54
ssh-keygen -o -a 100 -t ed25519

# SSH Keychain: https://esc.sh/blog/ssh-agent-windows10-wsl2/

echo -e '/usr/bin/keychain -q --nogui $HOME/.ssh/id_ed25519' >> ~/.bashrc
echo -e 'source $HOME/.keychain/$HOST-sh\n' >> ~/.bashrc
