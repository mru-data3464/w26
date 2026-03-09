---
title: "8: Wrangling text"
date: 2026-03-05
marp: true
theme: marp-mru
paginate: true
headingDivider: 2
layout: lecture
toc: true
code: 08_text
leftoff:
    - 2026-03-05
---

<!-- 
_class: title_slide
_paginate: skip
-->

{{< katex />}}
{{% ignore %}}

## <!--fit-->DATA 3464: Fundamentals of Data Processing
### <!--fit-->Wrangling text

Charlotte Curtis
March 5, 2026

{{% /ignore %}}

## Topic overview
- Text file formats and character encodings
- Extracting features from (un)structured text
- Regular expressions

**Resources used:**
- [Python documentation](https://docs.python.org/3/library/codecs.html#encodings-and-unicode)
- [Joel on Software Blog Post](https://www.joelonsoftware.com/2003/10/08/the-absolute-minimum-every-software-developer-absolutely-positively-must-know-about-unicode-and-character-sets-no-excuses/)

## What is a text file?
<!-- _class: code_reminder -->

- Any file is just a sequence of **bytes**
- The file **extension** is somewhat meaningless
- Text files contain only human-readable **characters**
- **Binary files** are everything else, including:
    - Images
    - PDFs
    - Word documents*
    - Executables

<footer>Technically word docs are just zip files with XML (structured text) inside</footer>

## Character encodings
<!-- _class: code_reminder -->
![center](../../static/img/08-characters.png)

- To properly read a text file, we need to know its **encoding**
- Character encodings define how bytes are interpreted
- Turns out this is surprisingly [complicated](https://docs.python.org/3/library/codecs.html#encodings-and-unicode)

<footer>Quote from <a href="https://pikepdf.readthedocs.io/en/latest/topics/encoding.html#character-encoding">PikePDF documentation</a></footer>

## ASCII
- American Standard Code for Information Interchange (1963)
- 7-bit encoding (128 characters)
- First 32 are **control characters** (e.g., newline, tab)
- Then punctuation, digits, uppercase letters, lowercase letters
- Most computers use 8-bit bytes, so there's a whole 128 characters "left over"

> This is a very English-centric character set!

---

![bg 80%](https://imgs.xkcd.com/comics/standards_2x.png)

<footer><a href="https://xkcd.com/927/">https://xkcd.com/927/</a>

## Unicode to the rescue
<!-- _class: code_reminder -->
- In the 1980s things were already getting out of hand
- The **Unicode consortium** published a standard in 1993 that assigned a **code point** to every character they could think of (297,334 as of Unicode 17.0)
- Currently, the most common encoding is [UTF-8](https://en.wikipedia.org/wiki/UTF-8)
    - "Unicode Transformation Format – 8-bit"
    - How can 297k characters be represented in only 8 bits?
- The first 128 characters are 1 byte each and align with ASCII
- After that, [2-4 bytes per character](https://en.wikipedia.org/wiki/Comparison_of_Unicode_encodings#Eight-bit_environments) are used
> There's also UTF-16 and UTF-32, but now we need to deal with [endianness](https://en.wikipedia.org/wiki/Endianness)

## Line endings
- Say we agree to use UTF-8 👍
- A text file is still just a big long string of **bytes**
- Humans like things to be orderly and readable with **line breaks**
    | System       | Abbreviation         | Escape sequence | Code point    |
    | ------------ | -------------------- | --------------- | ------------- |
    | Pre-OS X Mac | CR (carriage return) | `\r`            | U+000D        |
    | Unix         | LF (line feed)       | `\n`            | U+000A        |
    | Windows      | CRLF                 | `\r\n`          | U+000D U+000A |

- Result: chaos, but we've mostly settled on LF (`\n`)

## Why am I telling you all this?
- As data scientists, you will need to ingest data from various sources
- You **will** encounter character encoding and/or line ending issues
- You don't need to memorize all this, but recognizing that an issue exists will go a long ways towards fixing it

> Example: misadventures with "smart" [quotes](https://en.wikipedia.org/wiki/Right_single_quotation_mark)

## Where we left off on March 5
<!-- _class: title_slide -->

## Portable document format
- The [PDF specification](https://pdfa.org/resource/pdf-specification-archive/) was first published in 1993
- PDFs are like a "digital paper" that can contain text, images, vector graphics, and more (like JavaScript, forms, and weirdly, 3D models)
- We use them for all sorts of things because the **appearance** is consistent
- They are absolutely terrible for pretty much everything else

## Some useful PDF packages:
- [pdfminer.six](https://github.com/pdfminer/pdfminer.six): extract text and metadata
- [pdfplumber](https://github.com/jsvine/pdfplumber): built on pdfminer.six, layout aware text extraction
- [pikepdf](https://github.com/pikepdf/pikepdf): low level PDF manipulation
- [pymupdf](https://github.com/pymupdf/pymupdf): more low level PDF manipulation
- and [many](https://github.com/py-pdf/pypdf) ([many](https://camelot-py.readthedocs.io/en/master/)) [more](https://poppler.freedesktop.org/)!

> DATA 3463 covers more about PDFs, including OCR. The main focus in this class is on fixing the issues and dealing with edge case

## Hypertext markup language
- Much simpler than PDFs, but still not great for data exchange
- [Markup languages](https://en.wikipedia.org/wiki/Markup_language) are structured text files that define how content *should* be displayed, but it's not always consistent
- Most of the internet is UTF-8 encoded HTML
- We can try to extract text with something like [BeautifulSoup](https://www.crummy.com/software/BeautifulSoup/bs4/doc/)
    - Again, more on web scraping in DATA 3463

## Back to text
- Assuming we've got text from somewhere, we probably want to:
    - Organize it into a structured format (csv, database, json)
    - Identify specific features (postal codes, dates, names)
- Need to deal with encoding issues, garbled sentences, mixed up tables, and all the other bizarre ways things go wrong
- There is no magic flowchart for this! Lots of trying things, seeing what happens, dealing with a few edge cases at a time
> One really useful tool is **regular expressions** :hammer:

## Regular expressions<!--fit-->
### The card game?

*Note: card groupings and colours are logical where possible, but sometimes just random*

<!-- _class: title_slide -->

## Basic characters
![bg fit](../../static/img/regex_cards/01_literals.jpg)

## "Word" characters
![bg fit](../../static/img/regex_cards/02_words.jpg)

## Whitespace
![bg fit](../../static/img/regex_cards/03_whitespace.jpg)

## Quantifiers
![bg fit](../../static/img/regex_cards/04_quantifiers.jpg)

## Brackets and braces
![bg fit](../../static/img/regex_cards/05_brackets.jpg)

## Range and boundary
![bg fit](../../static/img/regex_cards/06_range_boundary.jpg)

## Start (not) and end
![bg fit](../../static/img/regex_cards/07_start_end.jpg)