require "byebug"

fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(input)
    # debugger
    longest = ""
    input.each_with_index do |fish1, index|
        input.each_with_index do |fish2, index2|
            if index2 > index 
                if fish1.length > fish2.length && fish1.length > longest.length
                    longest = fish1
                elsif fish2.length > fish1.length && fish2.length > longest.length
                    longest = fish2
                end 
            end 
        end 
    end 

    longest
end 

print "sluggish_octopus> "
p sluggish_octopus(fish_arr)
puts

def dominant_octopus(input)
    return input if input.count == 1
    mid_idx = input.length/2
    # debugger
    left = dominant_octopus(input.take(mid_idx))
    right = dominant_octopus(input.drop(mid_idx))    

    merge(left, right)
end 

def merge(l, r)
    return l if r.empty?
    return r if l.empty?
    # debugger
    if l[0].length <= r[0].length
        [l.shift] +  merge(l, r)
    elsif l[0].length > r[0].length
        [r.shift] +  merge(l, r)
    end
end

print "dominant_octopus> "
p dominant_octopus(fish_arr)[-1]
puts

def clever_octopus(input)
    # debugger
    longest = ""
    input.each_with_index do |fish1, index|
        longest = fish1 if fish1.length > longest.length
    end 

    longest
end 

print "clever_octopus> "
p clever_octopus(fish_arr)
puts

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left", "left-up" ]

def slow_dance(direction, tiles_array)
    tiles_array.each_index do |i|
        return i if tiles_array[i] == direction
    end
end 

puts "slow dance octopus"
p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)
puts

new_tiles_data_structure = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6, "left-up" => 7 }

def fast_dance(direction, new_tiles_data_structure)
    new_tiles_data_structure[direction]
end 

puts "fast dance octopus"
p fast_dance("up", new_tiles_data_structure)
p fast_dance("right-down", new_tiles_data_structure)
puts