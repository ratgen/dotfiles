if status is-interactive
  alias vim "nvim"
  alias dotfiles "cd ~/dotfiles"

  alias sa "cd ~/documents/6semester/software_architecture/"

  set -x EDITOR nvim
  
  fish_add_path ~/.pyenv/bin
  fish_add_path /opt/nvim/
  fish_add_path /opt/jetbrains-toolbox-2.3.2.31487/
  fish_add_path /home/linuxbrew/.linuxbrew/bin

  set fish_greeting
  switch (uname) 
    case Linux
      set -x TERMINAL xfce4-terminal
      set -x ANDROID_HOME $HOME/Android/Sdk

      alias gitrm "git ls-files -i -c --exclude-from=.gitignore | xargs git rm --cached"

      set -xU LS_COLORS 'di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
      alias screenshot "scrot -s /home/peter/screenshot/%d-%m-%y_%H:%M:%S.png"
      alias screenshot_here "scrot -s (pwd)/%d-%m-%y_%H:%M:%S.png"

      alias zathura "zathura --fork"
      alias fm "vifm (pwd)"



    case Darwin
      fish_add_path /opt/homebrew/bin
      fish_add_path /opt/homebrew/opt/openjdk/bin
      fish_add_path /opt/homebrew/opt/openjdk@11/bin
      fish_add_path /opt/homebrew/opt/openjdk@17/bin
      fish_add_path /Applications/MongoDB.app/Contents/Resources/Vendor/mongodb/bin
      fish_add_path /Users/peter/Library/Android/sdk/platform-tools
      fish_add_path /Users/peter/.android/sdk/tools/bin
      set -x DOTNET_ROOT /opt/homebrew/opt/dotnet/libexec
      set -x ANDROID_HOME /Users/peter/Library/Android/sdk
      set -x ANDROID_SDK_ROOT /Users/peter/Library/Android/sdk
      set -x ANDROID_AVD_HOME /Users/peter/.android/avd

      fish_add_path /Users/peter/.pub-cache/bin

      alias python "python3"

    case '*'
      echo "Unknown OS"
  end

  bind -M insert \cf "tmux new -n sessionizer ~/dotfiles/tmux-sessionizer"

  alias sesh "tmux new -n sessionizer ~/dotfiles/tmux-sessionizer"

  set --universal nvm_default_version latest

  fish_vi_key_bindings

  # Emulates vim's cursor shape behavior
  # Set the normal and visual mode cursors to a block
  set fish_cursor_default block
  # Set the insert mode cursor to a line
  set fish_cursor_insert line
  # Set the replace mode cursor to an underscore
  set fish_cursor_replace_one underscore
  # The following variable can be used to configure cursor shape in
  # visual mode, but due to fish_cursor_default, is redundant here
  set fish_cursor_visual block


  neofetch
end

pyenv init - | source

# Created by `pipx` on 2024-01-19 17:39:55
set PATH $PATH /Users/peter/.local/bin
