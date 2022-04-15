class Node
  attr_accessor :word, :value
  def initialize(value)
    @value = value
    @word = false
    @next = {}
  end

  def find_char(value)
    @next[value]
  end

  def add_char(value)
    @next.merge!({ value => Node.new(value) })
    @next[value]
  end

  def children
    @next.values
  end
end

class Trie
  def initialize
    @root = Node.new('*')
  end

  def add_word(word)
    char_arr = word.chars
    base = @root
    char_arr.each { |c| base = base.find_char(c) || base.add_char(c) }
    base.word = true
  end

  def find_word(word)
    char_arr = word.chars
    base = @root
    char_arr.each { |c| base =  base.find_char(c) || (return false) }
    return base.word
  end

  def find_words_starting_with(prefix)
    char_arr = prefix.chars
    base = @root
    char_arr.each{|c| base = base.find_char(c) || (return [])}
    char_stack = []
    suffixes = []
    find_all_suffixes(base, char_stack, suffixes)

    return [prefix] if suffixes.empty?

    suffixes.map{|suffix| [prefix, suffix].join}
  end

  def find_all_suffixes(base, char_stack, suffixes)
    base.children.each do |child| 
      char_stack.push(child.value)
      suffixes.push(char_stack.join) if child.word
      find_all_suffixes(child, char_stack, suffixes)
      char_stack.pop
    end
  end
end

trie=Trie.new
trie.add_word("Hellboy")
trie.add_word("Hell")
trie.add_word("Hello")
trie.add_word("Dhaka")
puts trie.find_words_starting_with("He")
puts trie.find_words_starting_with("D")
