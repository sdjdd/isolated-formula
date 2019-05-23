#!env zsh

typeset -A map

for formula (`brew list`) {
    map[$formula]=0
}

for deps (`brew deps --installed`) {
    for formula ($deps) {
        if [[ $formula[-1] != ':' ]] {
            ((map[$formula]++))
        }
    }
}

for formula count (${(kv)map}) {
    if (( $count == 0 )) {
        echo $formula
    }
}

exit 0
