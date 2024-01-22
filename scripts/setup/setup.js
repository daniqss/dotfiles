#!/usr/bin/bun
// import toml from 'toml'
// import { $ } from 'bun';

// const xrandrOutput = await $`xrandr`.text();
// const eDP = xrandrOutput.match(/eDP\d+/);
// const hdmi = xrandrOutput.match(/HDMI-A-0/);

// // const alacrittyConfig = toml

// if (hdmi) {
//     await $`xrandr --output HDMI-A-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal &`;
//     await $`setxkbmap -layout us &`;
// } else {
//     await $`xrandr --output ${eDP} --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-A-0 --off --output DP-1 --off &`;
//     await $`setxkbmap -layout es &`;
// }

// await $`feh --bg-scale ~/Wallpapers/RoW01.jpg & disown`;

import { $ } from 'bun';

const eDP = await $`xrandr | grep ' connected' | grep 'eDP' | awk '{print $1}'`.text()
const hdmi = await $`xrandr | grep ' connected' | grep 'HDMI' | awk '{print $1}'`.text()

console.log("====================================")
console.log(eDP)
console.log("====================================")
console.log(hdmi)


if (hdmi === "HDMI-A-0") {
    await $`xrandr --output ${eDP} --primary --mode 1920x1080 --pos 0x0 --rotate normal --output ${hdmi} --mode 1920x1080 --pos 1920x0 --rotate normal &`
    await $`setxkbmap -layout us &`
} else {
    await $`xrandr --output ${eDP} --primary --mode 1920x1080 --pos 0x0 --rotate normal &`
    await $`setxkbmap -layout es &`
}

await $`feh --bg-scale ~/Wallpapers/RoW01.jpg & disown`
