#!/usr/bin/env ruby
require_relative '../lib/order'
require 'fileutils'

if ARGV.length < 5
	puts "You need to provide arguments in the following format"
	puts "./bin/discount.rb user_name(String) employee(true|false) affiliate(true|false) product_name(string) price(integer)"
else
	o = Order.new(ARGV)
	puts o.calculate
end
