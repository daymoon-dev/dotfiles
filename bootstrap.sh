
# Set temporary variable
DOTFILES=$HOME/dotfiles

# Homebrew 설치 확인, 설치되어 있지 않은 경우 설치 진행
if test ~ $(which brew); then
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Export Homebrew Env Path
eval "$(/opt/homebrew/bin/brew shellenv)"

# Homebrew Update
brew Update

brew tap homebrew/bundle
brew bundle --file=$DOTFILES/Brewfile # Install binary & applications
brew cleanup

yes | cp $DOTFILES/.zshrc $HOME

# Oh-my-zsh 설치
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# zsh syntax highlighting 플러그인 설치
cd $HOME
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> $HOME/.zshrc

# git 설정
git config --global user.name "daymoon-dev"
git config --global user.email "daymoon.dev@raonfriends.com"

# node 설치
### 1. nvm
sudo curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
source $HOME/.zshrc

### 2. node
#nvm i --lts

#-------------------------------------------------------------------------------
# Set OS X preferences
# We will run this last because this will reload the shell
#-------------------------------------------------------------------------------

source $DOTFILES/.osx

yes | cp $DOTFILES/.zshrc $HOME
