module FunWithStrings
  def palindrome?
    (str = self.gsub(/(\W|\d)/, "").downcase) == str.reverse
  end
  def count_words
    Hash.new(0).tap {|hash| (self.gsub(/[^\w\s]/, "").downcase).split.each { |word| hash[word] += 1} }
  end
  def anagram_groups
    self.gsub(/[^\w\s]/, "").split.group_by { |word| word.downcase.chars.sort}.values
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
