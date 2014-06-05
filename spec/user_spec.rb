require 'user'

RSpec.configure do |config|
	config.expect_with :rspec do |c|
		c.syntax = [:should, :expect]
	end
end

describe "Users" do
	it "should create a product" do
		u = User.new(["RSpec User", true, false])
		u.should_not be_nil
	end

	it "should not create a product with no args" do
		u = User.new([])
		u.name.should be_nil
		u.employee.should be_nil
		u.affiliate.should be_nil
	end

	it "should not create a user if employee and affiliate are true" do
		expect {User.new(["RSpec User", true, true])}.to raise_error(IllegalUserParamsError)
	end	
end
