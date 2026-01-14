---
title: "Week 2b: Exploratory Data Analysis"
date: 2026-01-15
marp: true
theme: marp-mru
paginate: true
headingDivider: 2
math: true
layout: lecture
code: 02b_eda
---

<!-- 
_class: title_slide
_paginate: skip
-->

{{< katex />}}
{{% ignore %}}

# <!--fit-->DATA 3464: Fundamentals of Data Processing
### <!--fit-->Exploratory Data Analysis

Charlotte Curtis
January 15, 2026

{{% /ignore %}}

## This week's topics
- Exploratory data analysis: EDA
- Splitting your data
- Assignment 1: Exploring Calgary traffic data

**Resources used**:
- [Feat.Engineering Chapter 3](http://www.feat.engineering/review-predictive-modeling-process)


## Basic things to look at
- Data source - File? Database? API? 
- Structured/unstructured
- Assumption 1: relatively small (fits in memory) tabular dataset
  - Data types - numeric/categorical, text, other
  - Assumption 2: numeric data 
    - Ranges
    - Summary statistics
    - Missing values
- Next week: categorical data, after reading week unstructured

## Example: Anscombe's Quartet
<!-- _class: code_reminder -->
- Very small dataset, constructed by hand in 1973 by [Francis Anscombe](https://www.jstor.org/stable/2682899?seq=1)
![center h:375px](../../static/img/02-anscombe.png)
- Not known exactly how he made it, but Drs. Roberta La Haye and Peter Zizler proposed a [compelling argument](https://www.tandfonline.com/doi/full/10.1080/07468342.2024.2385078) for linear algebra

## Case Study: Data visualization to the rescue
* A [2012 study about honesty](https://www.pnas.org/doi/full/10.1073/pnas.1209746109) reported that "Signing at the beginning makes ethics salient and decreases dishonest self-reports in comparison to signing at the end"
* In 2020, the authors published a new paper admitting that their original results [could not be replicated](https://www.pnas.org/doi/abs/10.1073/pnas.1911695117), and noticed an anomaly in the **summary statistics**
* The 2020 paper also published the original data, which was downloaded and visualized by a team of anonymous researchers working with [Data Colada](https://datacolada.org/98)
* This led to the 2012 paper being retracted, a [$25M lawsuit](https://datacolada.org/116), a [data-driven defense](https://datacolada.org/118)

<div data-marpit-fragment>

> ![IMPORTANT]
> Moral of the story is, look at your data!

</div>

## Useful starting points
<!-- _class: code_reminder -->

Assuming your data is small enough and well structured:

- [`pandas.DataFrame.info`](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.info.html): data type, number of non-null, names, dimensions
- [`pandas.DataFrame.head`](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.head.html): return the first `n` rows (default 5)
- [`pandas.DataFrame.describe`](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.describe.html): Compute a bunch of summary statistics
- As soon as you have a general sense of the:
  - Data scales
  - Missing features
  - Distributions, particularly categorical
- It's time to split the data!

## Splitting your data - why

- We need to set aside a final **test set** to evaluate our final model
- Humans are great at detecting patterns!
- Even looking at test data could influence decisions, causing **data leakage**

## Splitting your data - how

<!-- _class: code_reminder -->

How much EDA before splitting? You might need to know:
- Are there any missing values?
- Is there a need for [stratified sampling](http://www.feat.engineering/data-splitting)?

## Types of exploratory visualizations
- I will not provide an exhaustive list of visualizations!
- Pandas provides a [handy wrapper](https://pandas.pydata.org/pandas-docs/stable/user_guide/visualization.html) around [matplotlib](https://matplotlib.org/)
- So does [Seaborn](https://seaborn.pydata.org/) - check out the [example gallery](https://seaborn.pydata.org/examples/index.html)
- Some of my favourites:
  - Histograms
  - Scatter plots/hexbin plots
  - Box plots/violin plots

## Some simple tricks
<!--
  _class: code_reminder 
-->

Try tweaking:

- Histogram bin sizes
  - Aiming for a smooth distribution that works for your data
- Transparency (`alpha`)
  - Useful for both dense scatter plots and overlapping categories
- "Jitter"
  - Mostly for scatter plot of continuous vs categorical data
  - Add a tiny bit of random noise to spread out samples

## Splitting your data
- Before getting too deep into exploration, we need to **set aside a test set**
