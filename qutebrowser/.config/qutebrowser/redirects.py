from qutebrowser.api import interceptor
from urllib.parse import urljoin
from PyQt6.QtCore import QUrl
import operator

o = operator.methodcaller
s = 'setHost'
i = interceptor


def farside(url: QUrl, i) -> bool:
    url.setHost('farside.link')
    p = url.path().strip('/')
    url.setPath(urljoin(i, p))
    return True


def nitter(url: QUrl) -> bool:
    return farside(url, '/nitter/')


def rimgo(url: QUrl) -> bool:
    return farside(url, '/rimgo/')


def scribe(url: QUrl) -> bool:
    return farside(url, '/scribe/')


def invid(url: QUrl) -> bool:
    return farside(url, '/invidious/')


def reddit(url: QUrl) -> bool:
    return farside(url, '/libreddit/')


def bibliogram(url: QUrl) -> bool:
    return farside(url, '/bibliogram/')


def simplytranslate(url: QUrl) -> bool:
    return farside(url, '/simplytranslate/')


def proxitok(url: QUrl) -> bool:
    return farside(url, '/proxitok/')


def querte(url: QUrl) -> bool:
    return farside(url, '/querte/')


map = {
    "reddit.com": reddit,
    "www.reddit.com": reddit,
    "old.reddit.com": reddit,

    "youtu.be": invid,
    "youtube.com": invid,
    "www.youtube.com": invid,

    # "twitter.com": nitter,
    # "www.twitter.com": nitter,
    # "mobile.twitter.com": nitter,

    "imgur.com": rimgo,
    "medium.com": scribe,
    "www.instagram.com": bibliogram,
    "translate.google.com": simplytranslate,
    "vm.tiktok.com": proxitok,
    "www.tiktok.com": proxitok,
    "www.quora.com": querte,

    "www.twitch.tv": o(s, 'm.twitch.tv'),
    "discord.com": o(s, 'canary.discord.com'),
    "tumblr.com": o(s, 'splashblr.fly.dev'),
    "www.npr.org": o(s, 'text.npr.org'),

    "www.goodreads.com": o(s, 'bl.vern.cc'),
    "genius.com": o(s, 'db.vern.cc'),
    "stackoverflow.com": o(s, 'code.whatever.social'),
}


def f(info: i.Request):
    if (info.resource_type != i.ResourceType.main_frame or
            info.request_url.scheme() in {"data", "blob"}):
        return
    url = info.request_url
    redir = map.get(url.host())
    if redir is not None and redir(url) is not False:
        info.redirect(url)


i.register(f)
