---
title: "Assignment 3: Dataset curation"
weight: 1
date: 2026-03-11
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
# bookHref: ''
---

# {{< param "title" >}}

Due April 2, 2026 (end of day). This is the day before Easter break; presentations are tentatively scheduled for the following Thursday (April 9). As usual, reasonable requests for extensions will be granted.

You may work in groups up to 3, and I strongly advise working in groups this time! Some of the work is just plain tedious. Click [here](https://classroom.github.com/a/4iTVhHea) to create your groups on GitHub Classroom and clone your mostly empty repository.

I encourage you to talk things through as you try different things. If you talk with classmates from a different group, **cite their contribution**. Similarly, if you use a web resource, add a link in the code - this is both polite, and a good habit to develop.

## The problem
Thus far, we have worked with data at varying levels of "cleanliness" - whether from CSVs, database queries, or poorly encoded governmental PDFs. At this point, you have a pretty good sense of what a nice dataset to work with looks like, and what a not-so-nice one looks like. The goal of this assignment is to **create a dataset** that is appropriate for a supervised machine learning task.

This is an open-ended problem. You will:
- Decide on a research question
- Gather raw data that should be able to answer that question
- Organize the data and apply appropriate processing
- Label the data
- Create a [data card](https://arxiv.org/abs/2204.01075) describing your dataset

> [!IMPORTANT] 
> Please do not choose a data source that contains sensitive information, such as personal identifying information, proprietary data, or data subject to copyright. These datasets will contribute to an **open data repository** and will end up being used in further courses or projects.

### An example of an image dataset

- **Research question**: Can we distinguish between Calgary's native [Mountain Cottontail](https://en.wikipedia.org/wiki/Mountain_cottontail) rabbits and the now-feral [domestic rabbits](https://en.wikipedia.org/wiki/Domestic_rabbit) that live in our city?
- **Raw data**: photos of both kinds of rabbits in various settings
- **Organization and processing**: crop and resize images to a consistent dimension, place in subdirectories with the appropriate name (e.g. `cottontail` and `domestic`)
- **Data labelling**: In this case, moving the images to a labelled subdirectory is also doing the labelling
- **Data card**: Summarize how the images were collected and processed, how many are in each category, who are the authors, the intended use of the dataset, a sample from each class, etc.

In this example, most of the work is likely to be in **gathering the data**. You don't need to take every photo yourself, and in fact it would be better to have a range of cameras, but please **do not generate data with AI**. I'd rather see a too-small but authentic dataset.

### An example of a text dataset
- **Research question**: Which political party does the most heckling in the House of Commons?
- **Raw data**: Debate transcripts downloaded as XML files from [ourcommons.ca](https://www.ourcommons.ca/en/open-data#ChamberDebates), limited to a reasonable time range (e.g. just the current legislative session)
- **Organization and processing**: scripts to download and parse the XML, find instances of heckling, export heckling info (date/sitting/who was interrupted/topic of discussion/etc) to CSV
- **Data Labelling**: Identify which party is doing the heckling and add a column with label to CSV
- **Data card**: Summarize how the data was collected and processed, who are the authors, what is the intended use, how many instances for each party, samples, etc

In this example, gathering the data is relatively straightforward. The challenge lies in understanding the XML, accurately finding the heckling, and identifying who is doing the heckling. Again, **do not use AI** to label your dataset. You may use AI to help you write the code to parse the file, but the parsing itself should be deterministic, and the usual rules around AI usage apply.

## Deliverables
The following deliverables should be included in your project repo.

### The dataset itself
This is the processed data in a format suited to the task, for example:
- CSV file containing features extracted from text
- Resized and cropped JPEG images stored in subdirectories named for class labels
- Larger images with JSON file describing annotations (e.g. in [COCO format](https://cocodataset.org/#format-data) as exported from https://www.cvat.ai/)

This should be feasible within GitHub's file size restrictions, but you can share a link to Google Drive instead if you really want to go big.

Depending on how you are collecting and labelling data, the scale of your dataset may vary. Features automatically extracted from text may number in the thousands, while manually annotated images may be limited to dozens. Generally speaking the bigger the better, but pay attention to dataset quality considerations such as:
- class balance
- label accuracy
- formatting consistency

If you have any questions about whether your dataset or processing plan is appropriate, just ask!

### The data card
Data cards are a structured way of documenting datasets. You can go a little [overboard](https://sites.research.google/datacardsplaybook/) with these, but I've included a markdown file in your repo based on the [Hugging Face](https://huggingface.co/docs/hub/datasets-cards) template. Fill in each item to the best of your abilities, and feel free to delete the ones marked `[optional]` if not relevant.

### Your processing code
However you choose to process your data, include your code in your repo. This can by Python or Bash scripts, notebooks, etc. No marks will be awarded for "I used an LLM to extract data".

### Presentation
Prepare an 8-10 minute presentation in the format of your choice (PDF, PPTX, Google Slides, etc) that includes the following information:
- A clear statement of your research question and dataset goals
- Examples of your data
- How you collected the data
- How you processed and labelled the data
- Which parts were the most challenging?
- What further work would you do if you had more time?

Your presentation slides also serve as the "executive summary" of your work.

## Marking Scheme
Each of the following components will be marked on a 4-point scale and weighted.

| Component                          | Weight |
| ---------------------------------- | ------ |
| Presentation (slides and delivery) | 20%    |
| Data card                          | 20%    |
| Processing code                    | 30%    |
| Dataset quality and usability      | 30%    |


<br />

| Score | Description                                                            |
| ----- | ---------------------------------------------------------------------- |
| 4     | Excellent - thoughtful and creative without any errors or omissions    |
| 3     | Pretty good, but with minor errors or omissions                        |
| 2     | Mostly complete, but with major errors or omissions, lacking in detail |
| 1     | A minimal effort was made, incomplete or incorrect                     |
| 0     | No effort was made, or the submission is plagiarized                   |