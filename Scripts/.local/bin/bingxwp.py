import subprocess
import requests
import json
import os

# TODO use a config file for what programme to change the wallpaper the screen the folder where the wallpapers are saved
bwp = "/home/arrowx/Pictures/Bing/"


def main():
    # TODO Some sort of safty here
    r = requests.get(
        "https://bing.biturl.top/?resolution=1920&format=json&index=0&mkt=zh-CN"
    )

    image_url = json.loads(r.text)["url"]
    file_name = image_url.split("/")[-1]

    mkdir_string = "mkdir -p {path}"
    mkdir = mkdir_string.format(path=bwp)
    subprocess.run(mkdir, shell=True)

    if os.path.isfile(bwp + file_name):
        print("file already exist")
        change_wallpaper(bwp, file_name)

        return None

    r_url = requests.get(image_url, timeout=5)

    with open(bwp + file_name, "wb") as f:
        f.write(r_url.content)

    change_wallpaper(bwp, file_name)

    return None


def change_wallpaper(path, name):
    cmd_string = "nitrogen --set-auto --save {img}"
    command = cmd_string.format(img=path + name)
    subprocess.run(command, shell=True)


if __name__ == "__main__":
    main()