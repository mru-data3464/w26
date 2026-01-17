---
title: "4: Categorical data"
date: 2026-01-20
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
### <!--fit--><< Long form title >>

Charlotte Curtis
January 20, 2026

{{% /ignore %}}


## Topic overview
- Exploring categorical data
- Dealing with missing values
- Categorical data encoding strategies

**Resources used:**
- [Feature Engineering Chapter 5](http://www.feat.engineering/encoding-categorical-predictors)

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
