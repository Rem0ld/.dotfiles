# Dotfiles

## Setup on a new Mac

### 1. Install Git

Git comes with Xcode Command Line Tools:

```bash
xcode-select --install
```

### 2. Configure Git

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

Generate an SSH key and add it to your GitHub account:

```bash
ssh-keygen -t ed25519 -C "your@email.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
```

Copy the output and add it at https://github.com/settings/keys.

### 3. Clone the dotfiles repo

```bash
git clone git@github.com:<your-username>/dotfiles.git ~/.dotfiles
```

### 4. Run the install script

Full setup (Homebrew + Brewfile packages + symlinks):

```bash
cd ~/.dotfiles
chmod +x make_env.sh
./make_env.sh mac install
```

This will:

- Install Homebrew if not already installed
- Install all packages, casks, and VS Code extensions from `Brewfile`
- Optionally install packages from `Brewfile_personal`
- Symlink all config files to the right locations

### Symlinks only (if packages are already installed)

```bash
./make_env.sh mac link
```

### Remove all symlinks

```bash
./make_env.sh mac clear
```

## Setup on Linux

```bash
git clone git@github.com:<your-username>/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
chmod +x make_env.sh
./make_env.sh linux install
```

Note: packages must be installed manually on Linux. The script only creates symlinks.

## Updating the Brewfile

To capture your current packages into the Brewfile:

```bash
brew bundle dump --file=~/.dotfiles/Brewfile --force --describe
```
