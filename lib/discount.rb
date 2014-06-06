require 'yaml'
require_relative './user.rb'

class Discount
  attr_accessor :user, :item, :price
  def initialize args
    @d_config = YAML.load_file('./discount.yml')
    @user, @item, @price = args
    @price = @price.to_i
  end

  def calculate
    v_discount = 0
    p_discount = []
    if @d_config["exempted"].include? @item.downcase
      return 0
    else
      p_discount << @d_config["employee"].to_i if @user.employee.to_s == "true"
      p_discount << @d_config["affiliate"].to_i if @user.affiliate.to_s == "true"
      p_discount << @d_config["loyal_customer"].to_i if @user.loyal_customer
      if @price >= @d_config["step_discount"]["steps"].to_i
        v_discount = (@price / 100) * @d_config["step_discount"]["discount"].to_i
      end
      return p_discount.min + v_discount
    end
  end
end