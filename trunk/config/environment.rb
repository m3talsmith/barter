RAILS_GEM_VERSION = '2.0.2' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  
  config.action_controller.session = {
    :session_key => '_trunk_session',
    :secret      => '56460b4c6c5af65b4f4a3e8ec2d0bd4dd223a8e9aafd780a7e6459359218892e01f629d9012d9985dfd452f4985373e5db7a47770576c67c5d48cdba82f25418'
  }
  
  #--{ Used for prepare_session in app/controllers/application.rb }--
    MAX_SESSION_TIME = 60 * 15
  #--{ end }--

end

require 'will_paginate'