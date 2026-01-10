---
title: "Week 2: Exploratory data analysis"
date: 2026-01-13
marp: true
theme: marp-mru
paginate: true
headingDivider: 2
math: true
layout: lecture
code: 02_exploring
---

<!-- 
_class: title_slide
_paginate: skip
-->

{{< katex />}}
{{% ignore %}}

# <!--fit-->DATA 3464: Fundamentals of Data Processing
### <!--fit-->Exploratory data analysis

Charlotte Curtis
January 13, 2026

{{% /ignore %}}

## This week's topics
- Basic machine learning models
- The importance of understanding your data
- Exploratory visualizations
- Splitting and sampling

## Machine learning
- To appropriately process the data, we need to know *why* we are doing it and what assumptions we're making
- Modern machine learning toolkits (such as [scikit-learn](https://scikit-learn.org/stable/)) are so easy to use, they're easy to use [inappropriately](https://www.cell.com/patterns/fulltext/S2666-3899(23)00159-9)
- Goal: just enough understanding to use basic models **responsibly**

## A selection of common models

<div class="columns">
<div>

### Supervised
- Linear/logistic regression
- Decision trees
- Support vector machines

</div>
<div>

### Unsupervised

</div>
</div>


<footer>Source: Müller, A. C., & Guido, S. (2016). Introduction to Machine Learning with Python. O’Reilly Media, Incorporated. Available at <a href="https://librarysearch.mtroyal.ca/permalink/01MTROYAL_INST/1qa1aqk/cdi_overdrive_books_ODN0002976888">MRU Library</a>.</footer>

## No free lunch

## Model evaluation: regression

## Model evaluation: Classification
- **True positive**: predicted positive, label was positive ($TP$) ✔️ 
- **True negative**: predicted negative, label was negative ($TN$) ✔️
- **False positive**: predicted positive, label was negative ($FP$) ❌ (type I)
- **False negative**: predicted negative, label was positive ($FN$) ❌ (type II)
- **Accuracy** is the fraction of correct predictions, given as:

    $$\mathrm{accuracy} = \frac{TP + TN}{TP + TN + FP + FN}$$

## Precision and recall
- **Precision**: Out of all the positive **predictions**, how many were correct?
  $$\mathrm{precision} = \frac{TP}{TP + FP}$$

- **Recall**: Out of all the positive **labels**, how many were correct?
  $$\mathrm{recall} = \frac{TP}{TP + FN}$$

- **Specificity**: Out of all the negative **labels**, how many were correct?
  $$\mathrm{specificity} = \frac{TN}{TN + FP}$$

## Confusion matrix

|                   | Predicted Positive | Predicted Negative |
| ----------------- | ------------------ | ------------------ |
| **True Positive** | TP                 | FN                 |
| **True Negative** | FP                 | TN                 |

- The axes might be reversed, but a good predictor will have strong diagonals
- There's also the **F1 score**, or harmonic mean of precision and recall:
    $$F1 = 2 \cdot \frac{\mathrm{precision} \cdot \mathrm{recall}}{\mathrm{precision} + \mathrm{recall}}$$

<footer>Check out the <a href="https://en.wikipedia.org/wiki/Confusion_matrix">Wikipedia page</a> for more ways of describing the same information</footer>

## ROC Curves
- The [receiver operating characteristic](https://en.wikipedia.org/wiki/Receiver_operating_characteristic) curve is a plot of the **true positive rate** (recall or sensitivity) vs. **false positive rate** (1 - specificity) as the detection threshold changes

- The diagonal is the same as random guessing
- A perfect classifier would hug the top left corner

<div>

> Fun fact: the name comes from WWII radar operators, where true positives were airplanes and false positives were noise

</div>