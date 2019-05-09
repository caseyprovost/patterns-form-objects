module FormObjects
  module Forms
    class ApplicationForm < Dry::Struct
      def valid?
        errors.messages.empty?
      end

      def save
        if valid?
          persist!
        else
          false
        end
      end

      def errors
        schema.(attributes)
      end

      private

      def schema
        raise "Not yet implemented!"
      end
    end
  end
end
