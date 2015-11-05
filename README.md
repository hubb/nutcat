## Nutcat [![Build Status](https://travis-ci.org/hubb/nutcat.svg?branch=master)](https://travis-ci.org/hubb/nutcat)

### Usage

`nutcat [browser|file|fact]`

* with `browser`, open a new browser window displaying an image of a cat (default);
* with `file`, it saves on the desktop an image of a cat, as an image file;
* with `fact`, it prints to stdout a cat fact;
* with `catpix`, it renders the image of the cat in the terminal;


Cat informations are fetched from the following APIs:

* http://thecatapi.com/
* http://catfacts-api.appspot.com/doc.html

### Development

```
$ git clone git@github.com:hubb/nutcat.git
$ cd nutcat
$ bundle install
$ bundle exec rspec
```

### License

MIT, see [LICENSE](https://github.com/hubb/nutcat/blob/master/LICENSE)
