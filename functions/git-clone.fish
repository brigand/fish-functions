function git-clone
	set -l user_repo (echo $argv[1] | sed -e 's/.*://' -e 's/\.git$//')
	set -l dest ~/github/$user_repo
	if test -d $dest
		cdp $dest
	else
		git clone git@github.com:$user_repo.git $dest
			and cdp $dest
	end
end
