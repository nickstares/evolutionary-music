	Generative composition is an exciting recent development in contemporary music. Musicians and programmers are writing software which itself writes music. An example of this is Brian Eno's app "Reflection", where an algorithm determines what sounds will come next in real time. I find this concept very interesting, and wanted to do a spin on it, using an evolutionary algorithm. This is a challenging endeavor for many reasons. Music is 2 dimensional: there are audio frequencies, and time. However, the ways in which you might generate audio frequencies, and the ways in which you would sequence them in time are infinite. So in order to generate music you have to shrink your scope tremendously in terms of what strategies/methodologies you use to generate music. Furthermore to make a music system evolutionary, you would not only have to program one methodology for generating music, but also program the ability for methodologies to combine with each other and produce offspring.

	The way I ended up approaching this problem was to limit my scope to only include pitches in western intervals, and only have one instrument: the piano. Furthermore, I wrote a starting measure of music, and simply transformed that measure in various ways, repeating the measure over and over again but with different transformations applied to it. I used MAX/MSP and Ruby to program this. 

	In MAX, with the help of the "bach" library, I wrote the initial measure(fragment) and the ways to transform and repeat this fragment, as well as the ability to listen to the final composition. The possibilities of transformation include the following attributes: Transposition probability, the likelihood that every note in the initial fragment will be transposed by a step up or a step down; Global crescendo exponent, the amount the volume changes throughout the fragment; Rest probability, (one for each "voice" in the composition) the likelihood a rest will be inserted in place of a note; Dephasing parameter, the amount that the fragment is dephased, meaning the timing of the notes are shifted by a certain amount; and chord creation, the notes that are added to the original notes to create chords, based on a list of intervals specified.

	In Ruby, I wrote a program which runs from the command line. This program keeps track of the attributes for each "composer" object. A composer is essentially a class containing the necessary attributes for generating a composition. Initially, the program generates 10 composers and stores them in a database (in this case a text file). The program also contains an algorithm to combine the attributes of two composers and create a child composer, also saved in the database. This algorithm consists of taking 4 attributes from one parent and 3 elements from another, mutating (randomizing) one element from each parent, and giving the resulting attributes to a new composer, which is named by the user. When you run the listen command, the Ruby program sends this information in the form of OSC to Max, which receives the data, generates a new composition, and plays it.

Here are the instructions to run the program:

Initial Steps:
Install Max from https://cycling74.com/downloads
(the trial version will work fine as you are only reading my file)
open "evolutionary music.mxf"
run "ruby evolutionary_music.rb <command>" to run the program

Commands:
"names" (gives a list of composer names)
"listen <composer_name>" (plays the composition made by a composer)
"reproduce <composer_name_1> <composer_name_2>"  (Make two composers reproduce)
"erase_db" (erases the database of generated composers)


	The results of this project were limited but exciting nonetheless. The user is able to generate composers, listen to their compositions, as well as make them reproduce. However, due to the fact that I used the same initial measure of music for all composers and the fact that much of the attributes involve randomization, it is somewhat hard to appreciate the character of a composer, let alone trace the genealogy of generations of composers. Despite my limited results, I choose to view this project as an initial foray into generative music, and an opportunity to explore the possibilities and challenges of the medium.
	One of my main challenges was scoping. I quickly realized the amount of work necessary to generate truly varied textural music. There are so many axis or parameters in a given piece of music that I decided to simplify to only midi notes. Generating a fresh piece of music in this fashion is also extremely difficult, so I narrowed my scope down to transforming a fixed phrase repeatedly. 

	I would like to expand this project significantly in the future. A start would be to have the initial fragments be generated, and have the style for each phrase be genetic. After that I could focus on different instruments for each voice, and different amounts of voices - right now I only have 3 fixed voices. Once I have a variety of instruments, I could try to synthesize sounds "in between" each instrument, to have gradations of texture.

