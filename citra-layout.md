# Citra custom layouts

If you search for this, a popular link will lead to this [page](https://www.reddit.com/r/Citra/comments/afsq4a/various_custom_screen_layouts/). I was not really satisfied with those presets, side-by-side or in set is not the best way to go.

## Side-by-side layouts

To start, the 1920x1080 side-by-side's bottom (smaller) screen is not centered properly from that source. Let me share the perfectly aligned version below:

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=true
custom_top_left=0
custom_top_top\default=false
custom_top_top=130
custom_top_right\default=false
custom_top_right=1350
custom_top_bottom\default=false
custom_top_bottom=950
custom_bottom_left\default=false
custom_bottom_left=1360
custom_bottom_top\default=false
custom_bottom_top=355
custom_bottom_right\default=false
custom_bottom_right=1920
custom_bottom_bottom\default=false
custom_bottom_bottom=725
```

If you do a screen capture and check what's up, you can calculate that the pixels align correctly now with the bottom screen (centered as it should be). I also removed the 6 pixels at the left, since the bottom screen was also stretched completely to fit the screen's width. You can of course add back the 6 pixels at the left if you want to. The width difference between the two is now 10 pixels, so that they become the same, round numbers. That is:

Larger screen: 1350x820
Smaller screen: 560x370

Just for fun, I also did this particular side-by-side arrangement for the Steam Deck's screen size, though it's untested (1280x800):

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=true
custom_top_left=0
custom_top_top\default=false
custom_top_top=130
custom_top_right\default=false
custom_top_right=900
custom_top_bottom\default=false
custom_top_bottom=670
custom_bottom_left\default=false
custom_bottom_left=910
custom_bottom_top\default=false
custom_bottom_top=255
custom_bottom_right\default=false
custom_bottom_right=1280
custom_bottom_bottom\default=false
custom_bottom_bottom=545
```

## My custom layouts

If we want to imitate the real Nintendo 3DS console as close as possible, then the two screens should be placed at top and bottom, so it is not exactly right to place the smaller bottom screen next to the enlarged top screen (and the inset option means you can never see that part of the top screen, so that's not the brightest idea to do either).

Then what to do? Well, first of all, the original screen sizes are the following:

```
400x240 (5:3 aspect ratio) - top
320x240 (4:3 aspect ratio) - bottom
```

For 1920x1080, I'd simply double the original screen size and center the two screens, so the result becomes very balanced:

```
800x480 (5:3 aspect ratio) - top
640x480 (4:3 aspect ratio) - bottom
```

That will leave quite some screen estate unused, but still, this is what I'd personally use for 1920x1080 to match the console's screen size experience:

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=560
custom_top_top\default=false
custom_top_top=56
custom_top_right\default=false
custom_top_right=1360
custom_top_bottom\default=false
custom_top_bottom=536
custom_bottom_left\default=false
custom_bottom_left=640
custom_bottom_top\default=false
custom_bottom_top=540
custom_bottom_right\default=false
custom_bottom_right=1280
custom_bottom_bottom\default=false
custom_bottom_bottom=1024
```

I gave 4 pixels for spacing at the bottom, top and between the two screens. Therefore, 56 pixels exist both at top and bottom, and 4 pixels separate the top and bottom screen. If you don't want this extra spacing and don't mind if the borders hit/fill the edge of the screens, then this is what you need:

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=560
custom_top_top\default=false
custom_top_top=60
custom_top_right\default=false
custom_top_right=1360
custom_top_bottom\default=false
custom_top_bottom=540
custom_bottom_left\default=false
custom_bottom_left=640
custom_bottom_top\default=false
custom_bottom_top=540
custom_bottom_right\default=false
custom_bottom_right=1280
custom_bottom_bottom\default=false
custom_bottom_bottom=1020
```

Another one I came up with is a larger top screen and smaller bottom screen. In this case, the top screen will be 1200x720 (3x enlarged), and the bottom screen will be 480x360 (1.5x enlarged). This may help in getting more of a 720p experience for the top screen. Although this is not exactly what the console looks like. First, the extra spacing version with 4 pixels:

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=360
custom_top_top\default=false
custom_top_top=4
custom_top_right\default=false
custom_top_right=1560
custom_top_bottom\default=false
custom_top_bottom=716
custom_bottom_left\default=false
custom_bottom_left=720
custom_bottom_top\default=false
custom_bottom_top=720
custom_bottom_right\default=false
custom_bottom_right=1200
custom_bottom_bottom\default=false
custom_bottom_bottom=1076
```

Lastly, the one without any extra spacing:

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=360
custom_top_top\default=true
custom_top_top=0
custom_top_right\default=false
custom_top_right=1560
custom_top_bottom\default=false
custom_top_bottom=720
custom_bottom_left\default=false
custom_bottom_left=720
custom_bottom_top\default=false
custom_bottom_top=720
custom_bottom_right\default=false
custom_bottom_right=1200
custom_bottom_bottom\default=false
custom_bottom_bottom=1080
```