---
title: "7: Interaction effects"
date: 2026-02-12
marp: true
theme: marp-mru
paginate: true
headingDivider: 2
layout: lecture
toc: true
code: "07_interactions"
leftoff: []
---

<!-- 
_class: title_slide
_paginate: skip
-->

{{< katex />}}
{{% ignore %}}

## <!--fit-->DATA 3464: Fundamentals of Data Processing
### <!--fit-->Interaction Effects

Charlotte Curtis
February 12, 2026

{{% /ignore %}}

## Topic overview
- Definitions and description of interaction effects
- Detecting interaction effects
- Feature selection

**Resources used:**
- [Feature Engineering Chapter 7](http://www.feat.engineering/detecting-interaction-effects)
- [Feature Engineering Chapter 10](http://www.feat.engineering/selection)

## Definition

> Two or more predictors are said to interact if their combined effect is different (less or greater) than what we would expect if we were to add the impact of each of their effects when considered alone. -- Feature Engineering, Ch 7

- Interactions matter if they affect the *outcome*
- Features may have a relationship without having an interaction effect

> Example: Stroke data from week 1

## Mathematical representation
<!-- _class: code_reminder -->

A linear model is trying to fit:

$$\hat{y} = w_0 + w_1x_1 + w_2x_2 + \cdots + w_k x_k$$

To consider interaction effects, we add the **product** of features. For a model with only features $x_1$ and $x_2$:

$$\hat{y} = w_0 + w_1x_1 + w_2 x_2 + w_3x_1x_2$$

> This is similar to a **basis expansion** transformation that adds polynomial terms
> Scikit-learn's [PolynomialFeatures](https://scikit-learn.org/stable/modules/generated/sklearn.preprocessing.PolynomialFeatures.html#sklearn.preprocessing.PolynomialFeatures) module can do both at once

<footer>Note: common to use β or θ for the weights instead of w, especially in statistics</footer>