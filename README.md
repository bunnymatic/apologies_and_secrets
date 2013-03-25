# Apologies And Secrets
## The Sinatra Version

This app is a simple starting point for a Apologies And Secret.

It should be basically ready to deploy on heroku.  Read heroku deployment instructions for sinatra 
https://devcenter.heroku.com/articles/rack

# Starting off

If you haven't already, clone this git repository into your directory of choice:

Setup your rbenv or rvm for this project.  We've started with ruby-2.0.0-preview1 via rbenv.

Install bundler (if necessary)

    gem install bundler

Install your gems

    bundle

Start the app locally

    shotgun

Visit the website at http://localhost:9393

# Development

## Data Models
As a first cut, the data model is a simple YAML file.  One for Apologies and one for Secrets.  Models are defined in `model/apology.rb` and `model/secret.rb`.

Each model expects the following fields:

    title
    html_block_file
    display_params

* `title` is the title which will be used for display in the block.
* `html_block_file` is the filename for an html snippet which will be used to draw the block.
* `display_params` is a hash that can be used to pass display parameters on to the block (like classes, or font size or whatever).  This should be customized to include any params you might like to have handy in the view.

The yaml file `data/apologies.yml` should contain a list of entries with these three fields.   It will be read in when the app starts up and available when the views are rendered.

Secrets will follow the same layout, but will be contained in the `data/secrets.yml` file.  

## Views

The application layout (main template) is in `views/layout.html.erb`.  This file defines the overall layout of every page.  When you hit a particular page, Sinatra finds the views/<page> that is appropriate and renders that bit into the layout.html.erb where the it has a `yield`.

### Secrets and Apologies

When you hit the `/secrets` endpoint, you'll be running the `get '/secrets'` chunk of code in the `app.rb` file.  This loads up all the secrets and renders the `views/secrets.erb` view which goes through each secret and renders it one by one.  The model Secret has a method `partial_block` which returns the partial block file that should be used to represent the main body copy for each secret.  This corresponds to the name that you specified for the secret in the `html_block_file` parameter.  For example:  if you define a secret like so:

    title: my secret
    html_block_file: my_secret

when that secret is rendered, it'll try to find a file called `views/secrets/my_secret.erb`.  If that file exists, it'll stick that little HTML snippet in the view.  If not, it'll use the `views/missing_block.erb` snippet.

The same holds for apologies, except the partials should sit under `views/apologies/`.

## Tests

This is setup to use RSpec for tests.  To run the tests

    rspec spec


# NOTES

We're using ruby 1.9.3 so we can use pry and the pry-debugger (not quite ready for 2.0.0 i think?).

##Refs: 

* [Sinatra](http://www.sinatrarb.com)
* [Heroku](http://heroku.com)
