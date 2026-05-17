# 🔧 Initialize completion system
autoload -Uz compinit && compinit

# 📜 History
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE

# 👾 For shell tools like Claude
export PATH="$HOME/.local/bin:$PATH"

# 🪄 Pixi
export PATH="$HOME/.pixi/bin:$PATH"
eval "$(pixi completion --shell zsh)"

# 🎩 Zsh Plugin Manager
eval "$(sheldon source)"

# 🎨 ColorTheme (shared with nvim)
base16_gruvbox-dark-hard

# 🌀 zoxide
eval "$(zoxide init zsh)"

# 📁 root directory for ghq ($GHQ_ROOT/github.com/$owner/$repo)
export GHQ_ROOT="$HOME/ghq"
# 🌳 gwq
source <(gwq completion zsh)

# 📝 editor
export EDITOR="nvim"
alias vi="nvim"

# 🐱 cat
alias cat="bat -pp"

# 📝 eza 
alias ls="lsd"
alias ll="lsd -l"

# 💬 discord webhook
export WEBHOOK_URL= 
