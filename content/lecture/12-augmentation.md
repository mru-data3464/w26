---
title: "12: Data Labelling and Augmentation"
date: 2026-04-02
marp: true
theme: marp-mru
paginate: true
headingDivider: 2
layout: lecture
toc: true
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
### <!--fit-->Data Labelling and Augmentation

Charlotte Curtis
April 2, 2026

{{% /ignore %}}

## Topic overview
- Tools for fancy labelling
- Annotation conventions
- Augmenting data

**Resources used:**
- [Label Studio](https://labelstud.io/)
- [Labelformat docs](https://labelformat.com/formats/object-detection/)
- [Coco Dataset Description](https://cocodataset.org/#format-data)

## Computer vision tasks
![](../../static/img/12-coco_instance_segmentation.jpeg)

<footer>Image from https://manipulation.csail.mit.edu/segmentation.html</footer>

## How are annotations stored?
<!-- _class: code_reminder -->

Usually in plain text!
- Classification: subdirectories, csv files
- Bounding boxes: text files, e.g. COCO, VOC
- Segmentations: Text and/or PNG, e.g. [COCO](https://cocodataset.org/#format-data)

> Not a lot of formal process here - someone builds something for their purposes, others find it useful, variations abound.

## Audio annotations
![bg right fit](https://labelstud.io/_astro/e7fbf5e555761ca00a18e2a28e92e2b01a8fda07-769x546_1AMP9.avif)

- Classification: file naming/subdirectories, csvs
- Transcription: [ASR](https://docs.nvidia.com/nemo-framework/user-guide/latest/nemotoolkit/asr/datasets.html) (json files)
- Timestamps to label segments (csv, json)

<footer>Image from <a href="https://labelstud.io">https://labelstud.io</a></footer>

## Text annotation and beyond
- Document classification or sentiment analysis
- Named entity recognition, e.g. [CoNLL-2003](https://huggingface.co/datasets/eriktks/conll2003)
- Frame-by-frame video labelling

> Ultimately there are a ton of data and label formats, you may well need to write a parser to interpret whatever you get

## Data Augmentation <!-- fit -->
### The last topic!
<!-- _class: title_slide -->

## When making predictions, consider...
<!-- _class: code_reminder -->
- Your results are only as good as your data
- If it seems too good to be true, it probably is
- Always consider the various sources of data leakage
- If possible, get new samples for testing
- Be skeptical!

> Example: a super basic MNIST image classifier

## Adding robustness
- It's not always possible to get more data, but we can **augment** what we have
- Images are of the same object even with:
    - Geometric transforms -- flips, rotations, scaling
    - Point operations -- brighter/darker/colour shift
    - Filtering -- Noise, JPEG compression, blurring
- Computer vision libraries like [torchvision](https://docs.pytorch.org/vision/main/generated/torchvision.transforms.AutoAugment.html) can turn 1 training image into 50

> [!TIP] 
> Make sure that the augmentation makes sense for your context

## Augmentation continued
- Typically only used for training data
- Initially, augmentation may make the performance metrics **worse**
- Not just for images! Audio signals can have noise added, pitch modulation, tempo changes, compression, resampling, etc
- Tabular data is trickier, but [not](https://link.springer.com/chapter/10.1007/978-3-031-21753-1_11) [impossible](https://arxiv.org/abs/2407.21523), particularly with generative AI

## Main takeaways
- Data labels are in a mishmash of formats, and you will likely have to write some kind of parser at some point in your career
- Labelling data is a painful manual process, somewhat assisted by AI tools
- More data = more generalizability, sometimes it helps to invent some
- Above all, **be critical** of your results! Garbage in = garbage out.

## The rest of the course
- Assignment 3: due Friday (ish, with the usual weekend leniency)
- Monday: Easter, no lab
- Next week: Assignment presentations + review
- Monday, April 13: come to the lab and stuff your H drive before the exam

> Home stretch!