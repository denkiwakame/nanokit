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
- 🐑 [**herdr**](https://herdr.dev/) 🪟 **tmux** - Run your coding agents in persistent, reattachable terminal workspaces, with 🌲 **gwq** git worktrees to keep them out of each other's way

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

Launch zsh shell, herdr, or tmux:

```bash
zsh
```

```bash
herdr
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
| 🔀| **git-lfs** | Version control system | `git-lfs` | [git/git](https://github.com/git-lfs/git-lfs) |
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
| 🌲 | **gwq** | Git worktree manager | `gwq` | [d-kuro/gwq](https://github.com/d-kuro/gwq) |
| 🌀 | **zoxide** | Smart directory jumper | `zoxide` | [ajeetdsouza/zoxide](https://github.com/ajeetdsouza/zoxide) |
| 🛠️ | **make** | Build automation tool | `make` | [mirror/make](https://github.com/mirror/make) |
| 📋 | **xsel** | X11 clipboard manipulation | `xsel` | [kfish/xsel](https://github.com/kfish/xsel) |
| 🗄️ | **pueue** | Local job queue manager | `pueue`, `pueued` | [Nukesor/pueue](https://github.com/Nukesor/pueue) |
| 🪟 | **tmux** | Terminal multiplexer | `tmux` | [tmux/tmux](https://github.com/tmux/tmux) |
| 🐑 | **herdr** | Agent multiplexer - terminal workspace manager for AI coding agents | `herdr` | [ogulcancelik/herdr](https://github.com/ogulcancelik/herdr) |
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

### 🚀 ghq + 🌲 gwq + 🌀 zoxide = ❤️

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

#### 🌀 Smart Navigation with zoxide

Once you `cd` into any directory, [zoxide](https://github.com/ajeetdsouza/zoxide) remembers that location. You can then use:

```bash
zi  # Interactive fuzzy finder for visited directories
z <partial-name>  # Jump to directory matching the pattern
```

No more `cd ../../../project` - just `zi` and you're there! 🎯

#### 🌲 Worktree Management with gwq

[gwq](https://github.com/d-kuro/gwq) is to **branches** what `ghq` is to **repositories** — a structured, ghq-style manager for `git worktree`. Instead of juggling `git worktree add ../some-path` by hand, gwq lays worktrees out under `$GHQ_ROOT` using the naming template configured in [`gwq.toml`](gwq.toml):

```
$GHQ_ROOT/github.com/{owner}/{repo}.{branch}
```

Common commands:

```bash
gwq add <branch>     # create a worktree for <branch> (auto-cd into it)
gwq list             # list avaialable worktrees
gwq remove           # prune a worktree
```

With `auto_cd_on_add = true` (already set in [`gwq.toml`](gwq.toml)) and the shell integration sourced in [`zshrc`](zshrc) (`source <(gwq completion zsh)`), `gwq add` drops you straight inside the new worktree, 🌀 zoxide quietly memorizes the path along the way. So next time, just `zi` and you're back in the worktree you wanted. 🎯

### 🐑 herdr - Agent Multiplexer

[herdr](https://herdr.dev/) is tmux for **coding agents**. Each agent runs in its own real terminal on a persistent server, so closing the laptop (or dropping an SSH connection) doesn't kill the run — you just reattach later, from anywhere:

```bash
herdr                             # launch or attach to the persistent session
herdr --session <name>            # named session
herdr --remote <ssh-target>       # attach to herdr running on another box
herdr status                      # local client / running server status
```

The agent panel shows which agents are **blocked**, **working**, or **done** at a glance, so a fleet of agents stays legible from one screen. Paired with 🌲 gwq worktrees, each agent gets its own branch checkout and they never stomp on each other.

Configure it by editing [herdr.toml](herdr.toml) → `$HOME/.config/herdr/config.toml`, then:

```bash
herdr server reload-config        # apply config.toml to the running server
herdr config check                # validate config.toml
```

See the [herdr documentation](https://herdr.dev/docs) for the full action list.

#### 🐏 Plugins

herdr plugins are **not** dotfiles - they are installed through the CLI and registered in herdr's own user-global registry (`$HOME/.config/herdr/plugins.json`), which holds machine-local absolute paths and resolved commits. So they are deliberately left out of dotter, and installed by hand instead:

```bash
herdr plugin install <owner>/<repo>   # install from GitHub (add --ref <commit> to pin)
herdr plugin link <path>              # register a local plugin directory
herdr plugin list                     # list installed plugins
herdr plugin config-dir <plugin-id>   # print a plugin's user config directory
```

[herdr.toml](herdr.toml) binds `Ctrl+a` then `i` to [Flock](https://github.com/ragamo/herdr-flock) 🐑, which draws your agents as pixel-art sheep on a top-down farm. The binding is dead until the plugin is installed:

```bash
herdr plugin install ragamo/herdr-flock
```

> [!NOTE]
> Flock builds from source with `cargo build --release`, so it needs a Rust toolchain on `PATH` - which nanokit does **not** manage. Install one with `pixi global install rust` (or [rustup](https://rustup.rs/)) first, or just drop the `[[keys.command]]` block from [herdr.toml](herdr.toml) if you don't want the farm.

See the [plugin documentation](https://herdr.dev/docs/plugins) for writing your own.

### ⌨️ Key Bindings - 🐑 herdr / 🪟 tmux

Both [herdr.toml](herdr.toml) and [tmux.conf](tmux.conf) use `Ctrl+a` as the prefix key (instead of tmux's default `Ctrl+b`) and **share the same bindings**, so your muscle memory carries over between the two.

#### Workspaces / Windows
| Key Binding | 🐑 herdr | 🪟 tmux |
|-------------|----------|---------|
| `Ctrl+a` then `c` | Create new workspace | Create new window (in current directory) |
| `Ctrl+a` then `n` | Next workspace | Next window |
| `Ctrl+a` then `p` | Previous workspace | Previous window |
| `Ctrl+a` then `t` | Create new 🌲 git worktree | - |
| `Ctrl+a` then `w` | - | Choose window from list |

#### Panes
| Key Binding | 🐑 herdr | 🪟 tmux |
|-------------|----------|---------|
| `Ctrl+a` then `\|` | Split vertically | Split window vertically |
| `Ctrl+a` then `-` | Split horizontally | Split window horizontally |
| `Ctrl+a` then `h` / `j` / `k` / `l` | - | Move to left / bottom / top / right pane |

#### Tabs (herdr only)
| Key Binding | Description |
|-------------|-------------|
| `Ctrl+a` then `Tab` | Create new tab |
| `Ctrl+Tab` | Next tab |
| `Ctrl+Shift+Tab` | Previous tab |

#### Misc
| Key Binding | 🐑 herdr | 🪟 tmux |
|-------------|----------|---------|
| `Ctrl+a` then `r` | Reload configuration | Reload `~/.tmux.conf` |
| `Ctrl+a` then `i` | Open Flock Farm (plugin action) | - |
| `Ctrl+a` then `?` | - | Show help and all key bindings |

#### Copy Mode (tmux, Vi-style)
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

## 🔐 Supply Chain Security

nanokit ships supply chain hardening configs for `npm` and `uv`, managed by dotter.

| Tool | Config file | Setting | Effect |
|------|-------------|---------|--------|
| npm | [`npmrc`](npmrc) → `$HOME/.npmrc` | `registry=https://npm.flatt.tech` | 🛡️ blocks known-malicious packages |
| uv | [`uv.toml`](uv.toml) → `$HOME/.config/uv/uv.toml` | `exclude-newer = "7 days"` | ⏳ skips packages published in the last 7 days |

### 🛡️ npm: Takumi Guard by GMO Flatt Security

[Takumi Guard](https://shisho.dev/docs/t/guard/quickstart/npm/) is a read-only npm registry proxy that rejects known-malicious packages (malware, typosquats, compromised releases) before the tarball is downloaded. One line in [`npmrc`](npmrc), no account required — works with `npm` / `pnpm` / `yarn` and needs no lockfile migration.

> [!NOTE]
> The proxy is read-only — publish with `npm publish --registry=https://registry.npmjs.org/`.

See the [quickstart](https://shisho.dev/docs/t/guard/quickstart/npm/) for optional tokens (breach notifications) and yarn berry setup.

### ⏳ uv: Release-Age Cooldown

A 7-day cooldown blocks most real-world supply chain incidents, since compromised packages are typically caught and pulled within hours or days. See [Package Managers Need to Cool Down](https://simonwillison.net/2026/mar/24/package-managers-need-to-cool-down/) and [Dependency Cooldowns](https://cooldowns.dev/). npm supports the same via `min-release-age=7` (`npm v11.10.0+`) if you want both defenses.

### ⚠️ Pixi

Pixi's `exclude-newer` is currently [**workspace-only**](https://github.com/prefix-dev/pixi/issues/5810) — it is not available in user-level `~/.pixi/config.toml` ([config reference](https://pixi.prefix.dev/latest/reference/pixi_configuration/)). Add it manually to each project's `pixi.toml` | `pyproject.toml`:

```toml
[workspace]
exclude-newer = "7d"  # requires pixi v0.67.0+
```

This applies to both conda and PyPI packages within that workspace. For `pixi global` (i.e. [`pixi-global.toml`](pixi-global.toml)), cooldown is not yet supported upstream.

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
