_backup () {
        local cur opts

        opts="cleanup full incr incremental verify restore -h --help what"
        cur="${COMP_WORDS[COMP_CWORD]}"
        COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )

        return 0
}
complete -F _backup backup.sh
