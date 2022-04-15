def word_break(s, word_dict)
  prefix_tree = PrefixTree.new
  prefix_tree.insert_dict(word_dict)
  node = prefix_tree.root
  return false if node == nil
  s.chars.each do |c|
    node = node.get_node_for(c)
    return false if node == nil
    node = prefix_tree.root if node.is_word
  end
  return false if node.letter != nil
  return true
end

class Node
  attr_accessor :letter, :next, :is_word
  def initialize(letter:, is_word:)
    @letter = letter
    @next = Array.new(26)
    @is_word = is_word
  end

  def get_node_for(letter)
    @next[letter.ord - 'a'.ord]
  end

  def set_node_for(letter, is_word)
    return @next[letter.ord - 'a'.ord] if @next[letter.ord - 'a'.ord]
    @next[letter.ord - 'a'.ord] = Node.new(letter: letter, is_word: is_word)
  end
end

class PrefixTree
  attr_reader :root
  def initialize
    @root = Node.new(letter: nil, is_word: false)
  end

  def insert_word(word)
    node = @root
    word.chars.each do |c|
      node = node.set_node_for(c, false)
    end
    node.is_word = true
  end

  def insert_dict(wordDict)
    wordDict.each do |word|
      insert_word(word)
    end
  end
end
