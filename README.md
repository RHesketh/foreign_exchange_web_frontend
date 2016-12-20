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

## Development Overview
### Design decisions
#### Fake Slack Client
I decided to write a fake Slack client for test purposes as it gave me a simple way to test code in event handler hooks without having to run a real Slack API client or rely on third-party test solutions such as VCR. The fake Slack client stores command blocks and can execute them later arbitrarily. This allows my tests to do things like test the code which triggers when the :channel_joined event fires without joining a real channel in Slack.

#### Use of `%x()` to execute `ri`
I wanted to make sure that arbitrary commands could not be passed through to the shell using backticks. As well as being sanitised by the `#strip_weird_characters` method, using `%x()` ensures that anything passed to the shell has been broken into pieces rather than executed directly as given.

#### Reformatting of messages
Although I could have just returned the `ri` output unedited, I found that it looked rather ugly in some parts. I wanted to clean up the headers and make them stand out. I also hated how the class methods would spam a large list, so I reformatted them to be comma-separated and easier to read.  

### Gems used
#### Slack Ruby Client
I decided to use a Slack client gem rather than implement my own Websocket connections with the Slack API because I consider basic communication with the Slack API to be a solved problem. There is a library which is ready to use and at time of writing is still under active development. I did not see the benefit of reimplementing this work, focusing instead on the parts of my bot that are unique. 

I did not use a Slack bot framework such as Slack-Ruby-Bot because I felt that the framework would do most of the project's work for me and allow me little room to show my working.

#### SimpleCov
I like to use SimpleCov because it provides detailed information about which parts of my code have been run as part of the test cycle. Although I try to work in a test-driven manner where possible, SimpleCov ensures that experimental methods or changes which become permanent don't get left without their behaviour being executed during some kind of automated test.