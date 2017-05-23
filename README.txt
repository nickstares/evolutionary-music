The program starts with 10 "composers". A composer consists of two elements: First, a starting "fragment" which is one measure of notes which I have composed manually. All composers have the same starting fragment. Second, the composer possesses "attributes": parameters for transforming that fragment. There are 5 attributes: "transposition probability", "global crescendo exponent", "rest probability", "dephasing parameter", and "chord creation intervals". For the first 10 composers, these attributes are randomized.
	A composition consists of 30 measures, with each measure being a version of the initial fragment which has been transformed by the given set of attributes.
	Through a combination of a command line program and Max/MSP runtime (a free software to run Max programs), a user will be able to listen to the compositions of each composer. and generate new composers. To generate new composers, a user may select two composers to reproduce with each other. The offspring of two composers will have two attributes of one composer, and three attributes of another. Which attributes originate from which parent is determined randomly. 


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

Happy listening!

