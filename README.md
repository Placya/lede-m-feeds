# lede-m-feeds

A feeds for LEDE

## How to use this feed

First, Add a line to **feeds.conf.default** in LEDE sources

`echo 'src-git ledem https://github.com/Placya/lede-m-feeds.git' >> feeds.conf.default`

Second, update & install packages

`./scripts/feeds update -a`

`./scripts/feeds install -a`


