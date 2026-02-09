---
title: "Assignment 2: Preprocessing Pipelines"
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

Due February 24, 2026 (end of day). Reasonable requests for extensions will be granted. This is, awkwardly, only 2 days before the midterm. I will put a component of this assignment on the lab component of the midterm (March 9), so timely submissions will ensure I can give you feedback before then.

You may work in groups up to 3. Click [here](https://classroom.github.com/a/w7SFuWc_) to create your groups on GitHub Classroom and clone the starter repository, which should have a csv containing the data and the usual .gitignore file.

I encourage you to talk things through as you try different things. If you talk with classmates from a different group, **cite their contribution**. Similarly, if you use a web resource, add a link in the code - this is both polite, and a good habit to develop.

## The problem
Real-world data is messy, and does not fit the assumptions made by many models. Features may relate to each other in various ways, and data entry errors may result in outliers or missing values. Sometimes what you really care about is better represented as an aggregate value, or a combination of two features. Finally, irrelevant features may actually impact model performance, both in terms of evaluation metrics and efficiency. There is always a tradeoff between model size and performance; in this assignment, you should be aiming to find a good balance.

Your task in this assignment is to provide a complete pipeline that:
- Preprocesses the data
- Feeds the data into an [`SGDRegressor`](https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.SGDRegressor.html) with `penalty=None`
- Evaluates performance with [`cross_val_score`](https://scikit-learn.org/stable/modules/generated/sklearn.model_selection.cross_val_score.html)
- Iterates until you have obtained a reasonable balance between number of features and prediction performance

> [!INFO]
> The focus of this assignment is the data preparation, not the model. However, a model is needed to determine whether a particular preprocessing choice worked or not. To focus on the preparation step, **do not modify the model parameters** - just create a `SGDRegressor(penalty=None)` and use it as-is. We're setting `penalty=None` to remove regularization, which helps to mitigate the need for preprocessing

This time around, I've provided a much simpler dataset that does not require any API calls or fancy joins. However, if you would like to continue with the traffic data from assignment 1, or choose a different dataset, that is also okay. The main focus of this assignment is on **encoding, transforming, combining, or otherwise processing** features for use with a **regression model**.

The provided dataset on [fuel consumption](https://open.canada.ca/data/en/dataset/98f1a129-f628-4ce4-b24d-6f16bf24dd64) by vehicle make and model comes from Canada's open data portal. The complete dataset contains extra features that make the problem "too easy", so I've done some basic filtering to remove those features, as well as done a test/train split. I am providing you with the **training data only**, but I'll give you the test data after you submit.

Loading the csv and inspecting with `pandas.info()` should yield the following:

```
<class 'pandas.core.frame.DataFrame'>
RangeIndex: 9032 entries, 0 to 9031
Data columns (total 10 columns):
 #   Column               Non-Null Count  Dtype  
---  ------               --------------  -----  
 0   Model year           9032 non-null   int64  
 1   Make                 9032 non-null   object 
 2   Model                9032 non-null   object 
 3   Vehicle class        9032 non-null   object 
 4   Engine size (L)      9032 non-null   float64
 5   Cylinders            9032 non-null   int64  
 6   Transmission         9032 non-null   object 
 7   Fuel type            9032 non-null   object 
 8   Combined (L/100 km)  9032 non-null   float64
 9   Smog rating          7219 non-null   float64
dtypes: float64(3), int64(2), object(5)
memory usage: 705.8+ KB
```

> Sorry for another vehicle-themed dataset... I was actually looking for something about greenhouse gas emissions but found this one to be well-behaved.

## Deliverables
Once again, please prepare (in your GitHub repository):
- A **working document** that includes your various experiments and observations, including those that did not produce useful results
- An **executive summary** in PDF, Markdown, or HTML format, describing your final pipeline and justifications. Please include a diagram of your final pipeline, such as that displayed by Scikit-learn (a screenshot of the HTML output is fine).

In this case, the research question (if working with the vehicle emissions dataset) is "Can we predict the reported fuel consumption of a vehicle?". We'll pretend that this model will be used by the Canadian government to establish expected trends in fuel consumption in order to flag indicators of fraud, such as in the [Volkswagen emissions scandal](https://en.wikipedia.org/wiki/Volkswagen_emissions_scandal).

If you would like to work with the dataset from assignment 1 or a different real-world dataset, please also state your research question in your executive summary.

### Working document
Your working document can be messy, and should be well-commented to explain *why* you are taking actions. It should include the following:

1. **Data Exploration**: You will need to do some more data exploration for this assignment, and in fact, you will find it is the first step of pretty much any data project. In general, follow the question/answer guidelines from assignment 1; however, you do not need to split the data, as I have already reserved a test set and am asking that you use cross-validation. The main goal of your data exploration is to examine the data and determine what processing might be needed by looking for potential missing or illogical values, nonlinear relationships, number of categories, etc.

2. **Initial Pipeline**: After data exploration, build a first "educated guess" pipeline to preprocess the data and train an `SGDRegressor` with `penalty=None`. Then, use 5-fold `cross_val_score` to see how it did.

3. **Iterate**: Your first attempt provides a sort of baseline from which you can try to improve. Consider:
    - Handling missing features or outliers
    - Encoding categorical data
    - Numeric data transformations
    - Checking for interaction effects and includes appropriate engineered features (if any)
    - Selecting only the features necessary to achieve good performance

Whenever you make a change, **document your motivations and justifications** with a comment. Your goal is to find the set of features that balance model complexity with performance. To reach this point, it will likely be necessary to produce some intermediate attempts that are substantially worse than your baseline, and that's okay.

How many iterations is up to you, but don't go too crazy - around 5-10 seems like a reasonable number for the vehicle emissions dataset, provided you are making informed and intentional changes.

### Executive Summary
In your 1-2 page summary document, include the following:
- Your group name and the names of group members
- A diagram showing your final processing pipeline
- A brief description of some of the experiments you made, highlighting something that unexpectedly made things better or worse

## Submission
Commit changes and `push` your exploration document and executive summary to your GitHub repository. Make sure to include **rendered outputs** in your notebook so that I can see the visualizations without needing to run your code.

You may commit and push as often as you like (and in fact, regular commits are a good idea!). I will only evaluate the last one committed before the deadline.

## Marking Scheme
Each of the following components will be marked on a 4-point scale and weighted.

| Component                                                              | Weight |
| ---------------------------------------------------------------------- | ------ |
| Pipeline development process, observations, comments                   | 40%    |
| Final preprocessing decisions and justifications                       | 30%    |
| Executive summary                                                      | 20%    |
| Citations, overall coherency                                           | 10%    |

<br />

| Score | Description                                                            |
| ----- | ---------------------------------------------------------------------- |
| 4     | Excellent - thoughtful and creative without any errors or omissions    |
| 3     | Pretty good, but with minor errors or omissions                        |
| 2     | Mostly complete, but with major errors or omissions, lacking in detail |
| 1     | A minimal effort was made, incomplete or incorrect                     |
| 0     | No effort was made, or the submission is plagiarized                   |