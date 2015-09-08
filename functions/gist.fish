function gist
	
	set -l file $argv[1]
	set -l jq_gist_post -R --slurp '. as $input | {"files":{"'$file'":{"content":$input}}}'
	set -l curl_opts -X POST \
		'https://api.github.com/gists' \
		-d @- \
		-H 'Content-Type: application/json' \
		-H 'Accept: application/json,application/vnd.github+json'
	set -l jq_result -r '.html_url'

	if test -n $GITHUB_GIST_OAUTH_TOKEN
		set curl_opts $curl_opts -H "Authorization: token $GITHUB_GIST_OAUTH_TOKEN"
	end

	if test -n $DEBUG
		set curl_opts $curl_opts -v
	end

	# do stuff!
	jq $jq_gist_post | curl -sS $curl_opts | jq $jq_result > /tmp/gist_url
	cat /tmp/gist_url | pbcopy
	cat /tmp/gist_url
end
