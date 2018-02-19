#
# 	testfiles/sample.rb	3.5.126	2018-02-18_21:33:53_CST uadmin six-rpi3b.cptx86.com 3.4-23-g1090ede 
# 	   New release, all issues closed and tested, ready for production fix #12 
#
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
