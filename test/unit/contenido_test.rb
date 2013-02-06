require 'test_helper'

class ContenidoTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Contenido.new.valid?
  end
end
