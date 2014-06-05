require_relative './user.rb'
require_relative './discount.rb'

class Order
  attr_accessor :name, :employee, :affiliate, :item, :amount
  def initialize args
    if args.length <5
      nil
    else
      @name, @employee, @affiliate, @item, @amount = args
    end
  end

  def calculate
    discount = 0
    u = User.new [@name, @employee, @affiliate]
    d = Discount.new([u, @item, @amount])
    discount = d.calculate
    if discount == 0
      return @amount.to_f.round(2)
    else
      return (@amount.to_f - (@amount.to_f * (discount.to_f / 100.to_f)).to_f).round(2)
    end
  end
end