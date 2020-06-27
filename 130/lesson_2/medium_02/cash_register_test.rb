require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(1000)
    transac = Transaction.new(20)
    transac.amount_paid = 20
    prev_amount = register.total_money
    register.accept_money(transac)
    next_amount = register.total_money

    assert_equal(prev_amount + 20, next_amount)
  end

  def test_change
    register = CashRegister.new(1000)
    transac = Transaction.new(20)
    transac.amount_paid = 40
    change_method = register.change(transac)
    assert_equal(20, change_method)
  end

  def test_give_receipt
    register = CashRegister.new(1000)
    transac = Transaction.new(20)
    assert_output("You've paid $#{transac.item_cost}.\n") { register.give_receipt(transac)}
  end

  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30\n')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal(30, transaction.amount_paid)
  end



end