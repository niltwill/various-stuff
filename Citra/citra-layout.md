# Citra custom layouts

If you search for this, a popular link will lead to this [page](https://www.reddit.com/r/Citra/comments/afsq4a/various_custom_screen_layouts/). I was not really satisfied with those presets, side-by-side or in set is not the best way to go.

If we want to imitate the real Nintendo 3DS console as close as possible, then the two screens should be placed at top and bottom, so it is not exactly right to place the smaller bottom screen next to the enlarged top screen (and the inset option means you can never see that part of the top screen, so that's not the brightest idea to do either).

Then what to do? Well, first of all, the original screen sizes are the following:

```
400x240 (5:3 aspect ratio) - top
320x240 (4:3 aspect ratio) - bottom
```

So these two sizes can be multiplied, but for best accuracy, the aspect ratio should remain 5:3 for the top screen and 4:3 for the bottom screen. Based on this, you can do this for any monitor screen size, as long as you understand how to do the math. It's easiest to use an image editor, use colored rectangles and check the pixels.

For now, I have made custom layouts for 1080p and 1440p. For 4K (3840x2160), you should only need to double the values of 1080p.
I will consider writing a simple program that can calculate the right values based on the size you give it. Until then...
Doing this manually can take hours, later I'll do it for some more common screen sizes with simple preview images:

* 1024x768
* 1280x720
* 1280x800 (Steam Deck)
* 1280x1024
* 1366x768
* 1440x900
* 1600x900
* 1680x1050
* 2560x1080 (Ultra Wide)
* 3840x2160 (4K)
* 5120x1440 (Dual QHD)

## 1080p custom layouts

For 1920x1080, I'd simply double the original screen size, so the result becomes very balanced.

**1. [(preview)](1080p-1.jpg)**

- 800x480 (2x enlarged)<br>
- 640x480 (2x enlarged)

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
custom_bottom_top=544
custom_bottom_right\default=false
custom_bottom_right=1280
custom_bottom_bottom\default=false
custom_bottom_bottom=1024
```

**2. [(preview)](1080p-2.jpg)**

For a bigger top screen and smaller bottom screen:

- 1200x720 (3x enlarged)<br>
- 320x240 (original size)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=360
custom_top_top\default=false
custom_top_top=56
custom_top_right\default=false
custom_top_right=1560
custom_top_bottom\default=false
custom_top_bottom=776
custom_bottom_left\default=false
custom_bottom_left=800
custom_bottom_top\default=false
custom_bottom_top=784
custom_bottom_right\default=false
custom_bottom_right=1120
custom_bottom_bottom\default=false
custom_bottom_bottom=1024
```

**3. [(preview)](1080p-3.jpg)**

Lastly, here is one I made for the side-by-side layout:

- 1200x720 (3x enlarged)<br>
- 480x360 (1.5x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=116
custom_top_top\default=false
custom_top_top=180
custom_top_right\default=false
custom_top_right=1316
custom_top_bottom\default=false
custom_top_bottom=900
custom_bottom_left\default=false
custom_bottom_left=1324
custom_bottom_top\default=false
custom_bottom_top=360
custom_bottom_right\default=false
custom_bottom_right=1804
custom_bottom_bottom\default=false
custom_bottom_bottom=720
```

## 1440p custom layouts

For 2560x1440, we can simply triple the original screen size. However by doing so, unlike 1080p, there will be no additional space left for any extra spacing (not without slightly cutting from the screens and thus ruining the aspect ratio).

**1. [(preview)](1440p-1.jpg)**

- 1200x720 (3x enlarged)<br>
- 960x720 (3x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=680
custom_top_top\default=true
custom_top_top=0
custom_top_right\default=false
custom_top_right=1880
custom_top_bottom\default=false
custom_top_bottom=720
custom_bottom_left\default=false
custom_bottom_left=960
custom_bottom_top\default=false
custom_bottom_top=720
custom_bottom_right\default=false
custom_bottom_right=1760
custom_bottom_bottom\default=false
custom_bottom_bottom=1440
```

**2. [(preview)](1440p-2.jpg)**

For a bigger top screen and smaller bottom screen:

- 1600x960 (4x enlarged)<br>
- 640x480 (2x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=480
custom_top_top\default=true
custom_top_top=0
custom_top_right\default=false
custom_top_right=2080
custom_top_bottom\default=false
custom_top_bottom=960
custom_bottom_left\default=false
custom_bottom_left=960
custom_bottom_top\default=false
custom_bottom_top=960
custom_bottom_right\default=false
custom_bottom_right=1600
custom_bottom_bottom\default=false
custom_bottom_bottom=1440
```

**3. [(preview)](1440p-3.jpg)**

The previous two may not be that bad, but since I'd prefer to have some separation of the screens, for the extra spacing, this and the following one could be a lot better to use:

- 1200x720 (3x enlarged)<br>
- 640x480 (2x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=680
custom_top_top\default=false
custom_top_top=118
custom_top_right\default=false
custom_top_right=1880
custom_top_bottom\default=false
custom_top_bottom=838
custom_bottom_left\default=false
custom_bottom_left=960
custom_bottom_top\default=false
custom_bottom_top=842
custom_bottom_right\default=false
custom_bottom_right=1600
custom_bottom_bottom\default=false
custom_bottom_bottom=1322
```

**4. [(preview)](1440p-4.jpg)**

For a bigger top screen and smaller bottom screen:

- 1600x960 (4x enlarged)<br>
- 480x360 (1.5x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=480
custom_top_top\default=false
custom_top_top=58
custom_top_right\default=false
custom_top_right=2080
custom_top_bottom\default=false
custom_top_bottom=1018
custom_bottom_left\default=false
custom_bottom_left=1040
custom_bottom_top\default=false
custom_bottom_top=1022
custom_bottom_right\default=false
custom_bottom_right=1520
custom_bottom_bottom\default=false
custom_bottom_bottom=1322
```

**5. [(preview)](1440p-5.jpg)**

Lastly, here is one I made for the side-by-side layout:

- 1600x960 (4x enlarged)<br>
- 800x600 (2.5x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=76
custom_top_top\default=false
custom_top_top=240
custom_top_right\default=false
custom_top_right=1676
custom_top_bottom\default=false
custom_top_bottom=1200
custom_bottom_left\default=false
custom_bottom_left=1684
custom_bottom_top\default=false
custom_bottom_top=420
custom_bottom_right\default=false
custom_bottom_right=2484
custom_bottom_bottom\default=false
custom_bottom_bottom=1020
```
