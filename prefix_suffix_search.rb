class WordFilter
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


=begin
    :type words: String[]
=end
    attr_accessor :trie, :w_hash
    
    def initialize(words)
      @trie = Trie.new
      @w_hash = {}
      
      (0..(words.size - 1)).each do |i|
        all_hash_words(words[i]).each do |mw|
           @trie.add_word(mw)
        end
          
        @w_hash[words[i]] = i 
      end
    end

    def all_hash_words(str)
      arr = ['#' + str]
      str.chars.reverse_each do |c|
        arr << (c + arr[-1])
      end
      arr
    end

=begin
    :type prefix: String
    :type suffix: String
    :rtype: Integer
=end
    def f(prefix, suffix)
      sw = suffix + "#" + prefix
      res = []
      words = trie.find_words_starting_with(sw)
        
      words.each do |w|
        res << w.split('#')[1]
      end
        
      return -1 if res.empty?
        
      indexes =  res.map{|r| w_hash[r]}
      indexes.max
    end


end

# Your WordFilter object will be instantiated and called as such:
# obj = WordFilter.new(words)
# param_1 = obj.f(prefix, suffix)
