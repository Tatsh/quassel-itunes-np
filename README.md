# iTunes script for Quassel

Reads your currently playing media from iTunes using the new JXA interface (`osascript -l JavaScript`).

## Installation

You must have [Quassel client](https://quassel-irc.org/downloads) installed and [`coffeescript`](http://coffeescript.org/) in `PATH`.

1. Clone this repository.
2. Run `install.sh`.
3. Add a custom alias to Quassel Client (Preferences) named whatever you like such as *np*. This is meant to be compatible with the existing `mpris` script installed on a Linux version. Arguments after `mpris` will be ignored. The expansion should be `/exec mpris` at minimum. See the screenshot below.
4. Type `/np` (or the alias you used) in a chat and if media is playing it will show the metadata publicly.

<img width="725" alt="screen shot 2017-12-26 at 01 34 05" src="https://user-images.githubusercontent.com/724848/34349081-f3bb89b2-e9dc-11e7-8847-403f7d4b009d.png" title="Note the np line">
