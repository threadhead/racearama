require 'test_helper'

class PackTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Pack.new.valid?
  end
end
