Account Management Entity
=========================

## Purpose
Herokey uses RabbitMQ to build async communication between its components (AME, TME, PAY, ACS). Messages are sent as a reaction to the changes of several entities. Messages that are created during the test suite run reach RabbitMQ server running on a local machine of developers, creating useless entities in local DB.
This module substitutes the invokation of RabbitMQ related classes, provided by client-side RabbitMQ library `bunny`.

## Usage
**CAN BE USED FOR TESTING PURPOSES ONLY!**

1. Add gem to Gemfile and run `bundle i`.
2. Add `spec/support/rspec_bunny_helper.rb` file to the project with the following content.
```
require "rspec_bunny_helper"

RSpec.configure do |config|
  unless ENV['INVOKE_RABBITMQ_SERVER']
    config.before(:each) do
      allow(Rabbitmq).to receive(:channel).and_return(RspecBunnyHelper.channel)
    end
  end
end
```
3. Add `spec/support/rspec_bunny_helper.rb` to a load lookup for `rspec_helper.rb`
4. Run tests :)
