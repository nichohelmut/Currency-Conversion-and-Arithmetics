# require_relative 'foreign_exchange'

# class Arithmetic < Money
#   attr_accessor :value

#   # def initialize(v)
#   #   self.value = v
#   # end

#   def +(other)
#     # + means convert both variables and add in the same currency
#     self.class.new(value + other.value)
#   end

#   def subtract

#   end

#   def multiply

#   end

#   def divide

#   end

# end

# # class Foo
# #   attr_accessor :value
# #   def initialize( v )
# #     self.value = v
# #   end
# #   def *(other)
# #     self.class.new(value*other.value)
# #   end
# # end

# # a = Foo.new(6)
# # #=> #<Foo:0x29c9920 @value=6>

# # b = Foo.new(7)
# # #=> #<Foo:0x29c9900 @value=7>

# # c = a*b
# # #=> #<Foo:0x29c98e0 @value=42>
