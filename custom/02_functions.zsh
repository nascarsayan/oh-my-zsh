# Youtube-dl

ytv() {
	youtube-dl --config-location ~/.config/youtube-dl/video_playlist $1 ; rm -f yt_done.txt
}

yta() {
	youtube-dl --config-location ~/.config/youtube-dl/audio_playlist $1 ; rm -f yt_done.txt
}

# Git

ghubinit() {
	rm -rf .git/
	repoName=${PWD##*/};
	
	if [[ -z "$username" ]]; then
		ghubUser=$USER;
	else
		ghubUser=$username;
	fi
	if [ $# -gt 0 ]; then
		repoName=$1
	fi
	if [ $# -gt 1 ]; then
		ghubUser=$2
	fi
	git init ;
	x="curl -s -u \"${ghubUser}:${password}\" https://api.github.com/user/repos -d '{\"name\": \"${repoName}\"}' > /dev/null";
	eval $x;
	git remote add origin "git@github.com:$ghubUser/$repoName.git";
}

glabinit() {
	rm -rf .git/
	repoName=${PWD##*/};
	namespace="1658196"
	nspath="nascarsayan"
	if [ $# -gt 0 ]; then
		if [ $1 = "hindpos" ]; then
			namespace="1658191"
			nspath="hindpos"
		fi
		if [ $1 = "os" ]; then
			namespace="2384770"
			nspath="os-lab"
		fi
		if [ $1 = "networks" ]; then
			namespace="2428476"
			nspath="kgp2018neworks"
		fi
	fi
	if [ $# -gt 1 ]; then
		repoName=$2
	fi
	git init ;
	x="curl -X POST -H \"PRIVATE-TOKEN: ${glabPrivateToken}\" -H \"Content-Type:application/json\" \"https://gitlab.com/api/v4/projects/\" -d '{\"name\": \"${repoName}\", \"namespace_id\": ${namespace}}'| python -m json.tool";
	eval $x;
	git remote add origin "git@gitlab.com:$nspath/$repoName.git";
}
gitpush() {
	git add --all;
	git commit -a -m "${1}";
	git push origin $(git_current_branch);
}
glabcheck() {
	rm -rf .git/
	repoName=${PWD##*/};
	namespace="1658196"
	nspath="nascarsayan"
	if [ $# -gt 0 ]; then
		if [ $1 = "hindpos" ]; then
			namespace="1658191"
			nspath="hindpos"
		fi
		if [ $1 = "os" ]; then
			namespace="2384770"
			nspath="os-lab"
		fi
		if [ $1 = "networks" ]; then
			namespace="2428476"
			nspath="kgp2018neworks"
		fi
	fi
	if [ $# -gt 1 ]; then
		repoName=$2
	fi
	#git init ;
	x="curl -X POST -H \"PRIVATE-TOKEN: ${glabPrivateToken}\" -H \"Content-Type:application/json\" \"https://gitlab.com/api/v4/projects/\" -d '{\"name\": \"${repoName}\", \"namespace_id\": ${namespace}}'| python -m json.tool";
	echo $x;
	#git remote add origin "git@gitlab.com:$nspath/$repoName.git";
}
alias lc='colorls -lA --sd'
em() {
	emacsclient -c -q -nw -a '' "$@";
}
fem() {
    emacsclient -c -q -nw -a '' `fasd -f -a $1`;
}
saavn() {
	python3 ~/Softwares/user-packages/Saavn/Download.py
}
alias fe='f -e'
alias ae='a -e'
alias de='d -e'
alias acode='a -e code'