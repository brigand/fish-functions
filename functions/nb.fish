function ns
	set -l cmd $argv[1]
	set -l rest
	if test (count $argv) -gt 1
		set rest $argv[2..(count $argv)]
	end
	eval ./node_modules/.bin/$cmd $rest
end
