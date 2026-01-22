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
Consider this a "Hello, world!" of supervised learning! We already did a bit of EDA on the [Titanic dataset](https://www.kaggle.com/competitions/titanic/overview) during class, so you don't need to do *too* much more, but it's probably a good idea to poke around a bit until you're confident you understand what you're working with.

1. Create a new file (either a notebook or just .py file, your choice!) and load the `train.csv` data into a Pandas dataframe. The test data doesn't have a truth value, so if you want to know the final performance of your model, you'll need to submit it to Kaggle.
2. Do a bit more EDA, at least enough to understand:
    1. What do each of the features mean?
    2. How do you think the categorical data should be encoded?
    3. Should any of the numeric columns be discretized?
   > I find Jupyter notebooks easier to keep track of notes, but if you're using a regular Python script you can record your observations and plots in a separate document.
3. Decide if you want to do cross-validation, or split out a separate validation dataset. **Justify your choice with a comment.** If you're doing cross-validation, no need to split further at this time.
4. Using your domain knowledge and understanding of the dataset, select a few features to use as predictors for a **tree-based model**.
   > [!NOTE]
   > In my lecture on categorical data, I said that trees could natively handle string-based categories. While theoretically true, Scikit-learn needs numbers. Sorry!

5. Encode the categorical data with an appropriate method. You can either use Scikit-learn pipelines, or manually build a new dataframe with the categories encoded. This has a number of finicky options, so I've provided an example below:
   ```python
    # pick out the numeric features first
    tree_X = df[["Pclass", "Age", "SibSp", "Parch", "Fare"]].copy()

    # now encode the others
    # Pandas is a nice output format to have, but doesn't support Numpy's sparse matrix format.
    # I'm also choosing to drop the first category (dummy encoding) as I don't expect novel categories in test.
    one_hot = OneHotEncoder(sparse_output=False, drop="first").set_output(transform="pandas")
    tree_X = tree_X.join(one_hot.fit_transform(df[["Sex", "Embarked"]]))
    tree_X.head()
    ```
6. Declare a tree-based model object, such as a [Decision Tree Classifier](https://scikit-learn.org/stable/modules/generated/sklearn.tree.DecisionTreeClassifier.html#sklearn.tree.DecisionTreeClassifier) from Scikit-learn. You probably want to set `max_depth` to something smallish to avoid overfitting.
7. Train and validate your tree. If you're using cross-validation, you can do this with:
   ```python
    from sklearn.model_selection import cross_val_score
    print(cross_val_score(model, tree_X, y))
    ```
    This will train 5 trees on 80% of the samples in `tree_X`, then compute the accuracy of the prediction on the other 20%. You can also play around with the `scoring` parameter, giving it a string from [this list](https://scikit-learn.org/stable/modules/model_evaluation.html#scoring-string-names) (e.g. `scoring='recall'` or `scoring='precision'`) to see the balance between [Type I and Type II error](/w26/lecture/02-basic-models/#model-evaluation-classification).
8. Experiment! Does your model seem like it's working fairly well? If not, what could you change? Consider:
   - Different encoding schemes
   - Discretizing numeric features
   - Dropping features that don't add value
   - Training a [forest of trees](https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.RandomForestClassifier.html)
   - Changing tree depth to avoid overfitting

## Submit