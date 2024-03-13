current_layout=$(hyprctl devices | grep "active keymap: Spanish" | awk '{print $3}')

echo "Current layout: $current_layout"

if [ "$current_layout" = "us" ]; then
    hyprctl keyword input:kb_layout es
else
    hyprctl keyword input:kb_layout us
fi
