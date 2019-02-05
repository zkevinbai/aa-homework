class Queue 
    attr_reader :queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue.push(el)
    end 

    def dequeue
        @queue.shift
    end 

    def peek
        @queue[0]
    end 
end 


# Now let's write a Queue class. We will need the following instance methods: 
# enqueue(el), dequeue, and peek.

# Test your code to ensure it follows the principle of FIFO.

# q = Queue.new()

# p q.queue

# a = (1..8).to_a

# a.each do |a|
#     p q.enqueue(a)
# end 

# p q.peek

# p q.dequeue

# p q.queue
