# Description

Reproduce the strange templating behavior we are seeing from the handlebars-ruby gem that only happens in karafka

# Setup

* `bundle install`
* `docker-compose up -d`

# Testing

**To test templating using handlebars directly**
1. `bundle exec ruby run.rb handlebars`

------

**To test phobos processing**
1. `bundle exec phobos start`
2. `bundle exec ruby run.rb phobos <optional_message_count>`

-------

**To test karafka processing**
1. `bundle exec karafka server`
2. `bundle exec ruby run.rb karafka <optional_message_count>`

-------

By default the phobos and karafka commands send 10 identical messages but this can be overridden by including an optional_message_count value. The workers will print out the result of the call to template.