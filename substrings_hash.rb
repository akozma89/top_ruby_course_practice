# frozen_string_literal: true

DICTIONARY = %w[below down go going horn how howdy it i low own part partner sit].freeze

def substrings(input_string = '')
  words = split_into_words(input_string)

  count_word_occurrence(words)
end

def split_into_words(input_string)
  input_string.downcase.split
end

def count_word_occurrence(words)
  words.each_with_object({}) do |word, hash|
    DICTIONARY.each do |dictionary_word|
      if word.include?(dictionary_word)
        hash[dictionary_word] ||= 0
        hash[dictionary_word] += 1
      end
    end
  end
end

puts 'What would you like to check in dictionary?'
print substrings(gets)

# "below"
# {
#   "below" => 1,
#   "low" => 1
# }

# "Howdy partner, sit down! How's it going?"
# {
#   "down" => 1,
#   "go" => 1,
#   "going" => 1,
#   "how" => 2,
#   "howdy" => 1,
#   "it" => 2,
#   "i" => 3,
#   "own" => 1,
#   "part" => 1,
#   "partner" => 1,
#   "sit" => 1
# }
