---
title: "Assignment 3: Dataset curation"
weight: 1
date: '2026-03-09'
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

Due April 3, 2026 (end of day). As usual, reasonable requests for extensions will be granted.

You may work in groups up to 3. Click [here](https://) to create your groups on GitHub Classroom and your empty repository.

I encourage you to talk things through as you try different things. If you talk with classmates from a different group, **cite their contribution**. Similarly, if you use a web resource, add a link in the code - this is both polite, and a good habit to develop.

## The problem
Thus far, we have worked with data at varying levels of "cleanliness" - whether from CSVs, database queries, or poorly encoded governmental PDFs. At this point, you have a pretty good sense of what a nice dataset to work with looks like, and what a not-so-nice one looks like. The goal of this assignment is to **create a dataset** that is appropriate for a supervised machine learning task.

This is an open-ended problem. You will:
- Decide on a research question
- Gather raw data that should be able to answer that question
- Organize the data and apply appropriate processing
- Label the data
- Create a [data card](https://arxiv.org/abs/2204.01075) summarizing your dataset
- **Data card**:

> [!IMPORTANT] Please do not choose a data source that contains sensitive information, including personal identifying information, proprietary data, or data subject to copyright. If successful, these datasets will contribute to an **open data repository** and may end up being used in further courses or projects.

### An example of an image dataset

- **Research question**: Can we distinguish between Calgary's native [Mountain Cottontail](https://en.wikipedia.org/wiki/Mountain_cottontail) rabbits and the now-feral [domestic rabbits](https://en.wikipedia.org/wiki/Domestic_rabbit) that live in our city?
- **Raw data**: photos of both kinds of rabbits in various settings
- **Organization and processing**: crop and resize images to a consistent dimension, place in subdirectories with the appropriate name
- **Label the data**: In this case, moving the images to a labelled subdirectory is also doing the labelling
- **Data card**: Summarize how the images were collected and processed, how many are in each category, who are the authors, the intended use of the dataset, a sample from each class, etc.

In this example, most of the work is likely to be in **gathering the data**. You don't need to take every photo yourself, and in fact it would be better to have a range of cameras, but please **do not generate data with AI**. I'd rather see a too-small but authentic dataset.