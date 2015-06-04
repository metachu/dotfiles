# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme robbyrussell

# All built-in plugins can be found at ~/.oh-my-fish/plugins/
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Enable plugins by adding their name separated by a space to the line below.
set fish_plugins theme

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# requirements
# oh-my-fish
# curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish

# base-16 

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


set --export PYTHONPATH ~/projects/etl ~/projects/rtsi/rtsi ~/projects/ramis/
set --export ENVIRONMENT development

theme l
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
		sh .config/base16-shell/base16-monokai.dark.sh 
		echo local-devel 
	case ramis
		sh .config/base16-shell/base16-ocean.dark.sh 
		echo ramis
		ssh williamc@192.168.21.27 
	case default 
		sh .config/base16-shell/base16-monokai.dark.sh 
end


