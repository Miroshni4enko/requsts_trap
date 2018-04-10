require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  test('TrapUrl should not save without url') do
    trapUrl = TrapUrl.new
    assert_raise(NameError, ActiveRecord::NotNullViolation) do
      trapUrl.save
    end
  end
  test('TrapUrl should not save without amount') do
    trapUrl = TrapUrl.new
    assert_raise(NameError, ActiveRecord::NotNullViolation) do
      trapUrl.save
    end
  end
end
