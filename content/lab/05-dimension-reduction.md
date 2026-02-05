---
title: "Lab 5: Dimensionality Reduction"
weight: 1
date: '2026-02-09'
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
# bookHref: ''
---

# {{< param "title" >}}

## Objective
Learn a bit about:
- Dimensionality reduction
- The differences between PCA and LDA

## Setup
Update your labs repo through the usual method. There is one starter notebook that just fetches the dataset and has some guiding `TODO` comments.

## The dataset
For the purposes of this exercise, we'll use another well-behaved dataset: the [Winsconsin Breast Cancer Diagnostics](https://archive.ics.uci.edu/dataset/17/breast+cancer+wisconsin+diagnostic) dataset. This has a set of 30 measurements taken from images of histology slides of breast mass biopsies (the features) that can be used to predict whether the mass is benign (0) or malignant (1). You can read the original paper [here](https://minds.wisconsin.edu/bitstream/handle/1793/59692/TR1131.pdf;jsessionid=9CE7F71509ADFACCE36BBE2F8E499E42?sequence=1) if you're into that sort of thing.

The dataset is fairly small, but that makes it easy to visualize. There are no missing values.

## Your task
Before performing dimensionality reduction, try exploring the dataset as is. Can you see which features are important for predicting malignancy?

Next, do the following (the [demo notebook](https://github.com/mru-data3464/w26/blob/main/demo_code/05_numeric/plot_pca_iris.ipynb) from class may be useful):
- Split your data into train/test, as usual
- Rescale, computing standardization parameters from the training data and applying to both train/test
- Transform your training set into its principle components using `sklearn.decomposition.PCA`
- Visualize the first two principle components. Do these help with class separation?
- Which features contribute the most to the first principle component?

Finally, try looking at the result from [Linear Discriminant Analysis](https://scikit-learn.org/stable/modules/generated/sklearn.discriminant_analysis.LinearDiscriminantAnalysis.html#sklearn.discriminant_analysis.LinearDiscriminantAnalysis). In this case, the transformed data will be a single vector as there is only one line between the two classes.
- Does the LDA transformation result in separation between classes? I found a histogram to be most useful to look at this
- Which features contribute the most to the LDA vector?
- Transform your test set using LDA and redo the histogram visualization. Are the test classes well-separated?

## Submit
Don't forget to push your changes! I've been fairly loose with the "finish by 1 week" threshold, my main goal is to get you to engage with the task. If you don't get through all the tasks, that's okay too.