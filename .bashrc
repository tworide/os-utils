#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# NOTE: copy this into your $HOME/.bashrc

# Verdione Settings
#
function verdione_env()
{
    if [ $# -eq 0 ]; then
        BASE=${HOME}
    else
        BASE=$1
    fi
    # Basler Camera (Pylon API) Configuration
    export LD_LIBRARY_PATH=${BASE}/lib:/opt/pylon/lib:/opt/pylon/lib64:/opt/pylon/genicam/bin/Linux64_x64:${LD_LIBRARY_PATH}
    export PATH=${BASE}/bin:$HOME/bin:${PATH}:/opt/pylon/bin
    export PKG_CONFIG_PATH=${BASE}/lib/pkgconfig
    export PYLON_ROOT=/opt/pylon

    # required for Pylon SDK 2.1
    export GENICAM_ROOT_V1_1=/opt/pylon
    export GENICAM_CACHE=/tmp

    # required for Pylon SDK 2.3
    export GENICAM_ROOT_V2_1=/opt/pylon/genicam
    export GENICAM_CACHE_V2_1=/tmp
}


alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

echo "Setting Verdione Environment"
verdione_env
