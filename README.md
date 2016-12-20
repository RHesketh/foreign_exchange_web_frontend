# Foreign Exchange Web Frontend
Foreign Exchange Web Frontend is a small Rails application designed to showcase the ForeignExchange gem.

## Usage
Before you can begin using the site you must download the latest foreign exchange rates so they can be stored locally. To do this, type:

`rake rates:download`

**Note**: This git repository assumes that the Foreign Exchange gem project has been downloaded and is in a directory relative to this project named "foreign_exchange". You should edit the Gemfile if this is not the case.

### Commands

To start the site running, run

`rails server`

## Tests

The project contains integration and unit tests written in RSpec, they can be run using:

`rspec spec`

## License

All code, text and images found in this repository are licensed using the [Unlicense](http://unlicense.org/) and are free to use for whatever you like.