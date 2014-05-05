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
              attribute :reset_password_sent_at

            when :rememberable
              attribute :remember_created_at

            when :trackable
              attribute :sign_in_count, type: Integer
              attribute :current_sign_in_at
              attribute :last_sign_in_at
              attribute :current_sign_in_ip, type: String
              attribute :last_sign_in_ip, type: String

            when :confirmable
              attribute :confirmation_token, type: String
              attribute :confirmed_at
              attribute :confirmation_sent_at
              attribute :unconfirmed_email, type: String # Only if using reconfirmable

            when :lockable
              attribute :failed_attempts, type: Integer # Only if lock strategy is :failed_attempts
              attribute :unlock_token, type: String # Only if unlock strategy is :email or :both
              attribute :locked_at
          end
        end

        super(*modules)
      end
    end
  end
end