require 'spec_helper'
require 'orm_adapter/example_app_shared'

if !defined?(ActiveNode::Base)
  puts "** require 'active_node' to run the specs in #{__FILE__}"
else
  module ArOrmSpec
    class User < ActiveNode::Base
      attribute :name, type: String
      attribute :rating, type: Integer

      has_many :notes, type: :owner, direction: :incoming
      has_one :user
    end

    class Note < ActiveNode::Base
      has_one :owner, class_name: 'ArOrmSpec::User'
    end

    # here be the specs!
    describe '[ActiveNode orm adapter]' do
      before do
        User.delete_all
        Note.delete_all
      end

      it_should_behave_like "example app with orm_adapter" do
        let(:user_class) { User }
        let(:note_class) { Note }
      end
    end
  end
end
