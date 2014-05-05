require 'rubygems'
require 'rspec'

$:.unshift(File.dirname(__FILE__) + '/../lib')

['active_node'].each do |orm|
  begin
    require orm
  rescue LoadError
    puts "#{orm} not available"
  end
end

# require 'devise/active_node'
require 'neography'
require 'orm_adapter'
require 'orm_adapter/adapters/active_node'
