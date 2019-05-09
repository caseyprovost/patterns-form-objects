module FormObjects
  module Forms
    class UserRegistrationForm < ApplicationForm
      attribute :email, FormObjects::Types::Coercible::String
      attribute :username, FormObjects::Types::Coercible::String
      attribute :name, FormObjects::Types::Coercible::String
      attribute :password, FormObjects::Types::Coercible::String

      def persist!
        # save user and stuff
      end

      private

      def schema
        Dry::Validation.Schema do
          required(:email).filled
          required(:username).filled
          required(:name).filled
          required(:password).filled

          required(:email).filled(format?: /@/)
          required(:username).filled(max_size?: 30)
          required(:password).filled(min_size?: 10)
        end
      end
    end
  end
end
