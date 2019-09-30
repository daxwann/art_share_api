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
- Use polymorphic associations

## Instructions

### Setting up Ruby environment
#### Install Homebrew

`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

#### Make sure to have rbenv and Ruby installed

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

### Test API using Postman
Check all routes
`rails routes`

Start Rails server
`rails s`

In Postman, set url to the correct local port, and test these APIs

#### Users
- create (POST /users). Creates new user. Pass in body params: user[username]
- destroy (DELETE /users/:id)
- index (GET /users)
- show (GET /users/:id)
- update (PATCH /users/:id)

#### Artworks
- create (POST /artworks). Pass in body params: `artwork[title]`, `artwork[artist_id]`, and `artwork[image_url]`
- destroy (DELETE /artworks/:id)
- index (GET /artworks)
- show (GET /artworks/:id)
- update (PATCH /artworks/:id)

#### Sharing artworks
- create (POST /artwork_shares). 
  Pass in body params `artwork_share[viewer_id]` and `artwork_share[artwork_id]`
- destroy (DELETE /artwork_share/:id). This un-shares an Artwork with a User. To delete a share, the user should issue a DELETE to `/artwork_shares/123`, where 123 is the id of the ArtworkShare to destroy. 

#### User's artworks
- index (GET /users/:id/artworks). Renders all artworks created by and shared with user with given params[:id] 

#### Comments
- create (POST /comments). Pass in body params `comment[author_id]` and `comment[artwork_id]`
- destroy (DELETE /comments/:id). Deletes comment with the given id
- index (GET /users/:id/comments or /artworks/:id/comments). Renders comments connected to either the user or artwork

#### Search
- index (POST /users/?query=querystring). Use query string parameter to pass in query. Renders all search results.

#### Like/Unlike comments or artworks
- like (POST /artworks/:id/like or /comments/:id/like). Like an artwork or comment. Pass in body params `user_id`.
- unlike (POST /artworks/:id/unlike or /comments/:id/unlike). Unlike an artwork or comment. Pass in body params `user_id`

#### Favorite/Unfavorite artworks
- favorite (POST /artwork-shares/:id/favorite or /artworks/:id/favorite). Favorites artwork created by or shared with the user. Pass in body param `user_id` Pass in body param `user_id`. 
- unfavorite (POST /artwork-shares/:id/unfavorite or /artworks/:id/unfavorite). Pass in body param `user_id`.

#### Create collections, add/remove artworks from collection
- create (POST /collections). Pass in body params `collection[user_id]` and `collection[name]`
- index (GET /users/:id/collections). Renders all collections created by user.
- show (GET /collections/:id). Renders collection with given id.
- destroy (DELETE /collections/:id). Deletes collection with given id.
- collection_artwork_add (POST /collections/:collection_id/artworks/:artwork_id/add). Adds artwork with given `artwork_id` to collection with given `collection_id`.
- collection_artwork_remove (DELETE /collections/:collection_id/artworks/:artwork_id/remove). Removes artwork with given `artwork_id` to collection with given `collection_id`.

