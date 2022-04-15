#  Regular Expression Matching

Input: s = "aab", p = "c*a*b"
Output: true
Explanation: c can be repeated 0 times, a can be repeated 1 time. Therefore, it matches "aab".
  
Input: s = "mississippi", p = "mis*is*p*."
Output: false

Input: s = "ab", p = ".*"
Output: true
Explanation: ".*" means "zero or more (*) of any character (.)".

Test
----
s = "aab", p = "c*a*b"
state_machine

states = [0,1,2,3]

state_hash[0] = nil
state_hash[1] = ['c', '*']
state_hash[2] = ['a', '*']
state_hash[3] = ['b']

tran = {0:1, 1:2, 2:3}

Test
----
Input: s = "ab", p = ".*"

states = [0,1]
state_hash[0] = nil
state_hash[1] = ['.', '*']
tran = { 0:1 }


def is_match(s, p)
  states, state_hash, tran = state_machine(p)
  c_state = states[0]
  c_state = tran[c_state] if state_hash[c_state].nil?
  cs = state_hash[c_state]
  
  puts state_hash
  
  s.chars.each do |c|  
    while (cs[0] != c) || (cs[0] != '.')
      return false if cs.size == 1
      
      c_state = tran[c_state]
      cs = state_hash[c_state]
    end
  end
  
  states[-1] == c_state
end

def state_machine(p)
  tran = {}
  state_hash = {}
  states = [0]
  sc = 1 # state count
  
  (1..(p.size - 1)).each do |i|
     next if p[i-1] == '*'
    
     state_hash[sc] = (p[i] == '*') ? [p[i-1], p[i]] : [p[i-1]]
     tran[states[-1]] = sc
     states << sc
     sc += 1 
  end
  
  if p[-1] != '*'
    state_hash[sc] = p[-1]
    tran[states[-1]] = sc
    states << sc
    sc += 1
  end
  
  [states, state_hash, tran]
end

Test
----
s = "aab", p = "c*a*b"
state_machine

states = [0,1,2,3]

state_hash[0] = nil
state_hash[1] = ['c', '*']
state_hash[2] = ['a', '*']
state_hash[3] = ['b']

tran = {0:1, 1:2, 2:3}
