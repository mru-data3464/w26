---
title: "Lab 2: Fetching and exploring data"
date: 2026-01-19
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
I've prepared a small exercise to work with City of Calgary data. This is relevant to your first assignment, and is an example of the widely-used [OAuth](https://en.wikipedia.org/wiki/OAuth) protocol. Admittedly, I only understand enough of this protocol to be somewhat dangerous.

## Setup
First, update your labs repo by opening it on GitHub and following the instructions in the readme file. This should result in the `lab02` folder with starter code being added. To download to your local machine, you may need to **commit all local changes** first and then run `git pull`.

## Configuring the City of Calgary API
The City of Calgary uses an API called [Socrata](https://dev.socrata.com) to serve data. The documentation is a bit scattered, but I found it the most straightforward to work with using the [Python API](https://github.com/afeld/sodapy). There are also APIs for [other languages](https://dev.socrata.com/libraries/).

Many data services use this system of API keys and app tokens. Their use is summarized in the table below:

| Item             | Description                                     |
| ---------------- | ----------------------------------------------- |
| API Key          | Identifier for the system, like a username      |
| API Secret       | Validates the API key, like a password          |
| App Token        | Identifies which app is sending the request     |
| App Token Secret | Used to validate the app token (on the backend) |

Create your own credentials by doing the following:

1. Create an account at https://data.calgary.ca/profile/edit/developer_settings. I use the Calgary myID option -- you might already have an account for other city services like transit passes, animal licenses, library cards, etc.
2. Create a new API key. The name is only to help you keep track of API keys, so it doesn't need to be unique or special.
3. Save the generated API secret somewhere - this is only shown to you once! If you lose it, not a big deal, just generate a new key.
4. Create a new app token. Again, this name can be whatever you like.
5. Finally, install the Python package with `pip install sodapy`

You now have the power to query datasets from [data.calgary.ca](https://data.calgary.ca)!

## Fetch the Calgary Property Assessment value
I somewhat arbitrarily picked [Current Year Property Assessments](https://data.calgary.ca/Government/Current-Year-Property-Assessments-Parcel-/4bsw-nn7w/about_data) as an example to explore. This is a fairly large dataset, so we don't want to just download a CSV. To get a sense of what this contains, try exploring it on the website first.

When you're ready to look at it in Python, open `fetch_and_split.ipynb` and:

1. Fill in the variables for api key and app token. The secret is defined as an input so that it doesn't get committed to your repository.
    > [!CAUTION]
    > Never store OAuth secrets as plain text or commit them to a repository. In this case it's probably not a big deal, but it's good to be in the habit of keeping things (relatively) secure.
2. Populate the `ds_code` variable with the id string for the dataset. This is the string of random characters in the URL (in this case `4bsw-nn7w`)
3. Fetch some data and do some preliminary inspection. You'll probably need to make sure the data types are actually numeric.
4. Explore the data! I've left some suggestions in the comments of the notebook.
   > [!TIP]
   > You might want to start with a small sample of the data (by default `limit=1000` is passed), then decide which columns are actually necessary and what categories you want to look at. For example, you might want to restrict it to certain categories of properties, and not fetch things like the `fl_assessed_value` feature (farmland assessed value)

## Submit
I'm not going to make you write up a report this time, but please push your notebook to GitHub for your completion-based lab mark.