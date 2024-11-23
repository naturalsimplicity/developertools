#!/bin/bash

OBJ=$(</dev/stdin)
echo $OBJ | jq -r '
	[.[] |
	select((.committer.email == .author.email) or (.committer.email == "noreply@github.com")) |
	select((.message | test("Merge pull request #[0-9]+.*")) | not)] |
	[group_by(.author.email)[] |
	{
		author: {
			email: .[0].author.email,
			url: .[0].author.user.url
		},
		totalDiff: [.[].additions, .[].deletions] | add,
		commits: [.[] | {
			message: .message,
                        sha: .oid,
                        date: .committedDate,
                        url: .commitUrl,
                        changedFiles: .changedFiles,
                        additions: .additions,
                        deletions: .deletions	
		}] | sort_by(.date) | reverse
	}] | sort_by(.author.email) | reverse | sort_by(.totalDiff) | reverse
'	

