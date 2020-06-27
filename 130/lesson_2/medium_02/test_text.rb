require 'minitest/autorun'
require_relative 'text.rb'

class TestText < MiniTest::Test
  def setup
    @file = File.open('text.txt', 'r')
    @txt = Text.new(@file.read)
  end

  def test_swap
    expect = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT
    actual = @txt.swap("a", "e")
    assert_equal(expect, actual)
  end

  def teardown
    @file.close
  end

end

