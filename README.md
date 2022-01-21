# Setting Up A New Dev Environment

Install Python if not installed  
Install Git if not installed  
Install pip if not installed  
Install Node  
Windows: Install from the website, include all tools (adds Chocolately to use for the rest of the installs)  
Linux: the package managers are always outdated, use this:  
```
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs`
```

Install a NerdFont

Install powerline-shell
```
pip install powerline-shell
```

Create a new SSH key:
```
ssh-keygen -t rsa -b 4096
```

Show the public key:
```
less .ssh/id_rsa.pub
```

Copy it to GitHub

Use the script:
```
curl -Lks http://bit.do/tfcfg | /bin/bash
```

Install Neovim
```ubuntu
sudo apt-get install -y neovim fuse libfuse2 git python3-pip ack-grep
```

```win
choco install neovim
```

Install Plug
```ubuntu
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

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

Windows only: put the autoload files in the Windows autoload directory.
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
