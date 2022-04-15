# BiNode. Convert a binary search tree to a doubly-linked list

class Node
  attr_accessor :left, :right, :val

  def initialize(val, left, right)
    @val = val
    @left = left
    @right = right
  end
end

n5 = Node.new(5, nil, nil)
n4 = Node.new(4, nil, nil)
n0 = Node.new(0, nil, nil)
n1 = Node.new(1, nil, nil)
n2 = Node.new(2, nil, nil)
n3 = Node.new(3, nil, nil)

n4.left = n2
n4.right = n5
n2.left = n1
n2.right = n3
n1.left = n0

        n4
      /.   \
    n2.     n5
   /. \
  n1.  n3
/
n0

head = n0 <-> n1 <-> n2 <-> ...

def convert(n)
  head_arr = []
  tail = in_dfs(n, head_arr)
  head = head_arr[0]

  # make the list circular
  head.left = tail
  tail.right = head

  [head, tail]
end

def in_dfs(n, head)
  head << n if (head.empty? && n.left.nil? && n.right.nil?)

  if n.left
    n.left  = in_dfs(n.left, head)
    n.left.right = n
  end

  if n.right
    n.right = in_dfs(n.right, head)
    n.right.left = n
  end

  return n.right if n.right
  return n
end

Time
----
  T = O(n)

Space
-----
  S = O(1)
