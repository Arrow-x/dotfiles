#!/bin/sh
draw() {
  ~/.config/lf/draw_img.sh "$@"
  exit 1
}

hash() {
  printf '%s/.cache/lf/%s' "$HOME" \
    "$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' -- "$(readlink -f "$1")" | sha256sum | awk '{print $1}')"
}

cache() {
  if [ -f "$1" ]; then
    draw "$@"
  fi
}

file="$1"
shift

if [ -n "$FIFO_UEBERZUG" ]; then
  # case "$(file -Lb --mime-type -- "$file")" in
  case "$(mimetype -b "$file")" in
    image/*)
      orientation="$(identify -format '%[EXIF:Orientation]\n' -- "$file")"
      if [ -n "$orientation" ] && [ "$orientation" != 1 ]; then
        cache="$(hash "$file").jpg"
        cache "$cache" "$@"
        convert -- "$file" -auto-orient "$cache"
        draw "$cache" "$@"
      else
        draw "$file" "$@"
      fi
      ;;
    video/*)
      cache="$(hash "$file").jpg"
      cache "$cache" "$@"
      ffmpegthumbnailer -i "$file" -o "$cache" -s 0
      draw "$cache" "$@"
      ;;
    audio/*)
      cache="$(hash "$file").jpg"
      cache "$cache" "$@"
      ffmpegthumbnailer -i "$file" -o "$cache" -s 0
      draw "$cache" "$@"
      ;;
    application/epub+zip)
      cache="$(hash "$file").jpg"
      cache "$cache" "$@"
      gnome-epub-thumbnailer "$file" "$cache"
      draw "$cache" "$@"
	    ;;
    application/pdf)
      cache="$(hash "$file").jpg"
      cache "$cache" "$@"
	    gs -o "$cache" -sDEVICE=pngalpha -dLastPage=1 "$file" >/dev/null
      draw "$cache" "$@"
	    ;;
    application/x-blender)
      cache="$(hash "$file").jpg"
      cache "$cache" "$@"
      blender-thumbnailer "$file" "$cache"
      draw "$cache" "$@"
      ;;
    application/x-compressed-tar) tar tf "$file" ;;
    application/zip) unzip -l "$file" ;;
    application/vnd.rar) 7z l "$file" ;;
    application/x-7z-compressed) 7z l "$file" ;;
    text/markdown) glow "$file";;
    text/*) bat -n --color always --wrap never "$file" ;;
    application/x-shellscript) bat -n --color always --wrap never "$file" ;;
    application/json) bat -n --color always --wrap never "$file" ;;
  esac
fi

file -Lb -- "$1" | fold -s -w "$width"
exit 0