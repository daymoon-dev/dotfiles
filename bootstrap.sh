# 콘솔에서 라이선스 동의하기
sudo xcodebuild -license

# Command Line Tool 설치
xcode-select --install

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
brew cask cleanup

# SHELL 기본을 ZSH로
chsh -s $(which zsh)

# Oh-my-zsh 설치
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"