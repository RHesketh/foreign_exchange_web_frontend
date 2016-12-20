# Foreign Exchange Web Frontend
Foreign Exchange Web Frontend is a small Rails application designed to showcase the ForeignExchange gem.

## Installation

Documentation Bot requires Ruby version 2.3.3. The easiest way to install Ruby is using a Ruby environment manager such as [RVM](http://rvm.io) or [rbenv](https://github.com/rbenv/rbenv).

Once Ruby has been installed the project can be configured into an initial working state using:

`bundle`

## Usage
Before you can begin using the site you must download the latest foreign exchange rates so they can be stored locally. To do this, type:

`rake rates:download`

### Commands

To start the site running, run

`rails server`

## Tests

The project contains integration and unit tests written in RSpec, they can be run using:

`rspec spec`

## License

All code, text and images found in this repository are licensed using the [Unlicense](http://unlicense.org/) and are free to use for whatever you like.