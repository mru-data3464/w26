---
title: "Week 1: Introduction"
date: 2026-01-06
marp: true
theme: marp-mru
paginate: true
headingDivider: 2
math: true
layout: lecture
code: 01_stroke
---

<!-- 
_class: title_slide
_paginate: skip
-->

{{% ignore %}}

# <!--fit-->DATA 3464: Fundamentals of Data Processing
### <!--fit-->Intro to the course

Charlotte Curtis
January 6, 2026

{{% /ignore %}}

## Meet your instructor

![bg right flavour](../../static/img/charlotte.jpg)

**Name:** Charlotte Curtis

**Pronouns:** She/her

**Office:** B102-4

**Email:** ccurtis@mtroyal.ca

**Office hours:** [Book here](https://calendar.google.com/calendar/u/0/appointments/AcZssZ1DErlRJ8cNGFn27y-fiFzPEXgDKu8r7LXkGOY=)

## My Background
![center w:900px flavour](../../static/img/charlotte-timeline.svg)

## Another new class!
> [!NOTE]
> This course introduces techniques for ethically and responsibly **wrangling** and manipulating datasets to make them appropriate for addressing the question at hand. Topics may include cleaning and transforming data, integrity and quality measures, common file formats, feature selection and engineering, and generating features from unstructured sources such as text and images.

## Grade Assessment

<div class="columns">

| Component          | Weight  |
| ------------------ | ------- |
| Tutorial exercises | 10%     |
| Assignments        | 30%     |
| Midterm exam       | 25%     |
| Final exam         | 35%     |

Bonus marks may be awarded for *substantial* corrections to materials, submitted as pull requests

</div>

**Source repo**: https://github.com/mru-data3464/w26

**Rendered at**: https://mru-data3464.github.io/w26

## Textbook(s)
![bg right:40% 50%](https://images.routledge.com/common/jackets/amazon/978103209/9781032090856.jpg)

- http://www.feat.engineering/
- Additional texts/websites as needed
- All the documentation!
    - [Pandas](https://pandas.pydata.org/docs/)
    - [Numpy](https://numpy.org/doc/stable/)
    - [SciPy](https://scipy.github.io/devdocs/)
    - [Matplotlib](https://matplotlib.org/stable/users/index.html)
- ... or the [R tidyverse](https://tidyverse.org/)

> [!TIP]
> Don't just rely on AI summaries!

## Speaking of AI...
In this course (and others, and your career), you will need to know:
- **What** to do, and **why**
- **How** to do it

(also when and who) 

<div data-marpit-fragment>

> [!NOTE]
> Which of these things seem appropriate for AI assistance?

</div>

## The plan - before Reading Week

| Week | Topic                                  | Chapter (ish) |
| ---- | -------------------------------------- | ------------- |
| 1    | Review and overview                    | 1-2           |
| 2    | Exploring data, sampling, splitting    | 3-4           |
| 3    | Representing categorical data          | 5             |
| 4    | Numeric transformations, dimensionality reduction | 6             |
| 5    | Dealing with missing values            | 7-8           |
| 6    | Feature selection                      | 10            |


## The plan - after Reading Week

| Week | Topic                                |
| ---- | ------------------------------------ |
| 7    | Midterm                              |
| 8    | Extracting data from text            |
| 9    | Image representation and processing  |
| 10   | Data labelling and augmentation      |
| 11   | Processing pipelines                 |
| 12   | Supervised and unsupervised learning |
| 13   | Project presentations, buffer time   |


## Core courses so far
<div style="background: white;">

![flowchart](../../static/img/01-program.svg)

</div>

## What do you know about...
* Various probability distributions
* Linear and logistic regression
* Data quality measures
* Data stewardship best practices
* Document parsing, web scraping, audio/video feature detection
* Linear algebra and array programming
* Prediction tasks: classification and regression
* Clustering and anomaly detection
* Evaluation metrics
* Basic data visualization (scatter plots, histograms, etc)

## What do you want to know about?

<div class="columns" style="font-size: 0.9em">
<div>

### Examples of Subject Matter
- Finance
- Real estate
- Transportation
- Climate
- Politics
- Biology
- Chemistry
- Malware

</div>
<div>

### Examples of Data types
- Unstructured text
- Structured text (e.g. csv, HTML)
- PDF
- Word documents
- Images
- Audio
- Video

</div>
</div>

## Case study: risk of ischemic stroke

<div class="columns">
<div style="font-size:0.95em">

![](../../static/img/stroke-vascuCAPpic-1.svg)

Chapter 2: http://www.feat.engineering/stroke-tour

</div>
<div>

* Arterial stenosis can predict risk
* Plaque composition plays a role
* Features extracted from CT images
* Other risk factors (demographics, lifestyle) added to dataset

</div>
</div>

>[!NOTE]
>Many decisions in the data analysis process are subjective - I will often make different decisions than the textbook

## From data to prediction

1. Understand the problem and define the task
2. Collect, anonymize and organize the data
3. Extract features
4. Explore the dataset
5. Select a model and preprocess
6. Train the model
7. Evaluate, fine-tune, iterate
8. Deploy and maintain your system

<footer>Adapted from Aurélien Géron's <a href="https://github.com/ageron/handson-mlp/blob/main/ml-project-checklist.md">ML Project Checklist</a></footer>

<!-- 
Note: these might be better at a later date

## Discussion questions
* When (and why) should we reserve a test set?
* Why are random number seeds useful?
* What is stratified sampling, and when should it be used?
* What does it mean for features to be correlated? -->


## Applied to the stroke example
1. What is the problem? What do we need to do?
2. (Collect, anonymize and organize the data) - Done for us
3. (Extract features) - Done for us
4. **Explore the dataset**
    - A critically important component, DO NOT OFFLOAD TO AI
    - This can even be where the data sciencing stops and we jump straight to visualizations and communicating insights!
    - Check out [Data for Good case studies](https://dataforgood.ca/case-studies/)


## 5. Select a model and preprocess
![center h:500px](../../static/img/01-ml_map.svg)

<footer>Source: <a href="https://scikit-learn.org/stable/machine_learning_map.html">scikit-learn documentation</a></footer>

<!-- 
_class: code_reminder
-->

## 7. Evaluate, fine-tune, and iterate
- In my example, I jumped straight to testing on the held-back test set
- This is a terrible idea! We have no confidence that the model actually worked. We could be:
    - overfitting to the training data
    - making incorrect assumptions about the data
    - applying inappropriate transformations, or missing some
    - using the wrong model altogether

> [!IMPORTANT]
> Validation needs to happen before the final testing

## Coming up next
- Lab: basic regression, show me where you're at
- Lectures: exploratory data analysis
    - Summary statistics
    - Basic visualizations
    - When and how to split your dataset