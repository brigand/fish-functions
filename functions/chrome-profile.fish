function chrome-profile
	set -l dir ~/.chrome-profile/$argv[1]
	mkdir -p $dir
	env '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome' --user-data-dir=$dir
end
