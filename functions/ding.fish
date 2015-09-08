function ding
	set -l n 1
	if test (count $argv) -eq 1
		set n $argv[1]
	end
	for i in (seq 1 $n)
		printf '\a'
		sleep 0.5
	end
end
