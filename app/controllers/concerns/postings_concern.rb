#./app/controllers/concerns/foo.rb
require "open-uri"

# URL Validation
# https://www.railsmine.net/2010/09/ruby-way-to-do-url-validation.html

module PostingsConcern
  extend ActiveSupport::Concern

  def check_apply_type(apply_type)
    if (is_valid_email(apply_type))
      "email"
    elsif (is_valid_url(apply_type))
      "url"
    else
      "invalid"
    end
  end

  def is_valid_url(apply_type)
    result = (apply_type =~ URI::regexp(["https"]))
    result == 0 ? true : false
  end

  def is_valid_email(apply_type)
    result = (apply_type =~ VALID_EMAIL_REGEX)
    result == 0 ? true : false
  end
end
