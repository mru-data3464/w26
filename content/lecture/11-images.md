---
title: "11: Image Processing"
date: 2026-03-23T09:31:18-06:00
marp: true
theme: marp-mru
paginate: true
headingDivider: 2
layout: lecture
toc: true
draft: true
code: ""
leftoff: []
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
- Image filters
- Preprocessing for image recognition tasks

**Resources used:**
- [Computer Vision: Algorithms and Applications (2nd edition)](https://szeliski.org/Book/)
- [Pillow Documentation](https://pillow.readthedocs.io/en/stable/index.html)

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
<!-- _class: code_reminder -->

- A photosensor responds to **light intensity** with an electrical signal
- Physical filters restrict the colour that reaches each sensor
- On most digital cameras, 1 sensor $\ne$ 1 pixel; it is instead **interpolated** to create a typical **3-channel image**
- [Inexplicably](https://github.com/python-pillow/Pillow/discussions/5341), Pillow uses the term "band"

![bg right:25% 85%](https://upload.wikimedia.org/wikipedia/commons/3/37/Bayer_pattern_on_sensor.svg) 

<footer>Bayer sensor pattern diagram by <a href="https://en.wikipedia.org/wiki/User:Cburnett" class="extiw" title="en:User:Cburnett">en:User:Cburnett</a> - <span class="int-own-work" lang="en">Own work</span>, <a href="http://creativecommons.org/licenses/by-sa/3.0/" title="Creative Commons Attribution-Share Alike 3.0">CC BY-SA 3.0</a>, <a href="https://commons.wikimedia.org/w/index.php?curid=1496858">Link</a>