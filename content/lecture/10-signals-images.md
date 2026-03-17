---
title: "10: Signals and images"
date: 2026-03-17
marp: true
theme: marp-mru
paginate: true
headingDivider: 2
layout: lecture
toc: true
code: "10_signals_images"
leftoff: []
---

<!-- 
_class: title_slide
_paginate: skip
-->

{{< katex />}}
{{% ignore %}}

## <!--fit-->DATA 3464: Fundamentals of Data Processing
### <!--fit-->Signals and images

Charlotte Curtis
March 17, 2026

{{% /ignore %}}

## Topic overview
- Introduction to signals
- Images as 2D signals
- File formats
- Signal and image processing (for machine learning)

**Resources used:**
- Various textbooks from my undergrad
- [DSPguide.com](https://dspguide.com/) seems like a pretty good resource

## What is a signal?
<!-- _class: code_reminder -->
> "A [continuous/discrete] signal is a function of independent variables that range over [a continuum/discrete] values" - Jerry L. Prince, Medical Imaging Signals and Systems

- Common notation: $x(t)$ for continuous, $x[n]$ for discrete
- Signals are **discretized** by **sampling** at some fixed interval $dt$
- The **sampling rate** is informed by the frequency content of the data:
  $$f_s \ge 2 f_{max}$$
  (but in practice is much higher)

## Frequency content of a signal
- A discrete time domain signal can be represented as:
 $$x[n] = \sum_{k=0}^{N-1}\left[a_k\cos\left(\frac{2\pi k n}{N}\right) + b_k\sin\left(\frac{2\pi k n}{N}\right)\right]$$
- Or, using Euler's formula $e^{j\theta} = \cos\theta + j\sin\theta$:
  $$x[n] = \sum_{k=0}^{N-1}c_k e^{j\frac{2\pi k n}{N}}$$
  where the complex coefficients $c_k = a_k + jb_k$ and $j = \sqrt{-1}$

## Fourier Transform
- To figure out what the coefficients $c_k$ are, we can use the **Discrete Fourier Transform** (DFT):
  $$X[k] = \sum_{n=0}^{N-1}x[n]e^{-j2\pi \frac{k}{N} n}$$
  where each element of $X[k]$ is the coefficient $c_k$ for frequency $k$
- This can also be inverted to get back the original signal:
  $$x[n] = \frac{1}{N}\sum_{k=0}^{N-1}X[k]e^{j2\pi \frac{k}{N} n}$$

<footer>This is skipping over several entire math courses</footer>

## Symmetry in the frequency domain
<!-- _class: code_reminder -->
- Since a real-valued signal in time is composed of both sine and cosine components, its DFT has **conjugate symmetry**
  $$X[N-k] = X[k]^*$$
  where $^*$ denotes the complex conjugate
- This means the **negative-frequency half** of the spectrum is redundant
- In practice, for real-valued data, we often only inspect:
  - **magnitude**: $|X[k]|$ to see "how much" of each frequency is present
  - **phase**: $\angle X[k]$ to see alignment/shift information

## Example signal: Audio
<!-- _class: code_reminder -->
- Once you think of a signal as being a weighted sum of frequency components, you can do some fun things with it
- We can extract information, downsample, remove noise, etc
- Example: a typical .wav file
    - Uncompressed
    - 16 bits per sample (bit depth)
    - 48 kHz sampling rate
    - mono (1 channel) or stereo (2 channels)
> What about .mp3? .ogg? I would use [ffmpeg](https://www.ffmpeg.org/) to convert to .wav