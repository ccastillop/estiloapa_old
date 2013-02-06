# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem "princely", :version => "= 1.2.5"
  #config.gem "pandoku"
  #config.gem "maruku"
  config.gem 'bluecloth', :version => '>= 2.0.0'
  
  config.gem 'vestal_versions', :version => "= 0.8.3"
  #config.gem "grit"
  config.gem "authlogic"
  config.gem "haml", :version => "= 2.2.2"
  config.gem "sanitize"
  config.gem 'mislav-will_paginate', :version => '~> 2.3.11', :lib => 'will_paginate', 
    :source => 'http://gems.github.com'
  config.gem 'thoughtbot-paperclip', :lib => 'paperclip', :source => 'http://gems.github.com'

  config.gem 'formtastic'
  config.gem 'validation_reflection'

  #config.active_record.observers = :user_observer#, :envio_observer, :contacto_observer
  config.time_zone = 'Lima'
  config.i18n.default_locale = 'es-PE'
  config.action_controller.resources_path_names = { :new => 'nuevo', :edit => 'editar' }
  config.action_mailer.delivery_method = :smtp
  config.action_view.sanitized_allowed_tags = 'table', 'tr', 'td', 'object', 'embed', 'param'
end

ActionMailer::Base.smtp_settings = {
  :address => "localhost",
  :port => 25,
  
  :domain  => "estiloapa.com"
  #:user_name => "username",
  #:password => "password",
  #:authentication => :plain
}