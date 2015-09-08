function git-recent
	git log --format="%H %P" | xargs -L 1 git diff
end
