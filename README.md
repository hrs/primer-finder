## PrimerFinder [![Build Status](https://secure.travis-ci.org/hrs/primer-finder.png?branch=master&.png)](http://travis-ci.org/hrs/primer-finder)

A simple web app for searching lists of primers to find the ones that bind the
best to a target region.

An instance is freely available for use at http://primer-finder.herokuapp.com.

### Setting up a development environment

PrimerFinder is written in Ruby using the [Sinatra] framework.

First, make sure you've got the version of Ruby specified in the [Gemfile]. As
of this writing, that's 2.2.3. You'll almost certainly want to use a Ruby
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

You should now be able to start the server locally by running `foreman start`.

In development (and only in development!) I'd suggest running the server with
`shotgun` instead of `foreman start`, since it'll reload all the code on every
new request, so you won't have to keep restarting the server to see your
changes.

[Sinatra]: http://www.sinatrarb.com/
[Gemfile]: https://github.com/hrs/primer-finder/blob/master/Gemfile
[chruby]: https://github.com/postmodern/chruby
[ruby-install]: https://github.com/postmodern/ruby-install
[RVM]: https://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv
[bundler]: http://bundler.io/

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
