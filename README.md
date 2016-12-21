# Foreign Exchange Web Frontend
Foreign Exchange Web Frontend is a small Rails application designed to showcase the [ForeignExchange gem](https://github.com/RHesketh/foreign_exchange_gem).

## Usage
Before you can begin using the site you must download the latest foreign exchange rates so they can be stored locally. To do this, type:

`rake rates:download`

**Note**: This git repository assumes that the [ForeignExchange gem](https://github.com/RHesketh/foreign_exchange_gem) has been downloaded and its source code is in a directory named "foreign_exchange_gem" which is in the same parent directory as this project's directory. You should edit the Gemfile if this is not the case.

### Commands

To start the site running, run

`rails server`

## Tests

The project contains integration and unit tests written in RSpec, they can be run using:

`rspec spec`

## License

All code, text and images found in this repository are licensed using the [Unlicense](http://unlicense.org/) and are free to use for whatever you like.