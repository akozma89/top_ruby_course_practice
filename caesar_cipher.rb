# frozen_string_literal: true
SMALL_ALPHABET = ("a".."z").to_a
LARGE_ALPHABET = ("A".."Z").to_a

def find_ciphered_character(character, rotation)
  if SMALL_ALPHABET.include?(character)
    SMALL_ALPHABET.rotate(rotation)[SMALL_ALPHABET.index(character)]
  elsif LARGE_ALPHABET.include?(character)
    LARGE_ALPHABET.rotate(rotation)[LARGE_ALPHABET.index(character)]
  else
    character
  end
end

def perform_caesar_cipher(input_string = "", rotation = 5)
  input_string.chars.map { |character| find_ciphered_character(character, rotation) }.join
end

puts "What do you want to convert?"
print perform_caesar_cipher(gets)

# "What a string!", 5
# "Bmfy f xywnsl!"