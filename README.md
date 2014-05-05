# ActiveNode ORM for Devise

## Installation

Add devise-active_node to your Gemfile

    gem 'devise-active_node'

Comment out the current ORM in config/initializers/devise.rb, and add:

    require 'devise/orm/active_node'

Configure your model:

    class User < ActiveNode::Base
      devise :registerable, :database_authenticatable, :recoverable
    end
