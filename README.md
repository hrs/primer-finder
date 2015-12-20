## PrimerFinder [![Build Status](https://secure.travis-ci.org/hrs/primer-finder.png?branch=master&.png)](http://travis-ci.org/hrs/primer-finder)

A simple web app for searching lists of primers to find the ones that bind the
best to a target region.

An instance is freely available for use at http://primer-finder.herokuapp.com.

### Setting up a development environment

PrimerFinder is written in Ruby using the [Rails] framework.

First, make sure you've got the version of Ruby specified in the [Gemfile]. As
of this writing, that's 2.2.4. You'll almost certainly want to use a Ruby
version manager to install and manage different versions of the language. I'm
partial to using [chruby] with [ruby-install], but [RVM] and [rbenv] are also
popular.

You can check your Ruby version with `ruby -v`.

We use [bundler] to manage library dependencies. Install the necessary libraries
("gems") specified in the [Gemfile] by running:

```sh
$ gem install bundler
$ bundle
```

After setting up, you can run the application using [Heroku Local]:

```sh
$ heroku local
```

[Rails]: http://rubyonrails.org/
[Gemfile]: https://github.com/hrs/primer-finder/blob/master/Gemfile
[chruby]: https://github.com/postmodern/chruby
[ruby-install]: https://github.com/postmodern/ruby-install
[RVM]: https://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv
[bundler]: http://bundler.io/
[Heroku Local]: https://devcenter.heroku.com/articles/heroku-local

### Running tests

Once you've set up your dev environment, you should be able to run the tests!
PrimerFinder has a small suite of unit and feature tests. Run them with:

```sh
$ rake
```

### Deployment

The canonical instance of PrimerFinder is hosted on [Heroku]. It should be
fairly easy to deploy your own copy there, if you'd like to:

* Create a new Heroku instance.
* Associate it with your local repository.
* `git push heroku master`

Everything *should* just work.

[Heroku]: https://heroku.com

### Licensing

PrimerFinder's licensed under the [GNU General Public License].

[GNU General Public License]: https://github.com/hrs/primer-finder/blob/master/LICENSE.md

### Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)
