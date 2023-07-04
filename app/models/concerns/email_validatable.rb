require 'mail'
# Module for User email validation
module EmailValidatable
  extend ActiveSupport::Concern

  # Validates User email
  # Usage: validates :email, email:true
  class EmailValidator < ActiveModel::EachValidator
    def validation_error(record, attribute)
      record.errors.add(attribute, (options[:message] || 'is not an email'))
    end

    def validate_each(record, attribute, value)
      begin
        email = Mail::Address.new(value)
      rescue Mail::Field::ParseError
        validation_error(record, attribute)
      end
      value = email&.address
      return if value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

      validation_error(record, attribute)
    end
  end
end
