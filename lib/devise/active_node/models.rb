module Devise
  module ActiveNode
    module Models
      include Devise::Models

      def devise(*modules)
        modules.each do |m|
          case m
            when :database_authenticatable
              attribute :email, type: String
              attribute :encrypted_password, type: String

            when :recoverable
              attribute :reset_password_token, type: String
              attribute :reset_password_sent_at, type: Time

            when :rememberable
              attribute :remember_created_at, type: Time

            when :trackable
              attribute :sign_in_count, type: Integer
              attribute :current_sign_in_at, type: Time
              attribute :last_sign_in_at, type: Time
              attribute :current_sign_in_ip, type: String
              attribute :last_sign_in_ip, type: String

            when :confirmable
              attribute :confirmation_token, type: String
              attribute :confirmed_at, type: Time
              attribute :confirmation_sent_at, type: Time
              attribute :unconfirmed_email, type: String # Only if using reconfirmable

            when :lockable
              attribute :failed_attempts, type: Integer # Only if lock strategy is :failed_attempts
              attribute :unlock_token, type: String # Only if unlock strategy is :email or :both
              attribute :locked_at, type: Time
          end
        end

        super(*modules)
      end
    end
  end
end