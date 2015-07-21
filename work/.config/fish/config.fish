# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Custom plugins and themes may be added to ~/.oh-my-fish/custom
# Plugins and themes can be found at https://github.com/oh-my-fish/
Theme 'robbyrussell'
Plugin 'theme'

function fuck -d 'Correct your previous console command'
    set -l exit_code $status
    set -l eval_script (mktemp 2>/dev/null ; or mktemp -t 'thefuck')
    set -l fucked_up_command $history[1]
    thefuck $fucked_up_command > $eval_script
    . $eval_script
    rm $eval_script
    if test $exit_code -ne 0
        history --delete $fucked_up_command
    end
end


#set --export PYTHONPATH ~/projects/api/etl ~/projects/api/realtime ~/projects/ramis/
set --export GOPATH ~/go
set --export PYTHONPATH ~/vm/api/etl ~/vm/api/realtime ~/projects/ramis/ ~/projects/playground/
set --export ENVIRONMENT development
set --export PATH $PATH ~/go/bin

#doge --season xmas
sh .config/base16-shell/base16-monokai.dark.sh 
switch $theme
	case test-server
		sh .config/base16-shell/base16-monokai.dark.sh 
		ssh root@192.168.21.182
		echo test
	case api 
		sh .config/base16-shell/base16-monokai.dark.sh 
		echo production api
		ssh root@192.168.21.181
	case local-devel 
		sh .co
		echo local-devel 
    cd ~/vm; and vagrant ssh
	case ramis
		sh .config/base16-shell/base16-ocean.dark.sh 
		echo ramis
		ssh williamc@192.168.21.27 
	case default 
		sh .config/base16-shell/base16-monokai.dark.sh 
end




#fish settings
set -x INFORMIXDIR /opt/IBM/informix
set -x INFORMIXSERVER prodtcpip

set -x EDITOR vim


#aliases
alias lsa="ls -lsa"
alias lsr="ls -lsatr"
alias gs="git status"
alias gp="git push"
alias gc="git commit "
alias ga="git add ."

#aliaswindows
function ramcheck
	echo "checking the ram of 192.168.21."$argv[1]
    wmic -U BRANDBANK/ITSUPPORT%Kilda_15 //192.168.21.$argv[1] "Select UserName from win32_computersystem"
    wmic -U BRANDBANK/ITSUPPORT%Kilda_15 //192.168.21.$argv[1] "Select FreePhysicalMemory,TotalVisibleMemorySize from win32_operatingsystem"
end

