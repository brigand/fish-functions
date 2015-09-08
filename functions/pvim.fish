function pvim
	if test (count $argv) -eq 0
		pbpaste > /tmp/pvim
	else
		eval $argv > /tmp/pvim
	end
	vim /tmp/pvim

	read -p "echo 'Copy to clipboard? (yN) '" x
	if test "$x" = y
		pbcopy < /tmp/pvim
	end
end
