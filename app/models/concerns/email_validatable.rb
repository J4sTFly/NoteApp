require 'mail'

module EmailValidatable
  extend ActiveSupport::Concern

  class EmailValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      begin
        email = Mail::Address.new(value)
        email.address
      rescue Mail::Field::ParseError
        record.errors[attribute] << (options[:message] || "is not an email")
      end
    end
  end
end
