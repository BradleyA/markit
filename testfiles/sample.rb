#################
# 	sample.rb	3.4.116	2018-02-15_11:19:56_CST uadmin six-rpi3b.cptx86.com 3.4-13-gd08587a 
# 	   updated sample files 
#	sample.rb	3.3.97	2018-02-12_21:05:46_CST uadmin six-rpi3b.cptx86.com 3.3-11-g9b1f718 
#	display a list of untracked files at end, closes #10 

class HelloWorld
   def initialize(name)
      @name = name.capitalize
   end
   def sayHi
      puts "Hello #{@name}!"
   end
end

hello = HelloWorld.new("World")
hello.sayHi
