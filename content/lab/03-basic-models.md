---
title: "Lab 3: Basic supervised models"
date: 2026-01-26
# weight: 1
# bookFlatSection: false
bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
# bookHref: ''
---

# {{< param "title" >}}

## Objective
Learn a bit about:
- Different processing needs for different model types
- The need for validation data
- The overall iterative workflow of making predictions from data

As we haven't yet talked about feature engineering and numeric data transformations, the focus will be on the categorical data.

## Setup
Eventually I'm going to stop posting this, but just like last week, update your labs repo by opening it on GitHub and following the instructions in the readme file. This should result in the `lab03` folder with two csvs being added. To download to your local machine, you may need to **commit all local changes** first and then run `git pull`.

## Predicting Titanic survivorship
Consider this a "Hello, world!" of supervised learning! We already did a bit of EDA on [the Titanic dataset](https://www.kaggle.com/competitions/titanic/overview) during class, so you don't need to do *too* much more, but it's probably a good idea to poke around a bit until you're confident you understand what you're working with.

1. Load the `train.csv` data (ignore `test.csv` for now). The test data doesn't have a truth value, so if you want to know the final performance of your model, you'll need to submit it to Kaggle.
2. Do a bit more EDA, at least enough to understand:
    1. What do each of the features mean?
    2. How do you think the categorical data should be encoded?
    3. Should any of the numeric columns be discretized?