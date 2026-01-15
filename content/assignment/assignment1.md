---
title: "Assignment 1: Exploratory Data Analysis"
weight: 1
date: '2026-01-15'
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
# bookHref: ''
---

# {{< param "title" >}}

Due January 30, 2026 at 5 pm. Reasonable requests for extensions will be granted.

You may work in groups up to 3. Click [here](https://classroom.github.com/a/BC8a9Mj2) to create your groups on GitHub Classroom and clone the starter repository, which is pretty much empty aside from a `.gitignore` file. This should allow everyone in the group to make changes, but merge conflicts may occur, particularly if two people are editing the same file.

I encourage you to talk things through as you go through the data exploration process, as it is largely a creative endeavour full of "what ifs" that benefits from multiple perspectives. If you talk with classmates from a different group, **cite their contribution**. Similarly, if you use a web resource for a nifty visualization, add a link in the code - this is both polite, and a good habit to develop.

## The problem
In 2025, Calgary saw an increasing number of serious traffic incidents, particularly pedestrian fatalities. While this can be partially attributed to our [growing population](https://regionaldashboard.alberta.ca/region/calgary/population/#/?from=2020&to=2024), other cities such as Toronto have managed to [reverse the trend](https://www.cbc.ca/news/canada/calgary/pedestrian-death-lessons-9.7005522).

Your task is to combine and explore various City of Calgary traffic-related datasets to gain insights into traffic incidents. You may choose or change the focus of your exploration at any stage in this process, and your report should include a clear statement of the **research question** you are trying to answer. Examples might include (but are not limited to):
- What intersection type is associated with the highest number of pedestrian-involved incidents?
- What time of day are serious incidents more likely to occur?
- Is roadwork associated with subsequent collisions?

## The data
You will be working with the following datasets from https://data.calgary.ca:
- [Traffic incidents](https://data.calgary.ca/Transportation-Transit/Traffic-Incidents/35ra-9556/about_data)
    - Note that this dataset includes all kinds of traffic disruptions, from serious collisions to road maintenance closures. You will need to decide how to filter and interpret the data to find the information of interest.
- [Speed limits](https://data.calgary.ca/Health-and-Safety/Speed-Limits/2bwu-t32v/about_data)
- [Traffic signals](https://data.calgary.ca/Health-and-Safety/Traffic-Signals/qr97-4jvx/about_data)

In addition, integrate **one or more** of the following, or an additional **dataset of your choice**:
> ![IMPORTANT]
> **These are very large datasets!** Do not simply download the CSV and try to work with it that way. Either use the city's tools to filter and download a subset, or use the API endpoint to query specific ranges. In Monday's lab (January 19th) we'll look at fetching data through this API.
- [311 service requests](https://data.calgary.ca/Services-and-Amenities/311-Service-Requests/iahh-g8bj/about_data)
- [Traffic counts](https://data.calgary.ca/Transportation-Transit/Traffic-Counts-at-Permanent-stations/vuyp-sbjp/about_data) on arterial roads
- [Environment Canada Weather](https://climate.weather.gc.ca/historical_data/search_historic_data_e.html)

## Deliverables
Working in the language of your choice, prepare the following:
- A **data exploration document** combining code, graphs, and discussion. This can be a Jupyter notebook, RMarkdown, or even a PDF or HTML (just no Word documents or similar proprietary format, please).
- An **executive summary** in PDF, Markdown, or HTML format, containing key figures and findings.

### Data Exploration
> Please get creative! Poke at the data and see what happens. Many of your questions may lead nowhere, and that's okay! I'd like to see your process as you explore and develop insights.

In your data exploration document, do the following:
1. State your initial **research question** that you are hoping to answer. It's okay if this ends up changing or doesn't have a clear answer.
2. Load the data, either fetching directly from the City's API, or by downloading a separate CSV. Write a comment including the timestamp so there's a record of when the data was acquired.
3. Make sure the data types are correct! Sometimes things are loaded as strings when they should be numeric, and dates are their own thing entirely.
4. **Combine** the data sources in an appropriate way using your database skills. Pandas' `merge` and `join` behave like SQL joins. See 
5. Do some preliminary data exploration - just enough to get a sense of how to split the data
6. Split the data and **explain your choices**. For example
    - How will your splitting approach work when the dataset is updated?
    - Do you need to stratify?
    - Does your research question rely on treating the data as a time series?
7. Do some more EDA on the training data (ignoring your set-aside test set), referring to the lecture slides and resources for ideas on what kinds of questions to ask and visualizations to produce
    > [!TIP]
    > As you explore your data, keep track of your questions and observations, either as comments in the code cells or as separate Markdown cells. For example:
    >    ```python
    >    # Check for obvious relationships between numeric features
    >    numeric_features = df.select_dtypes(include=[np.number])
    >    scatter_matrix(numeric_features)
    >    ```
    >  ... [graph is displayed]
    >
    > Features A and B look like they might have a non-linear relationship, let's play with those some more.
    > ```python
    > # is it a second order polynomial?
    > plt.scatter(df["A"], df["B"]^^2)
    > ```
    > etc.
8. If, along the way, you see something interesting, you may want to update your research question. That's fine! At the end of your exploration (which honestly could go on forever, but I'd like to see at least 6 or so useful visualizations), **re-state your research question** that you would like to answer moving forward.

### Executive Summary
In your 1-2 page summary document, include the following:
- Your group name and the names of group members
- What was your initial and final research question(s) that you guided your exploration?
- Choose several key figures or statistics. Include them in your report and describe why you plotted them and what they say about the data.
- Write a "future work" section with a few sentences describing what you would do next with this dataset to follow up on the problem.

## Submission
Commit changes and `push` your exploration document and executive summary to your GitHub repository. Make sure to include **rendered outputs** in your notebook so that I can see the visualizations without needing to run your code.

You may commit and push as often as you like (and in fact, regular commits are a good idea!). I will only evaluate the last one committed before the deadline.

## Marking Scheme
Each of the following components will be marked on a 4-point scale and weighted.

| Component                                                              | Weight |
| ---------------------------------------------------------------------- | ------ |
| Exploratory questions, plots, and observations                         | 40%    |
| Effective combination of datasets, reproducibility, splitting strategy | 30%    |
| Executive summary and future work                                      | 20%    |
| Research question, citations, evidence of teamwork                     | 10%    |

<br />

| Score | Description                                                            |
| ----- | ---------------------------------------------------------------------- |
| 4     | Excellent - thoughtful and creative without any errors or omissions    |
| 3     | Pretty good, but with minor errors or omissions                        |
| 2     | Mostly complete, but with major errors or omissions, lacking in detail |
| 1     | A minimal effort was made, incomplete or incorrect                     |
| 0     | No effort was made, or the submission is plagiarized                   |