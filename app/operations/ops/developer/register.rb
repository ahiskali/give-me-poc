module Ops
  module Developer
    class Register < BaseOperation
      step :validate!
      step :persist!

      private

      def validate!(options, **)
        Bootcamp::RegistrationForm.new(User.new).validate(user_params(options))
      end

      def persist!(options, **)
        User.create(user_params(options))
      end

      def user_params(options)
        options.to_hash.merge(role: 'developer')
      end
    end
  end
end
