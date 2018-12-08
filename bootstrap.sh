# Set temporary variable
DOTFILES=$HOME/dotfiles

# Homebrew 설치 확인, 설치되어 있지 않은 경우 설치 진행
if test ~ $(which brew); then
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Homebrew Update
brew Update

brew tap homebrew/bundle
brew bundle --file=$DOTFILES/Brewfile # Install binary & applications
brew cleanup

# SHELL 기본을 ZSH로
chsh -s $(which zsh)

# Oh-my-zsh 설치
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# zsh syntax highlighting 플러그인 설치
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

yes | cp $DOTFILES/.zshrc $HOME

# git 설정
git config --global user.name "icn.daymoon"
git config --global user.email "icn.daymoon@gmail.com"

# yarn 설치
npm install http-server yarn --global --save

source $HOME/.zshrc

#-------------------------------------------------------------------------------
# Set OS X preferences
# We will run this last because this will reload the shell
#-------------------------------------------------------------------------------

source $DOTFILES/.osx