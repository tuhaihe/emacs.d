## About

This is my emacs configuration forked from [Purcel's emacs.d]. That's
a very great help for myself, but it's still lack of something fun, so
I have added them on the base of now. Included:

* fullscreen.el: `M-x fullscreen` or `M-x fullscreen-toggle` to enter
  fullscreen mode or leave it.
* display-time: show the Date and time
* Keep mouse point away from cursor
* enabe tabbar to quickly switch between different buffers, just
  `M-left`
* Change Block Mark shortcus to `M-/`
* Change undo shortcut from `C-x u` to `C-/`
* Change window switch key from `C-x o` to `C->`

[Purcel's emacs.d]: https://github.com/purcell/emacs.d

If you don't understand them, just ignored the Chinese comments in
the file /lisp/init-locales.el.

## Requirements

* Emacs 23 or greater (note that Emacs 24 is required for some
  functionality, and will likely become the minimum required version
  some time soon.)

## Installation

To install, clone this repo to `~/.emacs.d`, i.e. ensure that the
`init.el` contained in this repo ends up at `~/.emacs.d/init.el`:

``` git clone https://github.com/tuhaihe/emacs.d.git ~/.emacs.d ```

## Updates

Update the config with `git pull`.

## Issues

If you have any questions about it, you can go to [Purcel's emacs.d] to report it. I just did one little thing to it. Thanks.
