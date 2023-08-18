# Citra custom layouts

**I've made a very simple program in C# that can generate custom layouts for Citra, using three options: centered, side-by-side, in set (top left, top right, bottom left, bottom right). If you want to generate for different screen sizes or for in set, this should make it a lot easier. [Download it from here.](https://github.com/niltwill/various-stuff/raw/main/Citra/Citra-LayoutGenerator.zip)**

If you search for this, a popular link will lead to this [page](https://www.reddit.com/r/Citra/comments/afsq4a/various_custom_screen_layouts/). That got me started, however if we want to imitate the real Nintendo 3DS console as close as possible, then the two screens should be placed at top and bottom, so it is not exactly right to place the smaller bottom screen next to the enlarged top screen (and the inset option means you can never see that part of the top screen, so that's not the brightest idea to do either).

Then what to do? Well, first of all, the original screen sizes are the following:

```
400x240 (5:3 aspect ratio) - top
320x240 (4:3 aspect ratio) - bottom
```

So these two sizes can be multiplied, but for best accuracy, the aspect ratio should remain 5:3 for the top screen and 4:3 for the bottom screen. Based on this, you can do this for any monitor screen size, as long as you understand how to do the math. It's easiest to use an image editor, use colored rectangles and check the length of the pixels.

I have made several custom layouts for some of the most popular and widely used screen resolutions (with the desktop or laptop screen). If you want it for different screen sizes (e.g. for mobiles, tablets, etc.), use the simple C# program, linked above.

## 1024x768 custom layouts

Top and bottom layout:

**1. [(preview)](1024x768-1.jpg)**

- 800x480 (2x enlarged)<br>
- 320x240

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=112
custom_top_top\default=false
custom_top_top=20
custom_top_right\default=false
custom_top_right=912
custom_top_bottom\default=false
custom_top_bottom=500
custom_bottom_left\default=false
custom_bottom_left=352
custom_bottom_top\default=false
custom_bottom_top=508
custom_bottom_right\default=false
custom_bottom_right=672
custom_bottom_bottom\default=false
custom_bottom_bottom=748
```

**2. [(preview)](1024x768-2.jpg)**

The side-by-side layout:

- 600x360 (1.5x enlarged)<br>
- 320x240

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=48
custom_top_top\default=false
custom_top_top=204
custom_top_right\default=false
custom_top_right=648
custom_top_bottom\default=false
custom_top_bottom=564
custom_bottom_left\default=false
custom_bottom_left=656
custom_bottom_top\default=false
custom_bottom_top=264
custom_bottom_right\default=false
custom_bottom_right=976
custom_bottom_bottom\default=false
custom_bottom_bottom=504
```

## 1280x720 custom layouts

Top and bottom layout:

**1. [(preview)](1280x720-1.jpg)**

- 600x360 (1.5x enlarged)<br>
- 320x240

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=340
custom_top_top\default=false
custom_top_top=56
custom_top_right\default=false
custom_top_right=940
custom_top_bottom\default=false
custom_top_bottom=416
custom_bottom_left\default=false
custom_bottom_left=480
custom_bottom_top\default=false
custom_bottom_top=424
custom_bottom_right\default=false
custom_bottom_right=800
custom_bottom_bottom\default=false
custom_bottom_bottom=664
```

**2. [(preview)](1280x720-2.jpg)**

The side-by-side layout:

- 800x480 (2x enlarged)<br>
- 320x240

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=76
custom_top_top\default=false
custom_top_top=120
custom_top_right\default=false
custom_top_right=876
custom_top_bottom\default=false
custom_top_bottom=600
custom_bottom_left\default=false
custom_bottom_left=884
custom_bottom_top\default=false
custom_bottom_top=240
custom_bottom_right\default=false
custom_bottom_right=1204
custom_bottom_bottom\default=false
custom_bottom_bottom=480
```

## 1280x800 custom layouts

For the Steam Deck's screen size, the top and bottom layout:

**1. [(preview)](1280x800-1.jpg)**

- 600x360 (1.5x enlarged)<br>
- 480x360 (1.5x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=340
custom_top_top\default=false
custom_top_top=36
custom_top_right\default=false
custom_top_right=940
custom_top_bottom\default=false
custom_top_bottom=396
custom_bottom_left\default=false
custom_bottom_left=400
custom_bottom_top\default=false
custom_bottom_top=404
custom_bottom_right\default=false
custom_bottom_right=880
custom_bottom_bottom\default=false
custom_bottom_bottom=764
```

**2. [(preview)](1280x800-2.jpg)**

The side-by-side layout with identical sizes:

- 600x360 (1.5x enlarged)<br>
- 480x360 (1.5x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=96
custom_top_top\default=false
custom_top_top=220
custom_top_right\default=false
custom_top_right=696
custom_top_bottom\default=false
custom_top_bottom=580
custom_bottom_left\default=false
custom_bottom_left=704
custom_bottom_top\default=false
custom_bottom_top=220
custom_bottom_right\default=false
custom_bottom_right=1184
custom_bottom_bottom\default=false
custom_bottom_bottom=580
```

**3. [(preview)](1280x800-3.jpg)**

The side-by-side layout with larger top (in this orientation, actually left) screen:

- 800x480 (2x enlarged)<br>
- 320x240

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=76
custom_top_top\default=false
custom_top_top=160
custom_top_right\default=false
custom_top_right=876
custom_top_bottom\default=false
custom_top_bottom=640
custom_bottom_left\default=false
custom_bottom_left=884
custom_bottom_top\default=false
custom_bottom_top=280
custom_bottom_right\default=false
custom_bottom_right=1204
custom_bottom_bottom\default=false
custom_bottom_bottom=520
```

## 1280x1024 custom layouts

For a centered screen:

**1. [(preview)](1280x1024-1.jpg)**

- 800x480 (2x enlarged)<br>
- 640x480 (2x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=240
custom_top_top\default=false
custom_top_top=28
custom_top_right\default=false
custom_top_right=1040
custom_top_bottom\default=false
custom_top_bottom=508
custom_bottom_left\default=false
custom_bottom_left=320
custom_bottom_top\default=false
custom_bottom_top=516
custom_bottom_right\default=false
custom_bottom_right=960
custom_bottom_bottom\default=false
custom_bottom_bottom=996
```

**2. [(preview)](1280x1024-2.jpg)**

The side-by-side layout with larger top screen:

- 800x480 (2x enlarged)<br>
- 320x240

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=76
custom_top_top\default=false
custom_top_top=272
custom_top_right\default=false
custom_top_right=876
custom_top_bottom\default=false
custom_top_bottom=752
custom_bottom_left\default=false
custom_bottom_left=884
custom_bottom_top\default=false
custom_bottom_top=392
custom_bottom_right\default=false
custom_bottom_right=1204
custom_bottom_bottom\default=false
custom_bottom_bottom=632
```

## 1366x768 custom layouts

For laptop screens:

**1. [(preview)](1366x768-1.jpg)**

- 800x480 (2x enlarged)<br>
- 320x240

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=283
custom_top_top\default=false
custom_top_top=20
custom_top_right\default=false
custom_top_right=1083
custom_top_bottom\default=false
custom_top_bottom=500
custom_bottom_left\default=false
custom_bottom_left=523
custom_bottom_top\default=false
custom_bottom_top=508
custom_bottom_right\default=false
custom_bottom_right=843
custom_bottom_bottom\default=false
custom_bottom_bottom=748
```

**2. [(preview)](1366x768-2.jpg)**

The side-by-side layout with larger top screen:

- 800x480 (2x enlarged)<br>
- 480x360 (1.5x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=39
custom_top_top\default=false
custom_top_top=144
custom_top_right\default=false
custom_top_right=839
custom_top_bottom\default=false
custom_top_bottom=624
custom_bottom_left\default=false
custom_bottom_left=847
custom_bottom_top\default=false
custom_bottom_top=204
custom_bottom_right\default=false
custom_bottom_right=1327
custom_bottom_bottom\default=false
custom_bottom_bottom=564
```

## 1440x900 custom layouts

For centered layout:

**1. [(preview)](1440x900-1.jpg)**

- 800x480 (2x enlarged)<br>
- 480x360 (1.5x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=320
custom_top_top\default=false
custom_top_top=26
custom_top_right\default=false
custom_top_right=1120
custom_top_bottom\default=false
custom_top_bottom=506
custom_bottom_left\default=false
custom_bottom_left=480
custom_bottom_top\default=false
custom_bottom_top=514
custom_bottom_right\default=false
custom_bottom_right=960
custom_bottom_bottom\default=false
custom_bottom_bottom=874
```

A side-by-side layout with a larger top screen and small bottom screen:

**2. [(preview)](1440x900-2.jpg)**

- 1000x600 (2.5x enlarged)<br>
- 320x240

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=56
custom_top_top\default=false
custom_top_top=150
custom_top_right\default=false
custom_top_right=1056
custom_top_bottom\default=false
custom_top_bottom=750
custom_bottom_left\default=false
custom_bottom_left=1064
custom_bottom_top\default=false
custom_bottom_top=330
custom_bottom_right\default=false
custom_bottom_right=1384
custom_bottom_bottom\default=false
custom_bottom_bottom=570
```

A side-by-side layout with a more equally distributed top screen and bottom screen:

**3. [(preview)](1440x900-3.jpg)**

- 800x480 (2x enlarged)<br>
- 480x360 (1.5x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=76
custom_top_top\default=false
custom_top_top=210
custom_top_right\default=false
custom_top_right=876
custom_top_bottom\default=false
custom_top_bottom=690
custom_bottom_left\default=false
custom_bottom_left=884
custom_bottom_top\default=false
custom_bottom_top=270
custom_bottom_right\default=false
custom_bottom_right=1364
custom_bottom_bottom\default=false
custom_bottom_bottom=630
```

## 1600x900 custom layouts

For centered layout:

**1. [(preview)](1600x900-1.jpg)**

- 800x480 (2x enlarged)<br>
- 480x360 (1.5x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=400
custom_top_top\default=false
custom_top_top=26
custom_top_right\default=false
custom_top_right=1200
custom_top_bottom\default=false
custom_top_bottom=506
custom_bottom_left\default=false
custom_bottom_left=560
custom_bottom_top\default=false
custom_bottom_top=514
custom_bottom_right\default=false
custom_bottom_right=1040
custom_bottom_bottom\default=false
custom_bottom_bottom=874
```

A side-by-side layout with a larger top screen and small bottom screen:

**2. [(preview)](1600x900-2.jpg)**

- 1000x600 (2.5x enlarged)<br>
- 480x360 (1.5x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=56
custom_top_top\default=false
custom_top_top=150
custom_top_right\default=false
custom_top_right=1056
custom_top_bottom\default=false
custom_top_bottom=750
custom_bottom_left\default=false
custom_bottom_left=1064
custom_bottom_top\default=false
custom_bottom_top=270
custom_bottom_right\default=false
custom_bottom_right=1544
custom_bottom_bottom\default=false
custom_bottom_bottom=630
```

## 1680x1050 custom layouts

For a centered layout with larger top screen:

**1. [(preview)](1680x1050-1.jpg)**

- 1000x600 (2.5x enlarged)<br>
- 480x360 (1.5x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=340
custom_top_top\default=false
custom_top_top=41
custom_top_right\default=false
custom_top_right=1340
custom_top_bottom\default=false
custom_top_bottom=641
custom_bottom_left\default=false
custom_bottom_left=600
custom_bottom_top\default=false
custom_bottom_top=649
custom_bottom_right\default=false
custom_bottom_right=1080
custom_bottom_bottom\default=false
custom_bottom_bottom=1009
```

For a more equally distributed screen size with centered for top and bottom screen:

**2. [(preview)](1680x1050-1.jpg)**

- 800x480 (2x enlarged)<br>
- 640x480 (2x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=440
custom_top_top\default=false
custom_top_top=41
custom_top_right\default=false
custom_top_right=1240
custom_top_bottom\default=false
custom_top_bottom=521
custom_bottom_left\default=false
custom_bottom_left=520
custom_bottom_top\default=false
custom_bottom_top=529
custom_bottom_right\default=false
custom_bottom_right=1160
custom_bottom_bottom\default=false
custom_bottom_bottom=1009
```

For a tight side-by-side layout:

**2. [(preview)](1680x1050-3.jpg)**

- 1000x600 (2.5x enlarged)<br>
- 640x480 (2x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=16
custom_top_top\default=false
custom_top_top=225
custom_top_right\default=false
custom_top_right=1016
custom_top_bottom\default=false
custom_top_bottom=825
custom_bottom_left\default=false
custom_bottom_left=1024
custom_bottom_top\default=false
custom_bottom_top=285
custom_bottom_right\default=false
custom_bottom_right=1664
custom_bottom_bottom\default=false
custom_bottom_bottom=765
```

Same side-by-side layout as earlier, but with a smaller bottom screen:

**2. [(preview)](1680x1050-4.jpg)**

- 1000x600 (2.5x enlarged)<br>
- 480x360 (1.5x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=96
custom_top_top\default=false
custom_top_top=225
custom_top_right\default=false
custom_top_right=1096
custom_top_bottom\default=false
custom_top_bottom=825
custom_bottom_left\default=false
custom_bottom_left=1104
custom_bottom_top\default=false
custom_bottom_top=345
custom_bottom_right\default=false
custom_bottom_right=1584
custom_bottom_bottom\default=false
custom_bottom_bottom=705
```

## 1920x1080 (1080p) custom layouts

Here, I'd simply double the original screen size, so the result becomes very balanced.

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

## 2560x1080 (Ultra Wide) custom layouts

For the "Ultra Wide" resolution, a centered layout will leave a lot of area unused:

**1. [(preview)](2560x1080-1.jpg)**

- 1000x600 (2.5x enlarged)<br>
- 480x360 (1.5x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=780
custom_top_top\default=false
custom_top_top=56
custom_top_right\default=false
custom_top_right=1780
custom_top_bottom\default=false
custom_top_bottom=656
custom_bottom_left\default=false
custom_bottom_left=1040
custom_bottom_top\default=false
custom_bottom_top=664
custom_bottom_right\default=false
custom_bottom_right=1520
custom_bottom_bottom\default=false
custom_bottom_bottom=1024
```

In this screen resolution, it would be better to use a side-by-side layout, due to the width giving more freedom, like so:

**2. [(preview)](2560x1080-2.jpg)**

- 1400x840 (3.5x enlarged)<br>
- 960x720 (3x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=96
custom_top_top\default=false
custom_top_top=120
custom_top_right\default=false
custom_top_right=1496
custom_top_bottom\default=false
custom_top_bottom=960
custom_bottom_left\default=false
custom_bottom_left=1504
custom_bottom_top\default=false
custom_bottom_top=180
custom_bottom_right\default=false
custom_bottom_right=2464
custom_bottom_bottom\default=false
custom_bottom_bottom=900
```

Same side-by-side layout, but if you want it with a smaller bottom screen:

**2. [(preview)](2560x1080-3.jpg)**

- 1400x840 (3.5x enlarged)<br>
- 800x600 (2.5x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=176
custom_top_top\default=false
custom_top_top=120
custom_top_right\default=false
custom_top_right=1576
custom_top_bottom\default=false
custom_top_bottom=960
custom_bottom_left\default=false
custom_bottom_left=1584
custom_bottom_top\default=false
custom_bottom_top=240
custom_bottom_right\default=false
custom_bottom_right=2384
custom_bottom_bottom\default=false
custom_bottom_bottom=840
```

## 2560x1440 (1440p) custom layouts

For 2560x1440 or QHD, we can simply triple the original screen size. However by doing so, unlike 1080p, there will be no additional space left for any extra spacing (not without slightly cutting from the screens and thus ruining the aspect ratio).

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

## 3840x2160 (4K) custom layouts

For 3840x2160 or 4K, a centered layout is the following (still a lot of empty space):

**1. [(preview)](3840x2160-1.jpg)**

- 2000x1200 (5x enlarged)<br>
- 1120x840 (3.5x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=920
custom_top_top\default=false
custom_top_top=56
custom_top_right\default=false
custom_top_right=2920
custom_top_bottom\default=false
custom_top_bottom=1256
custom_bottom_left\default=false
custom_bottom_left=1360
custom_bottom_top\default=false
custom_bottom_top=1264
custom_bottom_right\default=false
custom_bottom_right=2480
custom_bottom_bottom\default=false
custom_bottom_bottom=2104
```

Here is a side-by-side layout for 4K:

**2. [(preview)](3840x2160-2.jpg)**

- 2400x1440 (6x enlarged)<br>
- 1280x960 (4x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=920
custom_top_top\default=false
custom_top_top=56
custom_top_right\default=false
custom_top_right=2920
custom_top_bottom\default=false
custom_top_bottom=1256
custom_bottom_left\default=false
custom_bottom_left=1360
custom_bottom_top\default=false
custom_bottom_top=1264
custom_bottom_right\default=false
custom_bottom_right=2480
custom_bottom_bottom\default=false
custom_bottom_bottom=2104
```

Another side-by-side layout with a bit bigger bottom screen:

**3. [(preview)](3840x2160-3.jpg)**

- 2200x1320 (5.5x enlarged)<br>
- 1440x1080 (4.5x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=96
custom_top_top\default=false
custom_top_top=420
custom_top_right\default=false
custom_top_right=2296
custom_top_bottom\default=false
custom_top_bottom=1740
custom_bottom_left\default=false
custom_bottom_left=2304
custom_bottom_top\default=false
custom_bottom_top=540
custom_bottom_right\default=false
custom_bottom_right=3744
custom_bottom_bottom\default=false
custom_bottom_bottom=1620
```

## 5120x1440 (Dual QHD) custom layouts

For 5120x1440 or Dual QHD, the centered layout has the same issue as 2560x1080 (Ultra Wide), so centered is not the best way to go here:

**1. [(preview)](5120x1440-1.jpg)**

- 1600x960 (4x enlarged)<br>
- 480x360 (1.5x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=1760
custom_top_top\default=false
custom_top_top=56
custom_top_right\default=false
custom_top_right=3360
custom_top_bottom\default=false
custom_top_bottom=1016
custom_bottom_left\default=false
custom_bottom_left=2320
custom_bottom_top\default=false
custom_bottom_top=1024
custom_bottom_right\default=false
custom_bottom_right=2800
custom_bottom_bottom\default=false
custom_bottom_bottom=1384
```

A centered layout with a slightly larger bottom screen:

**2. [(preview)](5120x1440-2.jpg)**

- 1400x840 (3.5x enlarged)<br>
- 640x480 (2x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=1860
custom_top_top\default=false
custom_top_top=56
custom_top_right\default=false
custom_top_right=3260
custom_top_bottom\default=false
custom_top_bottom=896
custom_bottom_left\default=false
custom_bottom_left=2240
custom_bottom_top\default=false
custom_bottom_top=904
custom_bottom_right\default=false
custom_bottom_right=2880
custom_bottom_bottom\default=false
custom_bottom_bottom=1384
```

A side-by-side layout can shine a little more here, like this:

**3. [(preview)](5120x1440-3.jpg)**

- 2200x1320 (5.5x enlarged)<br>
- 1600x1200 (5x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=656
custom_top_top\default=false
custom_top_top=60
custom_top_right\default=false
custom_top_right=2856
custom_top_bottom\default=false
custom_top_bottom=1380
custom_bottom_left\default=false
custom_bottom_left=2864
custom_bottom_top\default=false
custom_bottom_top=120
custom_bottom_right\default=false
custom_bottom_right=4464
custom_bottom_bottom\default=false
custom_bottom_bottom=1320
```

A side-by-side layout with equal top and bottom screen sizes next to each other:

**4. [(preview)](5120x1440-4.jpg)**

- 2200x1320 (5.5x enlarged)<br>
- 1760x1320 (5.5x enlarged)

```
custom_layout\default=false
custom_layout=true
custom_top_left\default=false
custom_top_left=576
custom_top_top\default=false
custom_top_top=60
custom_top_right\default=false
custom_top_right=2776
custom_top_bottom\default=false
custom_top_bottom=1380
custom_bottom_left\default=false
custom_bottom_left=2784
custom_bottom_top\default=false
custom_bottom_top=60
custom_bottom_right\default=false
custom_bottom_right=4544
custom_bottom_bottom\default=false
custom_bottom_bottom=1380
```