#!env zsh

declare -A map

for formula in `brew list`; do
    map[$formula]=0
done

for deps in `brew deps --installed`; do
    for formula in $deps; do
        if [ $formula[-1] != ':' ]; then
            ((map[$formula]++))
        fi
    done
done

for formula in `brew list`; do
    if [ $map[$formula] -eq 0 ]; then
        echo $formula
    fi
done

exit 0
