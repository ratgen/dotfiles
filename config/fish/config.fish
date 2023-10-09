if status is-interactive
  alias vim "nvim"
  alias dotfiles "cd ~/dotfiles"

  alias sa "cd ~/documents/6semester/software_architecture/"

  set fish_greeting

  set -x TERMINAL xfce4-terminal
  set -x ANDROID_SDK_ROOT $HOME/Android/Sdk
  set -x PATH $PATH:$ANDROID_SDK_ROOT/emulator
  set -x PATH $PATH:$ANDROID_SDK_ROOT/platform-tools
  set -x ANDROID_HOME /Users/peter/Library/Android/sdk

  alias gitrm "git ls-files -i -c --exclude-from=.gitignore | xargs git rm --cached"
  alias icat "kitty +kitten icat"

  set -xU LS_COLORS 'di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
  set -x EDITOR nvim

  alias screenshot "scrot -s /home/peter/screenshot/%d-%m-%y_%H:%M:%S.png"
  alias screenshot_here "scrot -s (pwd)/%d-%m-%y_%H:%M:%S.png"

  alias zathura "zathura --fork"
  alias fm "vifm $(pwd)"

  fish_add_path /opt/homebrew/bin
  fish_add_path /opt/homebrew/opt/openjdk/bin
  fish_add_path /opt/homebrew/opt/openjdk@11/bin
  fish_add_path /opt/homebrew/opt/openjdk@17/bin
  fish_add_path /Applications/MongoDB.app/Contents/Resources/Vendor/mongodb/bin
  fish_add_path /Users/peter/Library/Android/sdk/platform-tools
  set -x DOTNET_ROOT /opt/homebrew/opt/dotnet/libexec

  neofetch
end

