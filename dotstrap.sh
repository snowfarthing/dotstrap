### dotstrap.sh
###
### Preserve default dotfiles and create symlinks to prefered dotfiles.
### This file is created using the following website as a template:
###
###    www.placona.com.uk/1224/linux/managing-your-dotfiles-the-right-way/


### WARNINGS BEFORE RUNNING!
echo "WARNING:  THIS SCRIPT REQUIRES git TO BE INSTALLED!"
read -p "DO YOU WISH TO CONTINUE? (type \"Yes\" if you do)!  "
if [ "$REPLY" != "Yes" ]; then
    exit
fi

###### Variables

dir=~/.dotfiles                      # dotfiles directory
olddir=~/.dotfiles/default-dotfiles  # old dotfiles backup directory

# list of files and folders to symlink in homedir
files=(
    ### bash config files
    .bashrc
    # .local.bash
    # .bash_profile
    # .bash_login
    # .bash_logout
    .bash   # directory

    ### Vim config files
    .vimrc
    ## Note that .vim is automatically generated and filled;
    ## it is likely that we will not put any config info in
    ## this directory
    # .vim   # directory

    ### Emacs config files
    #.emacs
    #.emacs.el
    .emacs.d   # directory

    ### Screen, tmux, git, ssh
    .screenrc
    .tmux.conf
    .gitconfig
    .myGitIgnore
    .ssh   # directory

    # MySQL/PostgreSQL setting
    .grcat
    .my.cnf
    .myclirc

    # NixOS favorite packages; perhaps, when I get brave enough,
    # I will replace this init script with the following file....
    default.nix
    configuration.nix

    # Keep an eye out for the .config directory!
    #.config

    ### Zsh -- I'm not quite sure if I'll be taking the plunge!
    # .zshrc
    # .zshenv
    # .zprofile
    # .zlogin
    # .zsh   # directory
)

######

echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"
echo

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in ${files[*]}; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/$file $olddir/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
    echo
done

# Install Tmux Plugin Manager (TPM)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


# execute any files to reflect preferences...
source ~/.bashrc
source ~/.vimrc

# To install NixOS
#
#     bash <(curl https://nixos.org/nix/install)


