function cawk
	awk '\
function red(s) { printf "\033[1;31m" s "\033[0m "}
function green(s) {    printf "\033[1;32m" s "\033[0m "}
function blue(s) {    printf "\033[1;34m" s "\033[0m "}
'"$argv"
end
