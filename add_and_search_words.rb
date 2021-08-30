class WordDictionary
 class Node
  attr_accessor :word, :value, :next
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

  def find_suffix(base, suf)
     len = suf.size
      
     chars = []
      
     if suf[0] == '.'
       chars = base.next.keys
     else
       chars << suf[0]
     end
      
     match_found = false
     chars.each do |c|
       next_node = base.find_char(c)
      
       return next_node.word if next_node && suf.size == 1
     
       match_found = find_suffix(next_node, suf[1, len - 1])  if next_node
         
       return true if match_found
     end
      
     false
  end
    
  def find_word(word)
    find_suffix(@root, word)
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


=begin
    Initialize your data structure here.
=end
    def initialize()
      @trie = Trie.new
    end


=begin
    :type word: String
    :rtype: Void
=end
    def add_word(word)
      @trie.add_word(word)
    end


=begin
    :type word: String
    :rtype: Boolean
=end
    def search(word)
       @trie.find_word(word)
    end


end

# Your WordDictionary object will be instantiated and called as such:
# obj = WordDictionary.new()
# obj.add_word(word)
# param_2 = obj.search(word)
