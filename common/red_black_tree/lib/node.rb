class Node
  attr_accessor :color, :key, :value, :left, :right, :p
  def initialize(k, v = nil)
    @key = k
    @value = v
  end
  
  def has_no_children?
    (left.key == nil) && (right.key == nil)
  end

  def has_no_left_child?
    left.key == nil
  end
  
  def has_no_right_child?
    right.key == nil
  end
  
  def is_left_child_of_parent?
    self == p.left
  end

  def is_right_child_of_parent?
    self == p.right
  end
end
