if status is-interactive
  alias vim "nvim"
  alias dotfiles "cd ~/dotfiles"

  alias pom "cd ~/documents/6semester/project_organization_management/"
  alias dsl "cd ~/documents/6semester/bachelor/DSLBeta1/"
  alias report "cd ~/documents/6semester/bachelor/bachelor/"

  alias sa "cd ~/documents/6semester/software_architecture/"

  set fish_greeting

  set -x TERMINAL xfce4-terminal
  set -x ANDROID_SDK_ROOT $HOME/Android/Sdk
  set -x PATH $PATH:$ANDROID_SDK_ROOT/emulator
  set -x PATH $PATH:$ANDROID_SDK_ROOT/platform-tools
  set -x ANDROID_HOME $HOME/Android/Sdk

  alias gitrm "git ls-files -i -c --exclude-from=.gitignore | xargs git rm --cached"

  set -xU LS_COLORS 'di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

  set -x EDITOR nvim

  alias screenshot "scrot -s /home/peter/screenshots/%y-%m-%d_%H:%M:%S.png"

  alias zathura "zathura --fork"

  alias fm "vifm $(pwd)"

  neofetch
end

