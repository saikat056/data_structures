Given an array of strings words (without duplicates), return all the concatenated words in the given list of words.

A concatenated word is defined as a string that is comprised entirely of at least two shorter words in the given array.

Input: words = ["cat","cats","catsdogcats","dog","dogcatsdog","hippopotamuses","rat","ratcatdogcat"]
Output: ["catsdogcats","dogcatsdog","ratcatdogcat"]
Explanation: "catsdogcats" can be concatenated by "cats", "dog" and "cats"; 
"dogcatsdog" can be concatenated by "dog", "cats" and "dog"; 
"ratcatdogcat" can be concatenated by "rat", "cat", "dog" and "cat".

class Trie
  attr_accessor :val, :children, :is_word

  def initialize(c=nil)
    @val = c
    @children = {}
    @is_word = false
  end
end

def find_all_concatenated_words_in_a_dict(words)
  trie = gen_trie(words)
  res = []  
  
  words.each{|w| find_con(w, trie, 0, res, 0)}
  
  res.uniq
end

def find_con(w, trie, i, res, count)
  n = w.size
  
  return res << w if i == n && count > 1
  
  node = trie
  j = i
  
  while j < n do
    node = node.children[w[j]]
    
    return if node.nil?
    
    if node.is_word
      find_con(w, trie, j+1, res, count + 1)
    end
    
    j += 1
  end
end

def gen_trie(words)
  trie = Trie.new
  
  words.each do |w|
    node = trie
    
    w.chars.each do |c|
      node.children[c] ||= Trie.new(c)
      node = node.children[c]
    end
    
    node.is_word = true
  end
  
  trie
end
