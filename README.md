# Karafka Coditsu

[![CircleCI](https://circleci.com/gh/coditsu/karafka-coditsu/tree/master.svg?style=svg)](https://circleci.com/gh/coditsu/karafka-coditsu/tree/master)

Coditsu overwrites for default Karafka classes

This library provides some simple helper classes for easier Karafka integration with Coditsu ecosystem.

## Installation

Add this line to your application Gemfile:

```ruby
gem 'karafka-coditsu',
    git: 'git@github.com:coditsu/karafka-coditsu.git',
    require: true,
    branch: :master
```

And then execute:

```
  $ bundle
```

## Usage

Karafka Coditsu provides couple helper classes that simplify working with Karafka:

- `KarafkaCoditsu::AirbrakeListener` - Listener for error only notifications upon Karafka problems.
- `KarafkaCoditsu::Parser` - Default parser that namespaces the data within a 'value' scope.
- `KarafkaCoditsu::ResponseBuilder` - Wraps up a builder for generating a pretty json with a internal compatible format with the event type included.

## Note on contributions

First, thank you for considering contributing to Coditsu ecosystem! It's people like you that make the open source community such a great community!

Each pull request must pass all the RSpec specs and meet our quality requirements.

To check if everything is as it should be, we use [Coditsu](https://coditsu.io) that combines multiple linters and code analyzers for both code and documentation. Once you're done with your changes, submit a pull request.

Coditsu will automatically check your work against our quality standards. You can find your commit check results on the [builds page](https://app.coditsu.io/coditsu/commit_builds) of Coditsu organization.

[![coditsu](https://coditsu.io/assets/quality_bar.svg)](https://app.coditsu.io/coditsu/commit_builds)
