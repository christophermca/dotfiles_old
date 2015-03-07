# Load .profile, containing login, non-bash related initializations.
source ~/.profile

# Load .workrc, containing only work related bash config and initializations.
if [ -f "$HOME/.workrc" ]; then
   source ~/.workrc
fi

# Load .bashrc, containing non-login related bash initializations.
source ~/.bashrc
