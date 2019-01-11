class Map
    attr_reader :map
    def initialize
        @map = []
    end 

    def set(key, value)
        @map.each do |ele|
           return if ele[0] == key
        end 

        @map << [key, value]
    end 

    def get(key)
        @map.each do |ele|
           ele[1] if ele[0] == key
        end 
    end 

    def delete(key)
        @map.each do |ele|
           @map.delete(ele) if ele[0] == key
        end 
    end 

    def show
        @map
    end 
end 

"As you saw in the videos for tonight, a map can be implemented using a 2D array. 
Let's write a Map class (following a similar pattern to Stack and Queue) that 
implements a map using only arrays."

"Remember, a map stores information in key-value pairs, where the keys are 
always unique. When implemented with arrays, a map might look something 
like this: my_map = [[k1, v1], [k2, v2], [k3, v2], ...]."

"Our Map class should have the following instance methods: set(key, value), 
get(key), delete(key), show. Note that the set method can be used 
to either create a new key-value pair or update the value for a pre-existing 
key. It's up to you to check whether a key currently exists!

As always, test your code thoroughly to make sure all properties of maps are enforced."

m = Map.new

p m.map

letters = ("a".."z").to_a
numbers = (1..26).to_a

26.times do |i|
    m.set(letters[i], numbers[i])
end 

p m.set("k", 0)
p m.map

p m.show

