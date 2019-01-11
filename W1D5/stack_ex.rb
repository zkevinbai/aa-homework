 require "byebug"
 
 class Stack
    attr_reader :stack

    def initialize(stack=nil)
      # create ivar to store stack here!
      @stack || @stack = []
    end

    def push(el)
        # adds an element to the stack
        @stack.push(el)
    end

    def pop
      # removes one element from the stack
      if @stack.length != 0
        @stack.pop
      end
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @stack[-1]
    end
end

# Remember, a stack follows the principle of LIFO!

# s = Stack.new()

# p s.stack

# a = (1..8).to_a

# a.each do |a|
#     p s.push(a)
# end 

# p s.peek

# p s.pop

# p s.stack

