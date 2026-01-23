```

                                                   88         88
                                                   88         ""    ,d
                                                   88               88
8b,dPPYba,   ,adPPYYba,  8b,dPPYba,    ,adPPYba,   88   ,d8   88  MM88MMM
88P'   `"8a  ""     `Y8  88P'   `"8a  a8"     "8a  88 ,a8"    88    88
88       88  ,adPPPPP88  88       88  8b       d8  8888[      88    88
88       88  88,    ,88  88       88  "8a,   ,a8"  88`"Yba,   88    88,
88       88  `"8bbdP"Y8  88       88   `"YbbdP"'   88   `Y8a  88    "Y888


```

# 🛠️ nanokit - minimal development environment
[![Platform](https://img.shields.io/badge/platform-linux--64%20%7C%20linux--aarch64%20%7C%20osx--64-blue)](https://github.com/prefix-dev/pixi)
[![Powered by Pixi](https://img.shields.io/badge/powered%20by-pixi-yellow)](https://pixi.sh)
[![License: MIT](https://img.shields.io/badge/License-MIT-red.svg)](https://opensource.org/licenses/MIT)

- ⚡ A lightweight, fast, and efficient **cross-platform** development setup for Linux (x86/arm), OSX  
- ✨ **No sudo required** - Everything installs to `$HOME/.pixi`, completely user-local  
- 🪄 **Pixi** as a [shell tool manager](https://prefix.dev/blog/using-pixi-as-a-system-package-manager-with-shortcuts-and-completions) - Keep your tools up-to-date by declarative management
- 🦀 **dotter** as a simple [dotfile manager](.dotter/global.toml) that links / unlinks dotfiles in nanokit
- 🐚 **zsh** 🎩 [**sheldon**](https://sheldon.cli.rs/) 🚀 [**starship**](https://starship.rs/) - Modern shell experience with plugin management

<img src="https://github.com/user-attachments/assets/cb9c1905-577d-4db2-ab4c-1bfa9efce720" width="400"><img src="https://github.com/user-attachments/assets/56fb4d2e-7a40-4be2-8a97-99cdb1308b28" width="400">

## ⚙️ Setup - *All you need is pixi*

### Step 1: Install pixi

Install pixi following the [official installation guide](https://pixi.prefix.dev/dev/installation/):

```bash
curl -fsSL https://pixi.sh/install.sh | sh
```

If your system doesn't have `curl`, you can use `wget`:

```bash
wget -qO- https://pixi.sh/install.sh | sh
```

> [!WARNING]
> Now restart your terminal or shell to make the installation effective.

### Step 2: Clone this repository

Install GitHub CLI (recommended) or git:
```bash
pixi global install gh
# or
pixi global install git
```

**Using 🔀 git:**
```bash
git clone https://github.com/denkiwakame/nanokit.git
cd nanokit
```

**Using :octocat: gh** (recommended - includes SSH key setup):
```bash
gh auth login

# Where do you use GitHub? → GitHub.com
# What is your preferred protocol? → SSH
# Generate a new SSH key? → Yes
# How would you like to authenticate? → Login with a web browser
```

```bash
gh repo clone denkiwakame/nanokit
cd nanokit
```

**Using 🔀 git:**
```bash
git clone https://github.com/denkiwakame/nanokit.git
cd nanokit
```

### Step 3-a: nanokit install (recommended for new environment)

```bash
./nanokit install
```

*That's all you need to get started!*

> [!CAUTION]
> nanokit configures `zsh` as the default shell for the terminal emulator (e.g. tmux) and use it only for interactive sessions.
> We recommend using a system-managed shell such as `/usr/bin/zsh` (or `/bin/bash`)
> as the login shell.
>
> Pixi installs `zsh` in a user-space environment and locks it together with its runtime
> dependencies (e.g. `ncurses`, `libgcc`; see `pixi global tree --environment zsh`).
>
> If this environment fails, using it as a login shell can prevent system login
> (e.g. via SSH or WSL).
> https://tim.siosm.fr/blog/2023/12/22/dont-change-defaut-login-shell/

### Step 3-b: Manual Installation (recommended for existing environment)

<details>
<summary>If you prefer more control over the installation process or are setting up on an existing machine with custom configurations</summary>

#### Install dotter

```bash
pixi global install dotter-rs
```

#### Symlink configuration files

Check what will be symlinked (dry run):

```bash
dotter -d       # dry run: confirm what happens
```

Deploy the symlinks:

```bash
dotter deploy
```

#### Install utility tools

Install all necessary tools defined in the [global configuration](pixi-global.toml):

```bash
pixi global sync
```
#### Start your 🐚 zsh

Launch zsh shell or tmux:

```bash
zsh
```

```bash
tmux
```

Everything is setup automatically via 🎩 sheldon.

#### 🔄 Reset All Environment

```sh
dotter undeploy -d
dotter undeploy
touch ~/.pixi/manifests/pixi-global.toml
pixi global sync
```

</details>

### Step 4: Install fonts required for 🚀 starship (optional)

For local terminals, installing fonts is recommended. Fonts will be installed to `$HOME/.local/fonts`.

| **🐧 Linux** | **🍎 Mac OS** | **🪟 Windows Terminal** |
|-----------|-----------|---------|
| `./setup_fonts.sh` | `brew tap homebrew/cask-fonts` <br> `brew install --cask font-hack-nerd-font` | `choco install nerd-fonts-hack`<br>*Note: Requires administrator privileges* |

See [Starship Presets](https://starship.rs/presets/) for more customization options.

## 🎨 Customization

### 🛠️ Global Tools

The following tools are available through [pixi-global.toml](pixi-global.toml):

|| Tool | Description | Exposed Command | GitHub |
|-|------|-------------|-----------------|---------|
| 🔀| **git** | Version control system | `git`, `git-cvsserver`, `git-receive-pack`, `git-shell`, `git-upload-archive`, `git-upload-pack`, `gitk`, `scalar` | [git/git](https://github.com/git/git) |
| :octocat: | **gh** | GitHub CLI | `gh` | [cli/cli](https://github.com/cli/cli) |
| 🔀 | **tig** | TUI client for Git | `tig` | [jonas/tig](https://github.com/jonas/tig) |
| 🐚 | **zsh** | Z shell | `zsh`, `zsh-5.9` | [zsh-users/zsh](https://github.com/zsh-users/zsh) |
| 🎩 | **sheldon** | Fast and configurable shell plugin manager | `sheldon` | [rossmacarthur/sheldon](https://github.com/rossmacarthur/sheldon) |
| 🚀 | **starship** | Minimal, beautifl prompt for any shell | `starship` | [starship/starship](https://github.com/starship/starship) |
| 🦀 | **dotter-rs** | Dotfile manager | `dotter` | [SuperCuber/dotter](https://github.com/SuperCuber/dotter) |
| 🔐 | **sshs** | TUI client for ssh | `sshs` | [quantumsheep/sshs](https://github.com/quantumsheep/sshs) |
| 📊 | **htop** | Interactive process viewer | `htop` | [htop-dev/htop](https://github.com/htop-dev/htop) |
| 📊 | **bottom** | System monitor | `btm` | [ClementTsang/bottom](https://github.com/ClementTsang/bottom) |
| 🔎 | **fzf** | Fuzzy finder | `fzf` | [junegunn/fzf](https://github.com/junegunn/fzf) |
| 📁 | **tree** | Directory tree display | `tree` | [Old-Man-Programmer/tree](https://github.com/Old-Man-Programmer/tree) |
| 📁 | **go-ghq** | Git repository manager | `ghq` | [x-motemen/ghq](https://github.com/x-motemen/ghq) |
| 🌀 | **zoxide** | Smart directory jumper | `zoxide` | [ajeetdsouza/zoxide](https://github.com/ajeetdsouza/zoxide) |
| 🛠️ | **make** | Build automation tool | `make` | [mirror/make](https://github.com/mirror/make) |
| 📋 | **xsel** | X11 clipboard manipulation | `xsel` | [kfish/xsel](https://github.com/kfish/xsel) |
| 🗄️ | **pueue** | Local job queue manager | `pueue`, `pueued` | [Nukesor/pueue](https://github.com/Nukesor/pueue) |
| 🪟 | **tmux** | Terminal multiplexer | `tmux` | [tmux/tmux](https://github.com/tmux/tmux) |
| 💽 | **dua-cli** | Disk usage analyzer | `dua` | [Byron/dua-cli](https://github.com/Byron/dua-cli) |
| 💽 | **diskonaut** | Disk space navigator | `diskonaut` | [imsnif/diskonaut](https://github.com/imsnif/diskonaut) |
| 🦇 | **bat** | Better cat with syntax highlighting | `bat` | [sharkdp/bat](https://github.com/sharkdp/bat) |
| 📂 | **lsdeluxe** | Modern ls replacement | `lsd` | [lsd-rs/lsd](https://github.com/lsd-rs/lsd) |
| ⚙️ | **nodejs** | Node.js runtime | `node`, `npm`, `npx` | [nodejs/node](https://github.com/nodejs/node) |
| ⚙️ | **jq** | Command-line JSON processor | `jq` | [jqlang/jq](https://github.com/jqlang/jq) |
| 🌍 | **xh** | Friendly and fast tool for sending HTTP requests | `xh` | [ducaale/xh](https://github.com/ducaale/xh) |
| ☁️ | **rclone** | rsync for cloud storage | `rclone` | [rclone/rclone](https://github.com/rclone/rclone) |
| ☁️ | **aws** | CLI for AWS | `aws` `aws_completer` | [aws/aws-cli](https://github.com/aws/aws-cli) |
| 📝 | **neovim** | Neovim with Node.js, Lua, Python support | `nvim` | [neovim/neovim](https://github.com/neovim/neovim) |
| 📝 | **helix** | A post-modern modal text editor | `hx` | [helix-editor/helix](https://github.com/helix-editor/helix) |

Add your favorite tools with:
```bash
pixi search <package-name>
pixi global install <package-name>  # e.g. pixi global install python=3.13
```
This will automatically update the [pixi-global.toml](pixi-global.toml) configuration.

```bash
pixi global update
```
automatically upgrade all tools **except for version-pinned packages**.

<img width="200" alt="image" src="https://github.com/user-attachments/assets/afa04a78-f626-4b34-80c8-503e7bc0aad1" />

see [Pixi Global: Declarative Tool Installation](https://prefix.dev/blog/pixi_global) for details.

### 🚀 Starship Settings

Customize your prompt by editing [starship.toml](starship.toml). See [Starship Themes](https://starship.rs/presets/).

For detailed configuration options, see the [Starship documentation](https://starship.rs/).

### 🎩 Zsh Plugins

Manage plugins by editing [zshrc](zshrc) and [sheldon.toml](sheldon.toml).

For more plugin management options, see the [Sheldon documentation](https://sheldon.cli.rs/).

### 🦀 Dotfiles Management

Manage symlinks for dotfiles by editing [.dotter/global.toml](./dotter/global.toml).

For detailed configuration options, see the [dotter documentation](https://github.com/SuperCuber/dotter/wiki).

### 🚀 ghq + zoxide = ❤️

The combination of [ghq](https://github.com/x-motemen/ghq) and [zoxide](https://github.com/ajeetdsouza/zoxide) creates a magical workflow for repository management:

#### 📦 Repository Management with ghq

[ghq](https://github.com/x-motemen/ghq) provides a clean way to organize remote repository clones. When you run:

```bash
ghq get {repo-url}
```

It automatically clones the repository to a well-structured directory hierarchy under `~/ghq`, regardless of your current location. For example:

```bash
ghq get https://github.com/user/project
# Creates: ~/ghq/github.com/user/project
```

#### 🧭 Smart Navigation with zoxide

Once you `cd` into any directory, [zoxide](https://github.com/ajeetdsouza/zoxide) remembers that location. You can then use:

```bash
zi  # Interactive fuzzy finder for visited directories
z <partial-name>  # Jump to directory matching the pattern
```

No more `cd ../../../project` - just `zi` and you're there! 🎯

### 🖥️ Tmux Key Bindings

The tmux configuration uses `Ctrl+a` as the prefix key (instead of the default `Ctrl+b`). Here are the essential key bindings:

#### Basic Commands
| Key Binding | Description |
|-------------|-------------|
| `Ctrl+a` then `?` | Show help and all key bindings |
| `Ctrl+a` then `r` | Reload tmux configuration |

#### Window Management
| Key Binding | Description |
|-------------|-------------|
| `Ctrl+a` then `c` | Create new window (in current directory) |
| `Ctrl+a` then `w` | Choose window from list |
| `Ctrl+a` then `n` | Next window |
| `Ctrl+a` then `p` | Previous window |

#### Pane Management
| Key Binding | Description |
|-------------|-------------|
| `Ctrl+a` then `-` | Split window horizontally |
| `Ctrl+a` then `\|` | Split window vertically |
| `Ctrl+a` then `h` | Move to left pane |
| `Ctrl+a` then `j` | Move to bottom pane |
| `Ctrl+a` then `k` | Move to top pane |
| `Ctrl+a` then `l` | Move to right pane |

#### Copy Mode (Vi-style)
| Key Binding | Description |
|-------------|-------------|
| `Ctrl+a` then `[` | Enter copy mode |
| `v` | Start selection (in copy mode) |
| `y` | Copy selection (in copy mode) |
| `q` | Exit copy mode |

> **💡 Tip**: All panes and windows are created in the current working directory for better workflow.

### 📝 Neovim Settings (Optional)

Basic commands to get started:
- `vi` - Launch Neovim
- `:q` - Quit Neovim
- `:checkhealth` - Check Neovim configuration
- `:Lazy` - Plugin manager interface  
- `Ctrl+P` - Fuzzy file finder

## 🧪 Try nanokit in your OS

Want to test nanokit without affecting your current setup? Create a temporary user:

```bash
sudo adduser nanokit
su - nanokit
# Try nanokit setup here
```

**Cleanup test user:**
```bash
sudo userdel -r nanokit    # Remove user and home directory
```
