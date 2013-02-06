require 'test_helper'

class ReferenciaTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Referencia.new.valid?
  end
end
