mkdir -p $HOME/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tmux-sensible $HOME/.tmux/plugins/tmux-sensible
DOTFILES=$(pwd)
ln -s $DOTFILES/.tmux.conf $HOME
ln -s $DOTFILES/.tmuxcolors-dark.conf $HOME
ln -s $DOTFILES/.tmux-osx.conf $HOME
brew install reattach-to-user-namespace
tmux source-file ~/.tmux.conf


