require 'color'
require 'node'

class RedBlackTree
  attr_accessor :nil_node, :root
  def initialize
    @root = @nil_node = Node.new(nil)
    @nil_node.color = Color::BLACK
  end

  def inorder_walk
    arr = []
    inorder_recur(root, arr)
    arr
  end

  def inorder_recur(x, arr)
    return arr << x.key if x.left == nil_node && x.right == nil_node
    inorder_recur(x.left, arr) if x.left != nil_node
    arr << x.key
    inorder_recur(x.right, arr) if x.right != nil_node
  end

  def tree_minimum(x)
    x = x.left while x.left != nil_node
    x
  end

  def tree_maximum(x)
    x = x.right while x.right != nil_node
    x
  end

  def flooring_key(key)
    find_key_with_operator(key, :<)
  end

  def lower_key(key)
    find_key_with_operator(key, :<=)
  end

  def ceiling_key(key)
    find_key_with_operator(key, :>)
  end

  def higher_key(key)
    find_key_with_operator(key, :>=)
  end

  def insert(z)
    y = nil_node
    x = root
    while x != nil_node
      y = x
      x = z.key < x. key ? x.left : x.right
    end
    z.p = y
    if y == nil_node
      @root = z
    elsif z.key < y.key
      y.left = z
    else
      y.right = z
    end
    z.left = nil_node
    z.right = nil_node
    z.color = Color::RED
    insert_fixup(z)
  end

  def delete(z)
    x = nil
    y = z
    y_org_color = y.color
    if z.left == nil_node
      x = z.right
      transplant(z, z.right)
    elsif z.right == nil_node
      x = z.left
      transplant(z, z.left)
    else 
      y = tree_minimum(z.right)
      y_org_color = y.color
      x = y.right
      if y.p == z
        x.p = y
      else 
        transplant(y, y.right)
        y.right = z.right
        y.right.p = y
      end
      transplant(z, y)
      y.left = z.left
      y.left.p = y
      y.color = z.color
    end
    delete_fixup(x) if y_org_color == Color::BLACK
  end

  private

  def insert_fixup(z)
    while z.p.color == Color::RED
      if z.p == z.p.p.left
        y = z.p.p.right
        if y.color == Color::RED
          z.p.color = Color::BLACK
          y.color = Color::BLACK
          z.p.p.color = Color::RED
          z = z.p.p
        elsif z == z.p.right
          z = z.p
          left_rotate(z)
        else
          z.p.color = Color::BLACK
          z.p.p.color = Color::RED
          right_rotate(z.p.p)
        end
      else
        y = z.p.p.left
        if y.color == Color::RED
          z.p.color = Color::BLACK
          y.color = Color::BLACK
          z.p.p.color = Color::RED
          z = z.p.p
        elsif z == z.p.left
          z = z.p
          right_rotate(z)
        else
          z.p.color = Color::BLACK
          z.p.p.color = Color::RED
          left_rotate(z.p.p)
        end
      end
    end
    @root.color = Color::BLACK
  end

  def left_rotate(x)
    y = x.right
    x.right = y.left
    y.left.p = x if y.left != nil_node
    y.p = x.p
    if x.p == nil_node
      @root = y
    elsif x == x.p.left
      x.p.left = y
    else
      x.p.right = y
    end
    y.left = x
    x.p = y
  end

  def right_rotate(y)
    x = y.left
    y.left = x.right
    x.right.p = y if x.right != nil_node
    x.p = y.p
    if y.p == nil_node
      @root = x
    elsif y == y.p.left
      y.p.left = x
    else
      y.p.right = x
    end
    x.right = y
    y.p = x
  end

  def transplant(u, v)
    if u.p == nil_node
      @root = v
    elsif u == u.p.left
      u.p.left = v
    else 
      u.p.right = v
    end
    v.p = u.p
  end

  def find_key_with_operator(key, op)
    return nil if root == nil_node
    return nil unless [:<, :<=, :>, :>=].include?(op)
    key_order, first_child, second_child  = ([:<, :<=].include?(op)) ? [:lower, :left, :right] : [:higher, :right, :left]
    return (key.send(op, root.key) ? nil : root.key) if root.has_no_children?

    node = root
    while(node) do
      if key.send(op, node.key)
        return send("find_#{key_order}_root_with_operator", key, node, op) if node.send("has_no_#{first_child}_child?")
        node = node.send(first_child)
      else
        return node.key if node.send("has_no_#{second_child}_child?")
        node = node.send(second_child)
      end
    end
    nil
  end

  def find_lower_root_with_operator(key, node, op)
    return nil unless [:<, :<=].include?(op)
    find_root_with_operator(key, node, op, :right)
  end

  def find_higher_root_with_operator(key, node, op)
    return nil unless [:>, :>=].include?(op)
    find_root_with_operator(key, node, op, :left)
  end

  def find_root_with_operator(key, node, op, child_order)
    return node.p.key if node.send("is_#{child_order}_child_of_parent?")
    node = node.p while ((node.key != nil) && (key.send(op, node.key)))
    node.key
  end

  def delete_fixup(x)
    w = nil
    while x != @root && x.color == Color::BLACK
      if x == x.p.left
        w = x.p.right
        if w.color == Color::RED
          w.color = Color::BLACK
          x.p.color = Color::RED
          left_rotate(x.p)
          w = x.p.right
        end
        if w.left.color == Color::BLACK && w.right.color == Color::BLACK
          w.color = Color::RED
          x = x.p
        elsif w.right.color == Color::BLACK
          w.left.color = Color::BLACK
          w.color = Color::RED
          right_rotate(w)
          w = x.p.right
        end
        w.color = x.p.color
        x.p.color = Color::BLACK
        w.right.color = Color::BLACK
        left_rotate(x.p)
        x = @root
      else
        w = x.p.left
        if w.color == Color::RED
          w.color = Color::BLACK
          x.p.color = Color::RED
          right_rotate(x.p)
          w = x.p.left
        end
        if w.right.color == Color::BLACK && w.left.color == Color::BLACK
          w.color = Color::RED
          x = x.p
        elsif w.left.color == Color::BLACK
          w.right.color = Color::BLACK
          w.color = Color::RED
          left_rotate(w)
          w = x.p.left
        end
        w.color = x.p.color
        x.p.color = Color::BLACK
        w.left.color = Color::BLACK
        right_rotate(x.p)
        x = @root
      end
    end
    x.color = Color::BLACK
  end
end

