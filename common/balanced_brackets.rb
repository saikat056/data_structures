def isBalanced(s)
  bracket_stack = []
  opening_bracket_hash =  {'(' => 1, '{' => 1, '[' => 1}
  closing_brackets_hash = { ')' => '(', '}' => '{', ']' => '['}
  (0..s.length-1).each do |index|
    if opening_bracket_hash[s[index]]
      bracket_stack.push(s[index])
    else
      return false if bracket_stack.empty? || (bracket_stack.last != closing_brackets_hash[s[index]])
      bracket_stack.pop
    end
  end
  true
end
