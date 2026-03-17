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

## What is a signal?
> "A [continous/discrete] signal is a function of independent variables that range over [a continuum/discrete] values" - Jerry L. Prince, Medical Imaging Signals and Systems

- Common notation: $x(t)$ for continuous, $x[n]$ for discrete
- Signals are **discretized** by **sampling** at some fixed interval $dt$