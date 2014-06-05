# require 'active_support/core_ext/string'
require_relative './user.rb'

EXEMPTED_LIST = ["chocolate"]

class Discount
  attr_accessor :user, :item, :price
  def initialize args
    @user, @item, @price = args
    @price = @price.to_i
  end

	def calculate
    v_discount = 0
		p_discount = []
		if EXEMPTED_LIST.include? @item.downcase
      return 0
    else
			p_discount << 30 if @user.employee == "true"
			p_discount << 10 if @user.affiliate == "true"
			p_discount << 5 if @user.loyal_customer
      if @price >= 100
        v_discount = @price / 100 * 5
      end
      return p_discount.min + v_discount
		end
	end
end