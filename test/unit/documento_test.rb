require 'test_helper'

class DocumentoTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Documento.new.valid?
  end
end
