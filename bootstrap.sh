#!/bin/bash


# Requirement:
# Install git beforehand so that we can checkout the dotfiles from repo
# Installation is assuming that you're using Fedora, because I'm sticking to Fedora

# Checks prerequisite for installation

# install Powerline
sudo dnf install -y powerline powerline-fonts

# Install Vim-Pathogen
echo "Intall Vim Pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
 curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install all vim's plugins that I use.
echo "Intall My Vim Plugin"
# Read from vim.plugins file
for i in $(cat vim.plugins); do
 cd ~/.vim/bundle/
 git clone $i
 cd -
done

# Create vim colors
mkdir ~/.vim/colors/
# Copy my color schemes
cp ~/dotfiles/vim.colors/* ~/.vim/colors/

echo "Install FiraCode for font Ligatures"
# Install FiraCode Font Ligatures (docs: https://github.com/tonsky/FiraCode/wiki)
# This is nice in konsole/terminal, but, Terminator doesnt' support ligatures, so... shucks!
# create fonts dir
mkdir -p ~/.local/share/fonts

# run installation
for type in Bold Light Medium Regular Retina; do
 wget -O ~/.local/share/fonts/FiraCode-${type}.ttf \
   "https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-${type}.ttf?raw=true";
done

fc-cache -f

# TODO ::  Install PHP Brew for managing different version of PHP with ease (docs: https://github.com/phpbrew/phpbrew)
# Install PHPbrew deps
sudo yum install make gcc gcc-c++ kernel-devel -y
sudo yum install php php-bz2 php-devel php-pear bzip2-devel yum-utils libmcrypt-devel libpqxx-devel libxslt-devel pcre-devel libcurl-devel libgsasl-devel openldap-devel readline-devel libzip libzip-devel
sudo yum-builddep php -y

echo "Check Initial PHP version"
php -v
# Download PHP Brew
curl -L -O https://github.com/phpbrew/phpbrew/releases/latest/download/phpbrew.phar && chmod +x phpbrew.phar
sudo mv phpbrew.phar /usr/local/bin/phpbrew
phpbrew init

# Install PHP 7.1, and PHP 7.2 for prosperity (Using laravel standard installation)
phpbrew install 7.1.33 +default +mysql +sqlite +pdo +openssl +mbstring +xml +json +pgsql +pdo -- --with-openssl
# phpbrew install 7.2.31 +default +mysql +sqlite +pdo +openssl +mbstring +xml +json -- --with-openssl
# phpbrew install 7.3 +default +mysql +sqlite +pdo +openssl +mbstring +xml +json +pgsql +pdo -- --with-openssl
phpbrew install 7.4 +default +mysql +sqlite +pdo +openssl +mbstring +xml +json +pgsql +pdo -- --with-openssl
phpbrew install 8.0 +default +mysql +sqlite +pdo +openssl +mbstring +xml +json +pgsql +pdo -- --with-openssl
phpbrew install 8.1 +default +mysql +sqlite +pdo +openssl +mbstring +xml +json +pgsql +pdo -- --with-openssl
phpbrew install 8.2 +default +mysql +sqlite +pdo +openssl +mbstring +xml +json +pgsql +pdo -- --with-openssl


# Install composer
echo "Installing Composer"
./composer-installer.sh
sudo mv composer.phar /usr/local/bin/composer


# Install Fuzzy Finder
echo "Installing Fuzzy Finder"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install


# Create Symlink for the dotfiles to home dir
echo "Symlinking all my rc files"
mv ~/.bashrc ~/.bashrc.old
mv ~/.bash_profile ~/.bash_profile.old

ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.bash_aliases ~/.bash_aliases
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.bash_prompt ~/.bash_prompt
ln -s ~/dotfiles/.vimrc ~/.vimrc

# Install Docker
echo "Installing Docker"
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER

echo "Please Logout from X Session for docker to take effect"
