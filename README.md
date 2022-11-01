# Setting Up A New Dev Environment

## Languages & Runtimes

- Install Git if not installed- 

**Note:**For Windows, install from the website, include all tools (adds Chocolately to use for the rest of the installs)  
- macOS: Install Homebrew from the website
- Linux & macOS: Install asdf:
```sh

# MacOS
brew install asdf

# Linux
apt install curl git
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch <latest>
echo ". $HOME/.asdf/asdf.sh" > .bashrc
echo ". $HOME/.asdf/completions/asdf.bash" > .bashrc
```
- Use asdf to install specific needed languages to precisely control their versions based on project needs
- Install a NerdFont

- Install powerline-shell
```
git clone https://github.com/b-ryan/powerline-shell
cd powerline-shell
python setup.py install
```

- Create a new SSH key:
```
ssh-keygen -t rsa -b 4096
```
- Copy the public key to Github

- Use the script:
```
curl -Lks http://bit.do/tfcfg | /bin/bash
```

- Install Neovim
```ubuntu
sudo apt-get install -y neovim fuse libfuse2 git python3-pip ack-grep
```

```win
choco install neovim
```

```macoOS
brew install neovim
```

Install Plug
- Linux and macOS:
```ubuntu
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
- Powershell script for Windows:
```win (Powershell)
md ~\AppData\Local\nvim\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
  $uri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\AppData\Local\nvim\autoload\plug.vim"
  )
)
```
j

- Windows only: put the autoload files in the Windows autoload directory.
**Note:** Windows uses different autoload directories which is just terrible. In Windows it's `%UserProfile%/AppData/Local/nvim`, as you can see in the script above which just stuck `plug.vim` there. So, extra steps:

- Create a one-line `init.vim` in the autoload directory root with the following to have it point to the right one in the dotfiles repo, this way you don't need to maintain it in two places:
```
source $HOME/.config/nvim/init.vim
```

- Copy any colorscheme scripts into a `colors` directory out of the dotfile repo and Neovim will see them. 

Install the Silver Searcher
```ubuntu
apt-get install silversearcher-ag
```

```win
choco install ag
```

Run PlugInstall: 
```
nvim +PlugInstall
```
- This config is set up to install all the CoC extensions too so add them in the options of the plug command in init.vim
- You might need to close and reopen 

For Windows Subsystem For Linux & MacOS, changing npm's default directory:

```
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
```

The following should be in the `.profile` file in the dotfiles repo:
```
 export PATH=~/.npm-global/bin:$PATH
