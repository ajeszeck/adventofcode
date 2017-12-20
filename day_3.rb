# 17  16  15  14  13
# 18   5   4   3  12
# 19   6   1   2  11
# 20   7   8   9  10
# 21  22  23  24  25
# NOTES IN NOTEBOOK

def layer(n)
  # find the layer that n is in
  return 1 if n == 1

  current_layer = 3
  until ((current_layer ** 2) >= n) && ( n >= ((current_layer - 2) ** 2) + 1)
    current_layer += 2
  end
  current_layer
end

def layer_size(layer)
  return 1 if layer == 1
  (layer ** 2) - ((layer - 2) ** 2)
end

def find_four_minimums(layer)
  # find the values of the squares directly to the n, e, w, and s sides of 1
  # check the distance between n and the closest mimumum sqaure value
  starting_number = ((layer - 2) ** 2)
  a = starting_number + (layer_size(layer) / 8)
  b = a + (layer_size(layer) / 4)
  c = a + (layer_size(layer) / 2)
  d = a + ((3 * layer_size(layer)) / 4)
  [a, b, c, d]
end

def find_closest(layer, n)
  closest_numbers = find_four_minimums(layer)
  closest_distance = nil

  closest_numbers.each do |number|
    closest_distance = (number - n).abs if closest_distance == nil
    if (number - n).abs < closest_distance
      closest_distance = (number - n).abs
    end
  end
  closest_distance
end

def calculateDistance(n)
  # add the minimum value to ((layer - 1) / 2)
  distance = find_closest(layer(n), n) + ((layer(n) - 1) / 2)
  distance
end

p calculateDistance(325489) #552
p calculateDistance(1024)


# PART 2
# Use a hash to store key value pairs of value - coordinates.
