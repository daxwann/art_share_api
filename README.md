# Art Share API

An application to store, share, and comment on artwork, as well as search for users.

Each user has a set of artworks that they own/control. These artworks can also be shared with other users. An artwork that has been shared with one or more other users will be visible to those users, but the artwork still 'belongs to' the original user.

Although we will maintain this conceptual distinction between a user's own artworks vs. the artworks that have been shared with that user, we will eventually write an index method that will combine both types of a user's viewable artworks together so that we can see any art made by or shared with that user.

## Learning Goals

- Be able to write Active Record models quickly
- Know how to write a `user_params` method
- Be able to write the five API RESTful controller methods
- Know how to test your API endpoints with Postman
- Know how to create and destroy join table records via controller methods
- Know how a nested route works

## Instructions

### Setting up Ruby environment
#### Install Homebrew

`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

#### Make sure to have rbenv installed

```bash
# install rbenv
brew install rbenv

# add to the PATH (rbenv commands are now available from terminal)
# .bashrc is the file that contains all of our terminal settings
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc

# initialize rbenv everytime you open a new console window (otherwise our system ruby version will take over when we start a new terminal session)
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

# update current console window with new settings
source ~/.bashrc

# source .bashrc from .bash_profile (necessary on some machines)
echo 'source ~/.bashrc' >> ~/.bash_profile

# install Ruby version 2.5.1
rbenv install 2.5.1

# set version 2.5.1 to be our global default
rbenv global 2.5.1

# the 'rehash' command updates the environment to your configuration
rbenv rehash

# and let's verify everything is correct
# check the version
ruby -v # => 2.5.1

# check that we are using rbenv (this tells you where the version of ruby you are using is installed)
which ruby # => /Users/your-username/.rbenv/shims/ruby
```

#### install Rails
```bash
# install rails
gem install rails

# verify installation
which rails # => /Users/username/.rbenv/shims/rails
```

#### install dependencies
```bash
# in repository directory
bundle install
```
