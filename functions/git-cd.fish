function git-cd
	set ME brigand
	set DIR ~/github

	bash -c 'set -e; test -p /dev/stdout'
	set -l tty $status

	if test (count $argv) -eq 0
		for user in (ls $DIR)
			echo $DIR/$user
			for repo in (ls $DIR/$user/)
				if test $tty -eq 1
					printf ' - ' >&2
				end
				echo $user/$repo
			end
			echo
		end
		return
	end

	set d $DIR/$argv[1]
	if not test -d $d
		set d $DIR/$ME/$argv[1]
	end

	cd $d
end
