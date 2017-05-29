
The program starts with 10 "composers". A composer consists of two elements: First, a starting "fragment" which is one measure of notes, (with three voices) which I have composed manually. All composers have the same starting fragment. Second, the composer possesses "attributes": parameters for transforming that fragment. There are 8 attributes: "transposition probability", "global crescendo exponent", "rest probability" (x3, one for each voice), "dephasing parameter", and "chord creation intervals". Transposition probability is the likelihood that every note in the initial fragment will be transposed by a step up or a step down. Global crescendo exponent is the amount the volume changes throughout the piece. Rest probability (one for each "voice" in the composition), is the likelihood a rest will be inserted in place of each note. Dephasing parameter is the amount that the fragment is dephased, meaning the timing of the notes are shifted by a certain amount. Chord creation are the notes that are added to the original notes to create chords, based on a list of intervals specified..

 For the first 10 composers, these attributes are randomized.
	A composition consists of 30 measures, with each measure being a version of the initial fragment which has been transformed by the given set of attributes.	

	Through a combination of a command line program and Max/MSP runtime (a free software to run Max programs), a user will be able to listen to the compositions of each composer. and generate new composers. To generate new composers, a user may select two composers to reproduce with each other. The offspring of two composers will have two attributes of one composer, and three attributes of another. Which attributes originate from which parent is determined randomly. Additionally, one parameter selected at random from each parent is mutated (randomized) instead of inheriting that parameter from the parent. 




Instructions:
Install Max from https://cycling74.com/downloads
(the trial version will work fine as you are only reading my file)
open "evolutionary music.mxf"
run "ruby evolutionary_music.rb <command>" to run the program

Commands:
"names" (gives a list of composer names)
"listen <composer_name>" (plays the composition made by a composer)
"reproduce <composer_name_1> <composer_name_2>"  (Make two composers reproduce)
"erase_db" (erases the database of generated composers)



Challenges:

My main challenge was scoping. I quickly realized the amount of work necessary to generate truly varied textural music. There are so many axis or parameters in a given piece of music that I decided to simplify to only midi notes. Generating a fresh piece of music in this fashion is also extremely difficult, so I narrowed my scope down to transforming a fixed phrase repeatedly. 

Future work:

I would like to expand this project significantly in the future. A start would be to have the initial fragments be generated, and have the style for each phrase be genetic. After that I could focus on different instruments for each voice, and different amounts of voices - right now I only have 3 fixed voices. Once I have a variety of instruments, I could try to synthesize sounds "in between" each instrument, to have gradations of texture.

