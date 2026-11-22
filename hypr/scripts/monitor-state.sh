#!/usr/bin/env bash

AC_PATH="/sys/class/power_supply/ACAD/online"
LAST_STATE=""

while true; do
  # Detect external monitor
  if hyprctl monitors | grep -q '^Monitor HDMI-A-1 '; then
    EXTERNAL=1
  else
    EXTERNAL=0
  fi

  # Detect AC power
  if [[ "$(cat "$AC_PATH" 2>/dev/null)" == "1" ]]; then
    ON_AC=1
  else
    ON_AC=0
  fi

  STATE="${EXTERNAL}:${ON_AC}"

  if [[ "$STATE" != "$LAST_STATE" ]]; then

    # Refresh rates
    if ((ON_AC)); then
      EDP_RATE=144
      HDMI_RATE=120
    else
      EDP_RATE=60
      HDMI_RATE=60
    fi

    if ((EXTERNAL)); then
      # External monitor connected
      hyprctl keyword monitor \
        "HDMI-A-1,1920x1080@${HDMI_RATE},0x0,1"

      hyprctl keyword monitor \
        "eDP-1,1920x1080@${EDP_RATE},0x-900,1.2"
    else
      # Laptop only
      hyprctl keyword monitor \
        "eDP-1,1920x1080@${EDP_RATE},0x0,1"
    fi

    LAST_STATE="$STATE"
  fi

  sleep 2
done
