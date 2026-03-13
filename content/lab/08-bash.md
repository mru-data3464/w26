---
title: "Lab 8: Bash and Regular Expressions"
weight: 1
date: '2026-03-16
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
Learn about:
- Navigating a computer on the command line
- Basic bash syntax
- Extracting text features with regular expressions

## Setup
There is no starter code this week; instead, I'd like you to create a `lab08` subdirectory and put your files in it.

While I can't tell *how* you actually make a directory, this is a good excuse to practice with bash! Try doing the following:
- Navigate to your labs repository using `cd`
- Create a new directory using `mkdir`
- `cd` into it so that you're working in the right place

## Basic Bash
Open up Git Bash (if you're on Windows), or Terminal on OSX, or some flavour of terminal on Linux. If you're on Git bash, then the `C:` drive is mapped to `/c/`. On the lab computers, you're probably starting off in your `H:` drive, or `/h/`.

There are many useful bash commands for interacting with your file system. I'm not going to go through them in detail, but here are a few that might be useful. Try them!

- `echo` displays whatever arguments you give it
-  `pwd` display the name of the current working directory
-  `ls` list the contents of a directory
-  `cp` copy a file
-  `mv` copy a file, remove the original -- also used for renaming
-  `cat`, `less`, `head`, `tail`  display the contents of a file in various ways
-  `rm` remove a file
-  `mkdir`  create a new directory
-  `rmdir`  remove an empty directory
-  `cd` change current working directories

Some bash commands have mandatory **arguments**. These are separated by spaces. For example, you can't `mkdir` without telling it the name of the directory you want to make:

```bash
$ mkdir some_new_dir
```

Since spaces separate arguments, filenames with spaces can cause trouble. Try the following:

```bash
$ mkdir some new dir
```

What did this do?

## `curl`: transfer data with URLs
First, make sure you are working in your `lab08` subdirectory. Then, try downloading a webpage (any webpage) with:

```bash
$ curl -O url
```
where `url` is the address of the webpage (you can copy this from your browser).

`-O` (uppercase) tells `curl` to output to a file with the same name as the source URL.

### Repeat
One of the main advantages to using the command line is the ability to loop over files. A basic `for` loop might be:

```bash
for file in *; do
    echo $file;
done
```

which just loops over every file in the current directory and prints its name.

You can also define lists of numbers to loop over, e.g:

```bash
for n in {1..3}; do
    echo $n;
done
```

### Task 1: Download a set of Hansards
I showed you this briefly in class last Thursday, but it's a handy dataset so we'll do it again.

Parliamentary debates are recorded in a document called a [Hansard](https://en.wikipedia.org/wiki/Hansard). These are published online at the website ourcommons.ca in structured [XML](https://en.wikipedia.org/wiki/XML), but accessing each day's record is kind of annoying and involves a lot of clicking. Fortunately, the name of each XML document is predictable, and is currently of the form (as of March 13, 2026):

```
https://www.ourcommons.ca/Content/House/[PPS]/Debates/[HHH]/HAN[HHH]-[L].XML
```

The stuff in square brackets are placeholders:
- [PPS]: two digits for the parliament and 1 for session
- [HHH]: 3 digits for the Hansard number
- [L]: 1 character for language (E or F)

For example, the Hansard for March 12th, 2026 is number 95 of the 1st session of the 45th parliament. The English language Hansard can be retrieved from:

```
https://www.ourcommons.ca/Content/House/451/Debates/095/HAN095-E.XML
```

Using this information, combined with the `for` loop syntax above, **download a selection of 10 Hansards**.

## Task 2: Extract information
The goal in this section is to create a text file containing only the sentences from the Hansards that reference the economy (or economics, or economist, etc). At the end of this lab, you should have two text files: one containing your incremental regex development, and the other the final result.

As you do each step, record the command that you used in a text or Markdown file. Formatting doesn't matter.

> [!TIP]
> For quick and easy iterative regex development, try using https://regex101.com

1. Using `grep`, find and print to the terminal all instances of the word `econ` in the Hansards, taking care not to match words incidentally containing `econ` such as `second`. 
   
   Use the flag `-E` for "extended" regex (which is what we've been discussing in class).

2. Modify your regex to be **case-insensitive** (hint: it's another flag to pass to `grep`)

3. Modify your regex to match the entire word that has `econ` in it, and limit the terminal output to just those words (yet another flag).

4. Modify your regex to match the entire *sentence* that has `econ` in it.

5. Finally, run your `grep` command and instead of printing the result to the terminal, redirect the output to a text file.

## Submit
Add the two files that you created in Task 2 to your `lab08` repo and push them to GitHub. You do not need to commit the Hansard xml files. If you didn't get all the way to the sentence extractor, that's okay - as usual, it's a completion-based lab mark.