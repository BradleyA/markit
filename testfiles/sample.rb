#
# 	sample.rb  3.38.179  2018-08-04_13:18:57_CDT  https://github.com/BradleyA/markit  uadmin  three-rpi3b.cptx86.com 3.37  
# 	   New release not backward compatible with markchaeck because of formatting 
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
