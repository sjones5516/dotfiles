#!/usr/bin/env bash
# i3bar-protocol status line styled after Fedora's waybar layout, recoloured with the Lamplit Monastery palette.

block() { # text bg fg
    printf '{"full_text":"  %s  ","background":"%s","color":"%s","separator":false,"separator_block_width":4},' "$1" "$2" "$3"
}

read -r _ u n s i w x y z _ < /proc/stat
prev_total=$((u+n+s+i+w+x+y+z)); prev_idle=$((i+w))

trap : USR1  # "pkill -USR1 -f '^bash .*/scroll/status\.sh$'" forces an immediate refresh
printf '{"version":1}\n[\n[],\n'
while :; do
    out="["

    # Volume
    vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null)
    if [[ $vol == *MUTED* ]]; then
        out+=$(block $'\U000f075f muted' "#383534" "#757f76")
    elif [[ -n $vol ]]; then
        pct=$(awk '{printf "%d", $2*100}' <<< "$vol")
        out+=$(block "$pct% "$'' "#383534" "#cbc49c")
    fi

    # Network
    conn=$(nmcli -t -f TYPE,STATE,CONNECTION device 2>/dev/null | awk -F: '$2=="connected"{print $1":"$3; exit}')
    case $conn in
        wifi:*)     out+=$(block "${conn#wifi:} "$'' "#3d3a37" "#cbc49c") ;;
        ethernet:*) out+=$(block "${conn#ethernet:} "$'\U000f0200' "#3d3a37" "#cbc49c") ;;
        *)          out+=$(block $'Disconnected ⚠' "#b07a6e" "#252626") ;;
    esac

    # CPU
    read -r _ u n s i w x y z _ < /proc/stat
    total=$((u+n+s+i+w+x+y+z)); idle=$((i+w))
    dt=$((total-prev_total)); cpu=$(( dt > 0 ? 100*(dt-(idle-prev_idle))/dt : 0 ))
    prev_total=$total; prev_idle=$idle
    out+=$(block "$cpu% "$'' "#45403d" "#dad0a5")

    # Memory
    mem=$(awk '/MemTotal/{t=$2} /MemAvailable/{a=$2} END{printf "%d", (t-a)*100/t}' /proc/meminfo)
    out+=$(block "$mem% "$'\U000f035b' "#504c47" "#dad0a5")

    # Temperature
    if [[ -r /sys/class/thermal/thermal_zone0/temp ]]; then
        t=$(( $(< /sys/class/thermal/thermal_zone0/temp) / 1000 ))
        (( t >= 80 )) && { bg="#b07a6e"; fg="#252626"; } || { bg="#60605b"; fg="#dad0a5"; }
        out+=$(block "$t°C "$'' "$bg" "$fg")
    fi

    # Backlight
    bl=/sys/class/backlight/intel_backlight
    if [[ -r $bl/brightness ]]; then
        out+=$(block "$(( 100 * $(< $bl/brightness) / $(< $bl/max_brightness) ))% "$'' "#8fa89e" "#252626")
    fi

    # Battery
    bat=/sys/class/power_supply/BAT0
    if [[ -r $bat/capacity ]]; then
        cap=$(< $bat/capacity); st=$(< $bat/status)
        icons=($'' $'' $'' $'' $'')
        icon=${icons[$(( cap >= 100 ? 4 : cap / 20 ))]}
        if [[ $st == Charging || $st == Full ]]; then
            out+=$(block "$cap% "$'' "#cbc49c" "#252626")
        elif (( cap <= 15 )); then
            out+=$(block "$cap% $icon" "#b07a6e" "#252626")
        else
            out+=$(block "$cap% $icon" "#9fa589" "#252626")
        fi
    fi

    # Clock
    out+=$(block "$(date +'%a %b %d  %H:%M')" "#383534" "#cbc49c")

    printf '%s],\n' "${out%,}"
    sleep 2 & wait $!; kill $! 2>/dev/null
done
