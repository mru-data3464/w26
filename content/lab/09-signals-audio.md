---
title: "Lab 9: 1D Signals and Audio"
weight: 1
date: '2026-03-23'
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
- Audio as 1D signals
- Time and frequency representations
- Characteristics of audio files
- Basic audio processing

## Setup
The lab directory has some starter code and files in the `lab09` subdirectory, so merge in the pull request and pull changes to your local computer.

I've downloaded two files from freesound.org. **Do not listen to them** - try to figure out which is which by looking at the signals! The files are:

- Breaking Glass #1.wav by abstraktgeneriert -- https://freesound.org/s/233607/ -- License: Creative Commons 0

- sirene_06080401.wav by WIM -- https://freesound.org/s/26173/ -- License: Attribution 4.0

As the attribution suggests, one is breaking glass and the other is a siren.

## Task 1: Load and inspect the data
As usual, it's a good idea to do some EDA before diving in!

In the starter code, I've included two modules for loading audio:
- [`wavfile.read()`](https://docs.scipy.org/doc/scipy/reference/generated/scipy.io.wavfile.read.html#scipy.io.wavfile.read) reads a wav file and interprets it as-is, returning a tuple of the sample rate (int) and the signal data (a numpy `ndarray`).
- [`librosa.load()`](https://librosa.org/doc/latest/generated/librosa.load.html) reads a wav file and by default does some basic preprocessing.

1. Load both of the files using `wavfile.read()` (ignoring the warnings that pop up). Try to determine the the...
   - Sampling rates
   - Number of Channels
   - Data types
   - Bit depths
    If there are differences between the files, how does this present a challenge in processing?

2. Next, load both using `librosa.load()`. How do the resulting signals differ?
3. Working with the `librosa` data, plot the signals in the time domain on the same graph.
4. Compute the frequency domain representation of both sounds and plot the magnitude spectrum.
   > [!TIP]
   > Matplotlib has a function [`plt.magnitude_spectrum`](https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.magnitude_spectrum.html) which computes the FFT, scales it by the number of samples, and plots the magnitude in the positive half of the frequency spectrum. Neat. Just remember to pass the `Fs` parameter so that you get an accurate frequency axis.
5. Based on the time and frequency plots, can you guess which signal is breaking glass and which is a siren? Remember, high in frequency = short in time.

## Task 2: Basic audio processing
Now that you've got the two clips loaded, you can start playing around with some processing. If you're on your own computer or have a wired headset you can try listening the sounds as you change them with:

```python
import IPython.display as ipd
ipd.Audio(sound, rate=sampling_rate)
```

which will display a little "play" button in the notebook.

Try doing the following:

1. Resample at various sampling rates, e.g. using `librosa.resample`. How does this affect both sounds? Pay particular attention to the frequency domain!

2. One useful feature in audio signals is the **onset**, or when a sound starts. This is more useful for longer signals (like finding the beat in songs), but it could also be useful for aligning the start of a sound in a dataset. Try using [`librosa.onset.onset_detect`](https://librosa.org/doc/main/generated/librosa.onset.onset_detect.html) to find the time or sample for a "new note" in each signal. Do the results make sense to you?

3. Try adding "noise" to your sounds.