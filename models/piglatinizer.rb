require 'pry'
class PigLatinizer

  def initialize(text = "")
    piglatinize(text)
  end

  def vowel?(word)
    word.match(/AEIOUaeiou/)
  end

  def consonant?(word)
    !vowel?(word)
  end

  def piglatinize_word(word)
    if vowel?(word[0])
      word = word + "way"
    elsif consonant?(word[0]) && vowel?(word[1])
      word = word.slice(1..-1) + word.slice(0) + "ay"
    elsif consonant?(word[0]) && consonant?(word[1]) && vowel?(word[2])
        word = word.slice(2..-1) + word.slice(0, 2) + "ay"
    elsif consonant?(word[0]) && consonant?(word[1]) && consonant?(word[2]) && vowel?(word[3])
        word = word.slice(3..-1) + word.slice(0, 3) + "ay"
    end
    word

  end

  def piglatinize_sentense(sentence)
    sentence = sentence.split(" ")
    sentence.collect {|word| piglatinize(word)}.join(" ")
  end

  def piglatinize(input)
    input = input.split(" ")
    if input.length > 1
      piglatinize_sentense(input)
    else
      piglatinize_word(input)
    end
    binding.pry
  end

end
