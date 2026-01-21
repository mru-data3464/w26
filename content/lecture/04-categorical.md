---
title: "4: Categorical data"
date: 2026-01-20
marp: true
theme: marp-mru
paginate: true
headingDivider: 2
layout: lecture
toc: true
code: 04_categorical
leftoff: []
---

<!-- 
_class: title_slide
_paginate: skip
-->

{{< katex />}}
{{% ignore %}}

## <!--fit-->DATA 3464: Fundamentals of Data Processing
### <!--fit-->Categorical Data

Charlotte Curtis
January 22, 2026

{{% /ignore %}}


## Topic overview
- Exploring categorical data
- Dealing with missing values
- Categorical data encoding strategies

**Resources used:**
- [Feature Engineering Chapter 5](http://www.feat.engineering/encoding-categorical-predictors)

## Exploring categorical data
- `pandas.DataFrame.value_counts()` - how many of each category?
- Use category to group, then compute summary stats
- Plot color per category
- Scatter plot with jitter

## What is categorical data?
- Samples can take on one of several discrete values or groups
    - **Nominal**: no particular order to the groups
    - **Ordinal**: groups relate to each other in a specific order
- Categories can be represented as strings *or* numeric types
    - Domain knowledge is necessary!

> Let's take a few minutes to brainstorm some examples

## Representing categorical data
- Tree-based models can handle string-based categories as-is
- Most other models need numbers
- Consider:
    - Ordinal or nominal?
    - How many possible categories?
    - Any chance new ones might show up?

> How could we encode the examples?

## Ordinal encoding

<!-- _class: code_reminder -->

![bg left fit](https://cwfis.cfs.nrcan.gc.ca/data/maps/fwi_fbp/2026/sf/fdr20260119.png)

  | Category  | Feature |
  | --------- | ------- |
  | Nil       | 0       |
  | Low       | 1       |
  | Moderate  | 2       |
  | High      | 3       |
  | Very High | 4       |
  | Extreme   | 5       |

<footer>Image source: <a href="https://cwfis.cfs.nrcan.gc.ca/maps/fw">Natural Resources Canada</a></footer>

## Nominal categories: one-hot encoding
- Categories have no natural relationship
- Create $k$ new features from $k$ categories, very sparse matrix

<div class="centred">

| Animal |     | cat | dog | rabbit |
| ------ | --- | --- | --- | ------ |
| cat    | →   | 1   | 0   | 0      |
| dog    | →   | 0   | 1   | 0      |
| rabbit | →   | 0   | 0   | 1      |

</div>

> What kinds of problems could occur with this encoding scheme?

<!-- 
- Too many features -> feature hashing, combining categories
- Collinearity -> dummy encoding instead with drop
- Novel features -> introduce "other" category
-->

## Another approach: target encoding
- Basic concept: replace the category with the mean of the target
- Essential to avoid data leakage!
- Example: predicting weight of animal

<div class="centred">

| Animal |     | mean_kg |
| ------ | --- | ------- |
| cat    | →   | 4.1     |
| dog    | →   | 15.4    |
| rabbit | →   | 2.2     |

</div>


## Getting fancy
- Feature hashing or the "hash trick"
- Good if you have too many categories, or combinations of categories
- Converts each category into a fixed-length feature vector

<div class="centred">

| Animal |     | A_0 | A_1 | A_2 | ... | A_16 |
| ------ | --- | --- | --- | --- | --- | ---- |
| cat    | →   | 1   | 0   | 0   | ... | 1    |
| dog    | →   | 0   | 1   | 0   | ... | 1    |
| rabbit | →   | 1   | 0   | 1   | ... | 0    |

</div>

## Missing values in categorical data