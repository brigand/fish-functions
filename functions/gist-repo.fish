function gist-repo
	if not test -n $GITHUB_GIST_OAUTH_TOKEN
		echo "GITHUB_GIST_OAUTH_TOKEN is required" >&2
		return 1
	end

	set -l file '.gitignore'
	echo 'open' >> '.gitignore'
	echo 'push' >> '.gitignore'
	echo 'copy' >> '.gitignore'
	echo '.gitignore' >> '.gitignore'

	function assert-n
		return 0
		if not test -n $argv[2]
			printf "Variable %s is empty" $argv[1] >&2
			return 1
		end
	end

	set -l url (gist $file < $file)
	assert-n url $url; or return 1
	set -l gist_id (echo $url | grep --only-matching '[a-zA-Z0-9]*$')
	set -l gist_remote (printf 'git@gist.github.com:/%s.git' $gist_id)
	assert-n gist_id $gist_id; or return 1
	assert-n gist_remote $gist_remote; or return 1

	echo "Created gist $gist_id" >&2

	function make-cmd
		echo '#!/bin/sh' > $argv[1]
		echo $argv[2] >> $argv[1]
		chmod +x $argv[1]
	end

	make-cmd open "open '$url'"
	make-cmd push "git push -u --force origin master"
	make-cmd copy "echo '$url' | pbcopy"

	if test -n $DEBUG
		echo "<DEBUG>" >&2
		for var in files url gist_id gist_remote
			printf "%s: %s\n" $var (printf $$var | jq --slurp -R '.') >&2
		end
		echo "</DEBUG>" >&2
	end

	set remote_opts remote add -f -t master -m master origin $gist_remote

	# the command errors if not a git repo or 0 commits
	test -d .git; or git init

	set -l untracked (git ls-files --others --exclude-standard)
	for f in $untracked
		break	
		set -l answer
		read answer -p (printf "Add %s? Y/n: " $f)
		#		if test $answer = 'y'; or test 
	end


	if git rev-list HEAD --count >/dev/null 2>&1
		git $remote_opts
		./push
	else
		git $remote_opts
	end
end
