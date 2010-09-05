require 'test_helper'

class DenTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Den.new.valid?
  end
end
