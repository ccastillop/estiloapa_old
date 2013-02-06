require 'test_helper'

class FiguraTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Figura.new.valid?
  end
end
