def convert_input(file_name)
  input = File.read(file_name).split(/\n/)
  input
end
# Create a method to check if a word is an anagram of any of the keys already in the tally

def anagram?(tally, word)
  boolean = false
  tally.keys.each do |key|
    if key.split('').all? { |letter| word.include?(letter) }
      boolean = true
    end
  end
  boolean
end

input = convert_input("4.txt")
valid_phrases = 0
invalid_phrases = 0
# Turn input into arrays of arrays
input.map do |phrase_string|
  word_tally = phrase_string.split(" ").reduce({}) do |tally, word|
    if tally.keys.none? { |key| anagram?(tally, word) }
      if tally[word] == nil
        tally[word] = 0
      end
      tally[word] += 1
      tally
    else
      if tally["anagram"] == nil
        tally["anagram"] = 0
      end
      tally["anagram"] += 1
    end
    tally
  end
  if word_tally.keys.include?("anagram")
    invalid_phrases += 1
  else
    if word_tally.values.all? { |value| value == 1}
      valid_phrases += 1
    else
      invalid_phrases += 1
    end
  end
end

p valid_phrases
p invalid_phrases

## THIS ANSWER IS 8 OFF OF WHAT IT SHOULD BE. WIP.
