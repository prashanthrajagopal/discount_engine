require 'time'

class User
	attr_accessor :name, :employee, :affiliate
	def initialize args
		if !args.empty?
			@name, @employee, @affiliate, = args
      raise IllegalUserParamsError if(@employee == true && @affiliate == true)
      user_create if !user_exists
    else
     nil
   end
 end

  public
  def loyal_customer
    creation_time = ""
    File.read(".user").split("\n").each do |line|
      if line =~ /#{@name}/
        creation_time = line.split('|').last 
        break
      end
    end
    if Time.now - Time.parse(creation_time) > 63115200.0
      return true
    else
      return false
    end
  end

  private
  def user_exists
    if File.exists? ".user"
      # ret = File.read(".user").split("\n").each {|line| line.match(/#{@name}/)? true : false }
      f = File.new(".user")
      text = f.read
      if text =~ /#{@name}/ then
        return true
      else
        return false
      end
    end
  end

  def user_create
    file = File.open(".user", "a")
    file.puts([@name, @employee, @affiliate, Time.now].join('|'))
    file.close
  end
end

class IllegalUserParamsError < StandardError
end