from qutebrowser.api import interceptor

config.load_autoconfig()
config.bind(
    '<Ctrl+/>', 'hint links spawn --detach mpv --profile=720pmp4 {hint-url}')
config.bind('<Ctrl+g>', 'hint links spawn --detach gallery-dl {hint-url}')
config.bind('<Ctrl+p>', 'hint links spawn --detach mpv {hint-url}')


# Aliases for commands. The keys of the given dictionary are the
# aliases, while the values are the commands they map to.
# Type: Dict
c.aliases = {'w': 'session-save', 'q': 'close',
             'qa': 'quit', 'wq': 'quit --save', 'wqa': 'quit --save'}

# Page(s) to open at the start.
# Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = ['http://searxng.nicfab.eu/']


i = interceptor


def zooming(info: i.Request):
    if (info.resource_type != i.ResourceType.main_frame or
            info.request_url.scheme() in {"data", "blob"}):
        return
    url = info.request_url
    if url.host() == 'archiveofourown.org':
        config.set('zoom.default', '140%')
        # c.zoom.default = '140%'

    else:
        config.set('zoom.default', '115%')
        # c.zoom.default = '115%'

i.register(zooming)

config.source('adblock.py')
config.source('redirects.py')
