---
title: "Lab 10: Image files and processing"
weight: 1
date: 2026-03-30
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
# bookHref: ''
---

# {{< param "title" >}}

## Objective
Learn about:
- Images as 2D signals
- Impact of resampling approaches
- Bulk image processing

## Setup
The lab directory has some starter code and files in the `lab10` subdirectory, so merge in the pull request and pull changes to your local computer.

## Task 1: Resizing
One of the most common image processing operations is shrinking (or, less commonly, increasing) the number of pixels. Even with libraries that provide convenient "resize" functions, you need to choose the [resampling algorithm](https://en.wikipedia.org/wiki/Image_scaling#Algorithms) and the target dimensions.

1. First, create a small artificial image of a white (pixel value 255) circle in a black (pixel value 0) background. I've included some hints on how to do this using `np.meshgrid`.
2. Convert the numpy array to a PIL image and display it. For tiny images like these, I find it better to use matplotlib rather than PIL's default `display`. Matplotlib can display PIL images directly, e.g.:
   ```python
    circle = Image.fromarray(circle_np)
    plt.imshow(circle, cmap="grey", vmax=255)
    ```
    I recommend setting using `cmap="grey"` and `vmax=255` to make sure your image is displayed in greyscale properly.
3. Downsample the image to 32x32 pixels using both `Resampling.NEAREST` and `Resampling.BILINEAR`. Which one looks better for this type of image?
4. Repeat the previous step, but resize to a non-integer multiple of the original size (e.g. 40x40). How does this differ from the previous version?
5. Open the image `cat.jpg` from the `imgs` subdirectory and load it as a PIL image. Display it to provide a baseline full resolution version.
6. Again, downsample with both approaches to a fairly small resolution, such as 64x64. How does the resampling approach change the appearance of this real image?

## Task 2: Channel mixing
Sometimes the colour information is not important to a task and you can save 3x the data and processing time by converting to greyscale. Playing around with channel mixing is also a good way of learning about the information in each channel.

1. Convert the cat image (or a different natural scene image of your choice) to a numpy array so you can readily access each channel independently.
2. Display each of the red, green, and blue channels as greyscale images (making sure to use `cmap="grey"` in your `imshow` function).
3. The default greyscale conversion function in PIL is the "ITU-R 601-2 luma transform:"
    ```
    L = R * 299/1000 + G * 587/1000 + B * 114/1000
    ```
    You can see what this looks like by running `cat.convert("L")`. Try experimenting with different weighted sums of your numpy cat image to see the variation in greyscale results.

## Task 3: Batch processing
Most of the time you'll want to set up some kind of loop to batch process a bunch of images. I've provided a handful of images in the subdirectory `imgs`, but they differ in file type, bit depth, indexed vs RGB colour, greyscale, etc. Assume these are just a small sample of a much larger dataset, so you can't deal with them one at a time.

> Assume that you are preparing these images for a **classification task**. Document your decisions at each step.

In Python (or if you're feeling adventurous, bash with [ImageMagick](https://imagemagick.org)), loop over each image in the `imgs` subdirectory and do the following steps:

1. Convert the image to a consistent bit depth and number of channels.
2. Resize the image to consistent dimensions, being intentional about the size and resampling method chosen.
3. Save a copy of the image in a consistent format. This can either be an image format or something like a Python pickle file, but again, justify your choice.

## Submit
As usual, commit and push what you've done so I can see your work and give feedback (and points!).