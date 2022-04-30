if status is-interactive
  alias vim "nvim"

  alias dotfiles "cd ~/dotfiles"

  alias pom "cd ~/documents/6semester/project_organization_management/"
  alias dsl "cd ~/documents/6semester/bachelor/DSLBeta1/"
  alias report "cd ~/documents/6semester/bachelor/bachelor/"

  set fish_greeting

  set -xU LS_COLORS 'di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

  alias neofetch "neofetch --color_blocks off"
  alias gitrmignore "git ls-files -i -c --exclude-from=.gitignore | xargs git rm --cached"
  alias zathura "zathura --fork"

  neofetch
end

