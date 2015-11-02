# Nutmeg Technical Test

Please write a Ruby command line utility as a Ruby gem.  
The gem should be installable, but does not need to be published on rubygems.org.  

The command should have the following interface:  

    $ my_command [browser|file|fact]


with `browser` being the default if no arguments are passed.  

The program should interact with the following public APIs:  

* http://thecatapi.com/
* http://catfacts-api.appspot.com/doc.html


The command should:  

* with `browser`, open a new browser window displaying an image of a cat;
* with `file`, it should save on the desktop an image of a cat, as an image file;
* with `fact`, it should print to stdout a cat fact;
* also, implement a new argument of your choice to expand the program.

There is __no__ need to support multiple operating systems.

### Important:

* Write tests.
* Use git, and write clear commit messages. The exercise must be submitted as a git repository (either as an archive or as a public repo on GitHub).
* Think about code structure, quality and readability.
* Write a readme.
