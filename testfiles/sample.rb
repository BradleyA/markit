#
# 	testfiles/sample.rb  3.126.282  2018-10-23T22:00:44.221633-05:00 (CDT)  https://github.com/BradleyA/markit  bradley  zero.cptx86.com 3.125-2-gb772e50  
# 	   added comment on how to run sample code for c ruby scala go 
# 	sample.rb  3.38.179  2018-08-04_13:18:57_CDT  https://github.com/BradleyA/markit  uadmin  three-rpi3b.cptx86.com 3.37  
# 	   New release not backward compatible with markchaeck because of formatting 
#
#	ruby sample.rb
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
