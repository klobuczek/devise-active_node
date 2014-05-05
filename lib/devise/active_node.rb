require "active_support/dependencies/autoload"

module Devise
  module ActiveNode
    extend ActiveSupport::Autoload
    autoload :VERSION
    autoload :Models
  end
end

# puts '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
# require 'orm_adapter/adapters/active_node'
