# Seedrs tech test

A simple program to model the object interaction between a Campaign object and an investment object. The program will allow a user to set up a new campaign and then add investments to it. The program will be written in Ruby using RSpec as a testing framework, usage instructions below.

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.
* Invest, calculate percentage raised.

### Approach

Before attempting to build a larger version of this project I decided to write this very simple tested version to give me an idea of how I think my objects will interact and how the dependency will work. This is simply modelling the objects with no data storage.

### Usage instructions

Clone the project and then cd into it

bundle install

example usage in pry or irb

```
[2] pry(main)> require './lib/campaign.rb'
=> true
[3] pry(main)> campaign = Campaign.new('Rev', 'test url', 1000, 'music', 'UK', 10.00)
=> #<Campaign:0x00007fa399968fe0
 @campaign_image="test url",
 @campaign_name="Rev",
 @country="UK",
 @investment=Investment,
 @investment_multiple=10.0,
 @investments=[],
 @sector="music",
 @target_amount=1000,
 @total=0>
[4] pry(main)> campaign.invest(100)
=> [#<Investment:0x00007fa39928a2f0 @cash_value=100, @date=2018-12-31 12:46:40 +0000>]
[5] pry(main)> campaign.percentage_raised
=> 10.0
```

To see test coverage run Rspec in the command line

```
Campaign
  #invest
    creates a new Investment object
    adds to the amount invested
    only accepts multiples of the investment multiple
    only accepts positive investments
    adds an investment to the investments array
    prevents investment once fully funded
  #percentage_raised
    calculates the percentage raised

Investment
  #date
    can read the date attribute
  #cash_value
    can read the cash_value attribute

Finished in 0.02028 seconds (files took 0.1662 seconds to load)
9 examples, 0 failures
```

Project file structure

```
.
├── Gemfile
├── Gemfile.lock
├── README.md
├── lib
│   ├── campaign.rb
│   └── investment.rb
├── rubocop.yml
└── spec
    ├── campaign_spec.rb
    ├── features
    ├── investment_spec.rb
    └── spec_helper.rb
```
