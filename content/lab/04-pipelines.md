---
title: "Lab 4: Numeric Data Transformations"
weight: 1
date: '2026-01-30T18:03:30-07:00'
draft: true
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
- Transforming numeric data
- Building preprocessing pipelines

Since you've already done a lot of painful wrangling in your first assignment to combine data into a useful tabular form, I've done this bit for you in this lab. We're also going to use the same (sort of) housing assessment data from [lab 2](/lab/02-fetch-and-explore), so the dataset should be familiar.

## Setup
Merge in the new pull request from your labs repo to get the starter code. This time you should be able to enter your credentials and hit go, and then it'll fetch the data and do some preliminary cleaning. In the end, you'll be left with a train/test/validation split of residential housing assessments with the following columns.

```python
df.info()
```
```
<class 'pandas.core.frame.DataFrame'>
Index: 487996 entries, 0 to 490511
Data columns (total 11 columns):
 #   Column                Non-Null Count   Dtype  
---  ------                --------------   -----  
 0   ADDRESS               487996 non-null  object 
 1   RE_ASSESSED_VALUE     487996 non-null  float64
 2   COMM_CODE             487996 non-null  object 
 3   COMM_NAME             487996 non-null  object 
 4   LAND_SIZE_SM          487996 non-null  float64
 5   SUB_PROPERTY_USE      487996 non-null  object 
 6   MULTIPOLYGON          487996 non-null  object 
 7   YEAR_OF_CONSTRUCTION  484288 non-null  float64
 8   PROPERTY_USE_DESC     480509 non-null  object 
 9   longitude             487996 non-null  float64
 10  latitude              487996 non-null  float64
dtypes: float64(5), object(6)
memory usage: 44.7+ MB
```

> [!INFO]
> I ran this on Friday, January 30th. The numbers may have been updated a little since then - this is why I chose to use the hashing method to split the dataset.

Some of these columns are redundant: `COMM_CODE` and `COMM_NAME` are the same information, with `COMM_NAME` just providing human-readable information. Similarly, `PROPERTY_USE_DESC` just explains what the `SUB_PROPERTY_USE` categories are. Some others, like the `MULTIPOLYGON` should probably be ignored entirely.

## Preprocessing applied
Feel free to read through and see the preprocessing done. I've tried to add comments to explain my decisions, but I didn't include the exploration that led to those decisions. This included things like inspecting duplicate addresses and missing assessment values, as well as looking at the `value_counts` of `SUB_PROPERTY_USE`.

In the end, there's a test/train/validation split applied, with `RE_ASSESSED_VALUE` assigned to the target `y` variable.

## Your task
Assume that we are going to use this data with some kind of **linear model** that benefits from having roughly **standard normal data**. This means you must build a preprocessing pipeline that:
- applies any necessary transformations to make the relationship between the feature and target more linear
- applies any necessary transformation to make the numeric features more normally distributed
- rescales the numeric features

As you've already seen, the land size doesn't make much sense for multi-unit buildings. This will probably benefit from considering **interaction effects** but can be ignored for now, just try to get the numeric features on the same scale and roughly normal. You can do this with scikit-learn pipelines, or by defining your own functions to compute the transforms - just make sure to calculate any parameters from the training set only.

If this is all the energy you have to do in this lab, you're done! Apply your transform to the validation set and plot the numeric features after your transformations to make sure it worked.

## Extras, if you like
Try preparing the data further by encoding the categorical predictors and combining the results with the numeric predictors. Next, try training a regression model (like plain old `LinearRegression`) to see if you can predict the assessment values.