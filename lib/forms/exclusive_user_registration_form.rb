module FormObjects
  module Forms
    class ExclusiveUserRegistrationForm < UserRegistrationForm
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

          required(:email).filled(format?: /@harvard.edu/)
          required(:username).filled(max_size?: 30)
          required(:password).filled(min_size?: 10)
        end
      end
    end
  end
end
