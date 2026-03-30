---
title: "11: Image Processing"
date: 2026-03-24
marp: true
theme: marp-mru
paginate: true
headingDivider: 2
layout: lecture
toc: true
code: "11_images"
leftoff:
  - 2026-03-26
  - 2026-03-24
---

<!-- 
_class: title_slide
_paginate: skip
-->

{{< katex />}}
{{% ignore %}}

## <!--fit-->DATA 3464: Fundamentals of Data Processing
### <!--fit-->Image Processing

Charlotte Curtis
March 24, 2026

{{% /ignore %}}

## Topic overview
- Image representation
- File formats and compression
- Preprocessing for image recognition tasks

**Resources used:**
- [Computer Vision: Algorithms and Applications (2nd edition)](https://szeliski.org/Book/)
- [Pillow Documentation](https://pillow.readthedocs.io/en/stable/index.html)
- [A blog post on image compression](https://rosswoleben.com/projects/image-compression)
- [JPEG demo](https://cgjennings.ca/articles/jpeg-compression/)

## Images as 2D signals

<div class="columns">

- The light that enters a camera can be modelled as continuous signal:
  $$f(x, y),\space -\infty < x, y < \infty$$
- Digital images are sampled:
  $$f[n, m], \space n = n \Delta_x, m = n \Delta_y$$
  where typically $\Delta_x = \Delta_y$
- The area $\Delta_x \times \Delta_y$ is called a **pic**ture **el**ement, or **pixel**

![](../../static/img/11-image-formation.png)

</div>

<footer>Image is Figure 2.14 in <a href="https://szeliski.org/Book/">Computer Vision: Algorithms and Applications</a> by Richard Szeliski</footer>

## Image channels
- A photosensor responds to **light intensity** with an electrical signal
- Physical filters restrict the colour that reaches each sensor
- On most digital cameras, 1 sensor $\ne$ 1 pixel; it is instead **interpolated** to create a typical **3-channel image**
- ([Inexplicably](https://github.com/python-pillow/Pillow/discussions/5341), the Python imaging library Pillow uses the term "band")

![bg right:25% 85%](https://upload.wikimedia.org/wikipedia/commons/3/37/Bayer_pattern_on_sensor.svg) 

<footer>Bayer sensor pattern diagram by <a href="https://en.wikipedia.org/wiki/User:Cburnett" class="extiw" title="en:User:Cburnett">en:User:Cburnett</a> - <span class="int-own-work" lang="en">Own work</span>, <a href="http://creativecommons.org/licenses/by-sa/3.0/" title="Creative Commons Attribution-Share Alike 3.0">CC BY-SA 3.0</a>, <a href="https://commons.wikimedia.org/w/index.php?curid=1496858">Link</a>

## Images as (3D) 2D arrays
<!-- _class: code_reminder -->
- Size (`np.shape`) usually defined as `[rows, cols, (channels)]`
- Typical 8-bit image: integers from 0 to 255
  - For processing, common to convert to float and **normalize**
- RGB examples of individual pixels: 
  - `[255, 0, 0]`
  - `[128, 128, 128]`
  - `[255, 255, 255]`


## Portable Network Graphics
- [PNG](https://en.wikipedia.org/wiki/PNG) is an image format released in 1996 as a GIF replacement
- Typically 8 bits per channel, but can be 1, 2, 4, 8, or 16
- 3x RGB channels, plus an optional alpha (transparency) channel
- Space saved in two ways:
  - Indexed colour, where numbers map to a finite set of colours
  - Lossless compression, e.g. `[0 0 0 0 0 0 0]` $\rightarrow$ `7 0`

> What kinds of images would benefit from this compression scheme?

## Joint Photographic Experts Group
- [JPEG](https://en.wikipedia.org/wiki/JPEG) is an image standard released in 1992 for photographic images
- **Lossy** compression based on human vision:
  1. Channels converted to [YCbCr](https://en.wikipedia.org/wiki/YCbCr) colourspace
  2. The colour components (Cb/Cr) are downsampled 2-3x
  3. Blocks of 8x8 pixels are transformed to frequency domain
  4. Amplitudes are [quantized](https://en.wikipedia.org/wiki/Quantization_(image_processing)) with larger buckets at higher frequencies
  5. Finally, lossless compression is applied
- The "quality" of a JPEG relates the degree of quantization

## Where we left off on March 24
<!-- _class: title_slide -->

## A Cautionary Tale of Image Classification
- As convolutional neural networks (CNNs) gained popularity as image recognition powerhouses, people started using them for all sorts of things
- One example: predicting whether someone is a criminal based on a photo
- [Thoroughly debunked](https://arxiv.org/abs/2006.03895) in a paper that mentions, among other issues:
  - Criminal samples are all 8-bit greyscale PNG photographs of printed images, taken with the same camera
  - Non-criminals are RGB JPEGs from 5 different sources, converted to greyscale to be "compatible with mugshots from the criminal category"

> What's the problem here?

## Preparing images for machine learning
- As with audio, images should be **consistent**
- Let's check out some [public datasets](https://archive.ics.uci.edu/datasets?skip=0&take=10&sort=desc&orderBy=NumHits&search=&Types=Image)
- Two approaches:
  - keep raw data and process on the fly (e.g. ImageNet)
  - apply some preprocessing and store (e.g. CIFAR-10)
- Common to do a bit of both, e.g. resize and save with consistent format, then apply various transforms during both training and inference

> As usual, there is a tradeoff between time and space

## Image Transformations

- **Geometric transforms** resize, rotate, skew, shift, etc
- **Point operators** independently change each pixel, e.g. histogram equalization
- **Linear filters** compute new pixel values from a weighted sum of values in a small neighbourhood
- **Nonlinear filters** compute new pixel values from a small neighbourhood in a nonlinear fashion

## Resizing
<!-- _class: code_reminder -->
- For computer vision purposes, most images need to be resized
- Most often, a **square aspect ratio** is used
  - Can be rotated 90 degrees without modifying code
  - Simplifies parameter specification
  - Maybe some CUDA advantage if divisible by 8 (e.g. $224 \times 224$)
- Resizing needs [interpolation](https://pillow.readthedocs.io/en/stable/handbook/concepts.html#concept-filters) (or resampling), and distorts aspect ratio
- Alternatively (or additionally), image **crops** can be used

## Where we left off on March 26
<!-- _class: title_slide -->

## Linear Filters: Convolution
<!-- _class: code_reminder -->

<div class="columns">

- A filter or convolution **kernel** is a small (usually) square matrix that gets **convolved** with the image:
  $$(f * g)[n, m] = \sum_{i=0}^{n}\sum_{j=0}^{m} f[i, j]g[n-i, m-j]$$

- Fun fact: this is the same as multiplication in frequency

![center](https://upload.wikimedia.org/wikipedia/commons/1/19/2D_Convolution_Animation.gif)

</div>

<footer>By Michael Plotke - Own work, CC BY-SA 3.0, <a href="https://commons.wikimedia.org/w/index.php?curid=24288958">From Wikipedia</a></footer>

## Beyond linear filters
- Linear filters are simple weighted summations, and form the core of **convolutional neural networks**, widely used in computer vision
- Sometimes, nonlinear effects are useful, such as:
  - Median image filtering to reduce certain types of noise
  - Morphological operators for binary image masks

> There is a huge world of image processing, including techniques for segmentation, feature detection, registration... too much to cover in this course!

## Tools
In addition to Pillow and the usual numpy, matplotlib, scipy libraries:
- [ImageMagick](https://imagemagick.org) is a command-line tool that can be combined with bash scripting to process a bunch of images, e.g.:
  ```bash
  mkdir resized
  for img in *.jpg; do
     magick $img -resize 512x512! resized/$img
  done
  ```
- [OpenCV](https://opencv.org/) has functionality overlap with Pillow, but also computer vision algorithms
- [Torchvision](https://docs.pytorch.org/vision/main/transforms.html) provides load-time transformations for use with deep learning models
- [ITK](https://itk.org/) is the OG classical image processing toolbox focused on medical imaging

## What about videos?
- There are an [absurd number](https://en.wikipedia.org/wiki/Comparison_of_video_container_formats) of video formats
- Most common: [MPEG4 container](https://en.wikipedia.org/wiki/MP4_file_format), [H.264 video](https://en.wikipedia.org/wiki/Advanced_Video_Coding), [AAC audio](https://en.wikipedia.org/wiki/Advanced_Audio_Coding)
- Containers can hold video, audio, subtitles, chapter information, etc
- Often video-only data is treated as a series of images (e.g. [Kinetics](https://arxiv.org/pdf/1705.06950))
- New considerations:
  - Temporal (re)sampling
  - Dataset splitting

## Splitting time series data

## Coming up next
- Image processing lab
- Assignment 3 due next week
  - Ask me for help!
- Data augmentation and generation