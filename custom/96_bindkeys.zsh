function _musicAnime {
	vlc -Z ~/Entertainment/Music/Japanese/best_links
}
function _musicHindi {
	vlc -Z ~/Entertainment/Music/Hindi
}
zle -N _musicAnime
zle -N _musicHindi
bindkey "^ea" _musicAnime
bindkey "^eh" _musicHindi

