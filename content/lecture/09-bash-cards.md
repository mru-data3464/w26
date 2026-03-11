---
title: "9: Bash and data cards"
date: 2026-03-12
marp: true
theme: marp-mru
paginate: true
headingDivider: 2
layout: lecture
toc: true
code: "09_bash_cards"
leftoff: []
---

<!-- 
_class: title_slide
_paginate: skip
-->

{{< katex />}}
{{% ignore %}}

## <!--fit-->DATA 3464: Fundamentals of Data Processing
### <!--fit-->Bash and data cards

Charlotte Curtis
March 12, 2026

{{% /ignore %}}

## Topic overview
- Intro to bash and unix tools
- Data cards

**Resources used:**
- [Data Science at the Command Line](https://jeroenjanssens.com/dsatcl/)
- [The Data Cards Playbook](https://sites.research.google/datacardsplaybook/)

> Why these topics together? They both seem relevant to assignment 3

## Why bash?
- Python is great, but it's not the only tool. Command line is better to:
    - Move and rename files
    - Take a peek at the first few lines of a giant csv
    - Find and replace text in a bunch of files
    - Fetch data from the web
- Bash and unix tools are more useful than their Windows counterparts
- [Git bash](https://git-scm.com/downloads) lets us use bash on Windows

## Okay, but what is it?
- The [Bourne Again SHell](https://www.gnu.org/software/bash/) is a command line interface created in 1989
- A **shell** is a program to execute commands from the user
- The "Bourne shell" (`sh`) from the 1970s was standard on UNIX, bash adds to it
- Default shell for linux, (almost) macOS
- When you run these commands in Jupyter notebook, you're using bash!
  ```bash
  %pip install -q some_package
  ```

## Basic bash
```bash
command_name --long_flag -l -o arg1 arg2
```
- Examples of common commands:
    - `ls` to list files in a directory
    - `cd` to change directories
    - `mv` to move or rename files
    - `head` to view the first few lines of a file
    - `grep` to search for text in files
    - `sed` to find and replace text in files
    - `curl` to fetch data from the web