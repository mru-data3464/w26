---
title: "Week 2a: Basic machine learning models"
date: 2026-01-13
marp: true
theme: marp-mru
paginate: true
headingDivider: 2
math: true
layout: lecture
code: 02a_models
---

<!-- 
_class: title_slide
_paginate: skip
-->

{{< katex />}}
{{% ignore %}}

# <!--fit-->DATA 3464: Fundamentals of Data Processing
### <!--fit-->Basic machine learning models

Charlotte Curtis
January 13, 2026

{{% /ignore %}}

## This week's topics
- Some common machine learning tasks and models
- Evaluating model performance
- Limitations and assumptions

**Resources used**:
- [Feature Engineering Chapter 1](http://www.feat.engineering/important-concepts)
- Introduction to Machine Learning with Python. Available at <a href="https://librarysearch.mtroyal.ca/permalink/01MTROYAL_INST/1qa1aqk/cdi_overdrive_books_ODN0002976888">MRU Library</a>
- [Scikit-learn User Guide](https://scikit-learn.org/stable/user_guide.html)
- Hands on Machine Learning with Scikit-Learn and Tensorflow/PyTorch. Available at [MRU Library](https://ebookcentral.proquest.com/lib/mtroyal-ebooks/detail.action?docID=30168989)

## Machine learning
- To appropriately process the data, we need to know *why* we are doing it and what assumptions we're making
- Modern machine learning toolkits (such as [scikit-learn](https://scikit-learn.org/stable/)) are so easy to use, they're easy to use [inappropriately](https://www.cell.com/patterns/fulltext/S2666-3899(23)00159-9)
- Goal: just enough understanding to use basic models **responsibly**

## Why are we processing data?
![](../../static/img/02-model-selection.svg)
- No reinforcement learning in this course, sorry

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
- K-means clustering
- Principle component analysis

</div>
</div>


<footer>Source: Müller, A. C., & Guido, S. (2016). Introduction to Machine Learning with Python. O’Reilly Media, Incorporated. Available at <a href="https://librarysearch.mtroyal.ca/permalink/01MTROYAL_INST/1qa1aqk/cdi_overdrive_books_ODN0002976888">MRU Library</a>.</footer>

## No free lunch
- A theory-heavy [paper](https://doi.org/10.1162/neco.1996.8.7.1341) in 1996 showed that there is no one machine learning algorithm that excels in all situations
- Subsequent work has confirmed this, e.g. a [2018 analysis](https://pmc.ncbi.nlm.nih.gov/articles/PMC5890912/)
- Tree-based methods, particularly **gradient boosted trees** *tend* to outperform other algorithms the most, but still have limitations
- What does it mean to "outperform"?

<footer>Further reading: http://www.feat.engineering/important-concepts#no-free-lunch</footer>


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

## Classification model: Support Vector Classifier

<div class="columns">

![](../../static/img/02-SVC_example.png)

- Linear model that finds vector(s) to best separate classes
- "Kernel trick" allows for nonlinear boundaries
- Check out the [SVM Appendix](https://ageron.github.io/homlp/HOMLP_Appendix_C.pdf) of *Hands-on Machine Learning* by Aurélien Geron for more info

</div>
<footer>Image from <a href="https://scikit-learn.org/stable/modules/svm.html#svm-classification">Scikit-learn documentation</a></footer.>


## Classification Model: Decision Trees
- Family of models including:
  - decision trees
  - random forests
  - gradient boosted decision trees
- Finds thresholds for features that best separates classes
- Controllable through depth parameter

## Model evaluation: regression
<!-- 
  _class: code_reminder
-->
For a predicted $\hat{\mathbf{y}}$ and actual $\mathbf{y}$, metrics include:
- Mean squared error: $MSE = \frac{1}{n}\sum_{i=1}^n (y_i - \hat{y}_i)^2$
- Root mean squared error: $RMSE = \sqrt{MSE}$
- Mean absolute error: $MAE = \frac{1}{n}\sum_{i=1}^n |y_i - \hat{y}_i|$
- Mean absolute percentage error: $MAPE = \frac{100}{n}\sum_{i=1}^n \left|\frac{y_i - \hat{y}_i}{y_i}\right|$
- Coefficient of determination: $R^2 = 1 - \dfrac{\sum_{i=1}^n (y_i - \hat{y}_i)^2}{\sum_{i=1}^n (y_i - \bar{y})^2}$
  ($R^2$ has some [caveats](http://www.feat.engineering/measuring-performance))


## Regression: ordinary least squares

<!-- 
_class: code_reminder
 -->

- In 1D, estimate modeled as:  $\hat{y_i} = wx_i + b$, where $i$ denotes a sample
- Vector form: $\mathbf{\hat{y}} = w\mathbf{x} + b$
- Goal is to minimize the **Mean Square Error**:

  $$\begin{aligned}
  MSE &= \frac{1}{m} \sum_{i=1}^m (\hat{y} - y_i)^2 = \frac{1}{m} \sum_{i=1}^m (b + w x_i - y_i)^2\\
  MSE &= \frac{1}{m} (\hat{\mathbf{y}} - \mathbf{y})^T (\hat{\mathbf{y}} - \mathbf{y})
  \end{aligned}$$

## Regression: N-dimensional
- Most of the time we have $N > 1$ **features**
- N-D: $\hat{y_i} = w_1x_{1i} + w_2x_{2i} + ... + w_nx_{ni} + b$
- Common to use a **design matrix** $\mathbf{X}$ to represent the feature values:

  $$\mathbf{X} = \begin{bmatrix} 1 & x_{11} & x_{12} & \cdots & x_{1n} \\ 
   1 & x_{21} & x_{22} & \cdots & x_{2n} \\ \vdots & \vdots & \ddots & \vdots \\ 
  1 & x_{m1} & x_{m2} & \cdots & x_{mn} \end{bmatrix}$$

  where each row is an instance (sample) and each column is a feature.

## Regression: N-dimensional
- We can rewrite the estimate in matrix notation:
    $$\hat{\mathbf{y}} = \mathbf{X} \mathbf{\theta}$$

- The MSE can be written as:

    $$MSE = \frac{1}{m}\sum_{i=1}^m (\hat{y}_i - y_i)^2 = \frac{1}{m} (\mathbf{X} \mathbf{\theta} - \mathbf{y})^T (\mathbf{X} \mathbf{\theta} - \mathbf{y})$$
- This has a closed form solution, but it is computationally expensive

## Regression: Decision trees

<!-- _class: code_reminder -->

![center h:400px](../../static/img/02-tree_regression.png)

<span style="font-size:0.8em; text-align: center;">Figure 2-32. Comparison of predictions made by a linear model and predictions made by a regression tree on the RAM price data. Source: Introduction to Machine Learning with Python</span>

## Comparison of model families

<div class="columns" style="font-size:0.9em;">
<div>

### Linear models

<span class="pro">

- Very fast, particularly inference
- Scalable to large number of features
- Can model nonlinearity with kernel trick
- Easy to regularize

</span>
<span class="con">

- Difficult to interpret
- Sensitive to parameters and preprocessing
- Data needs to be on same scale
- Slow to train on large datasets

</span>
</div>
<div>

### Decision Trees

<span class="pro">

- Highly explainable
- Fast to train
- Few parameters to tune
- Little preprocessing needed
- Provides feature importance

</span>
<span class="con">

- Prone to overfitting
- High variance
- Poor extrapolation

</span>

</div>
</div>

## Next up
- Exploring and understanding your data
- Splitting your data
  - Repeatability considerations
  - Stratified sampling
- Assignment 1: Exploring Calgary traffic data