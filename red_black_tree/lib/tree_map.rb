require 'red_black_tree'

class TreeMap < RedBlackTree
  def initialize
    super
  end

  def flooring_key(key)
    find_key_with_operator(key, :>=)
  end

  def lower_key(key)
    find_key_with_operator(key, :>)
  end

  def ceiling_key(key)
    find_key_with_operator(key, :<=)
  end

  def higher_key(key)
    find_key_with_operator(key, :<)
  end
end
