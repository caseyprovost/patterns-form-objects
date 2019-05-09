require "minitest/autorun"
require "minitest/mock_expectations"
require_relative "../../lib/form_objects"

def form_from_attributes(attributes = {})
  FormObjects::Forms::ExclusiveUserRegistrationForm.new(
    email: attributes[:email],
    username: attributes[:username],
    name: attributes[:name],
    password: attributes[:password]
  )
end

class ValidateEmailTest < Minitest::Test
  def test_that_email_matches_expected_format
    form = form_from_attributes({})
    assert_equal true, form.errors.messages[:email].include?("must be filled")

    form = form_from_attributes({ email: 'testing'})
    form.valid?
    assert_equal true, form.errors.messages[:email].include?("is in invalid format")

    form = form_from_attributes({ email: 'testing@yale.edu'})
    form.valid?
    assert_equal true, form.errors.messages[:email].include?("is in invalid format")

    form = form_from_attributes({ email: 'testing@harvard.edu'})
    form.valid?
    assert_equal nil, form.errors.messages[:email]
  end
end

class UserRegistrationSuccessTest < Minitest::Test
  def test_that_user_is_saved_with_valid_attributes
    form = form_from_attributes({
      email: 'the.man@harvard.edu',
      username: 'ironman',
      name: 'Tony Stark',
      password: '$IamIronMan$'
    })

    assert_called(form, :persist!) do
      assert true, form.save
    end
  end
end
