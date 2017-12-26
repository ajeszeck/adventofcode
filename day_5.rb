# Positive jumps ("forward") move downward; negative jumps move upward. For legibility in this example, these offset values will be written all on one line, with the current instruction marked in parentheses. The following steps would be taken before an exit is found:
#
# (0) 3  0  1  -3  - before we have taken any steps.
# (1) 3  0  1  -3  - jump with offset 0 (that is, don't jump at all). Fortunately, the instruction is then incremented to 1.
#  2 (3) 0  1  -3  - step forward because of the instruction we just modified. The first instruction is incremented again, now to 2.
#  2  4  0  1 (-3) - jump all the way to the end; leave a 4 behind.
#  2 (4) 0  1  -2  - go back to where we just were; increment -3 to -2.
#  2  5  0  1  -2  - jump 4 steps forward, escaping the maze.
# In this example, the exit is reached in 5 steps.


# convert input into array

# create variable to hold current value

# then use current value to jump using that instruction, then increment the current value by 1

# continue until the current value variable is set to nil because it is beyond the length of the array

def convert_input(file_name)
  input = File.read(file_name).split(/\n/)
  input.map! { |number| number.to_i }
  input
end

input = convert_input("example5.txt")


def escape_maze(input)
  step_count = 0
  previous_index = nil
  current_index = input[0]

  while current_index != nil
    if input[current_index] == 0
      previous_index = current_index
      current_index += input[previous_index]
      input[previous_index] += 1
    else
      previous_index = current_index
      if input[previous_index] == nil
        return "step count: #{step_count}"
      else
        current_index += input[previous_index]
        input[previous_index] += 1
      end
    end
    step_count += 1
    p "INPUT[0] = #{input[0]}"
    p "INPUT[1] = #{input[1]}"
    p "INPUT[2] = #{input[2]}"
    p "INPUT[3] = #{input[3]}"
    p "INPUT[4] = #{input[4]}"

    p "step count is #{step_count}"
    p "*" * 50
  end
  p "step count: #{step_count}"
end

p escape_maze(input)
