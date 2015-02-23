rails_log_autotruncator — Rails log auto truncate
--------------------
rails_log_autotruncator is a simple (monkey)patch for ActiveSupport::BufferedLogger that limits a log file size. Use it if you just don't want your rails project development or test log file becomes large.


### Disclaimer
You don't need this gem for ruby 1.9.3 and up. You can add the following code to your environment config file (i.e. config/environments/test.rb):

    config.logger = Logger.new(config.paths.log.first, 1, 5.megabytes)

5.megabytes is a max log file size in this case. You can adjust it according to your needs.


### Compatibility

* Ruby 1.9.2 Rails 3.0.6
* Ruby 1.8.7 Rails 2.3.5


### Installation
##### Bundler
Add the rails_log_autotruncator gem to your Gemfile:

    gem 'rails_log_autotruncator'


##### Rails 2 without Bundler

    gem install rails_log_autotruncator

then add to your environment.rb to Rails::Initializer.run:

    config.gem "rails_log_autotruncator", :lib => "rails_log_autotruncator"


### Copyright

Copyright (c) 2011 Dzmitry Plashchynski. See LICENSE for details.
