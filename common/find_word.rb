Input: board = [["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]], words = ["oath","pea","eat","rain"]
Output: ["eat","oath"]

def find_words(board, words)
  m = board.size
  n = board.first.size
  out = []

  # O(m*n)
  s_hash = cal_start_positions(board, words)

  # O(words.size)
  words.each do |w|
    s_arr = s_hash[w[0]]

    # O(m*n)
    s_arr.each do |s|
      # O(w.size)
      found = find?(board, {}, s, w, 0)

      if found
        out << w
        break
      end
    end
  end

  out
end

def cal_start_positions(b, words)
  hash = {}
  words.each do |w|
    hash[w[0]] = []
  end

  m = b.size
  n = b.first.size

  (0..(m-1)).each do |i|
    (0..(n-1)).each do |j|
      if hash[b[i][j]]
        hash[b[i][j]] << [i,j]
      end
    end
  end

  hash
end

def find?(b, visited, s, w, i)
  m = b.size
  n = b.first.size

  return false if visited[s]

  return false if i >= w.size

  return false if w[i] != b[s[0]][s[1]]

  return true if i == w.size - 1

  visited[s] = true

  found  = false
  found ||= find?(b, visited, [s[0]+1, s[1]], w, i+1) if (s[0]+1 < m)
  return true if found

  found ||= find?(b, visited, [s[0]-1, s[1]], w, i+1) if (s[0]-1 >= 0)
  return true if found

  found ||= find?(b, visited, [s[0], s[1]+1], w, i+1) if (s[1]+1 < n)
  return true if found

  found ||= find?(b, visited, [s[0], s[1]-1], w, i+1) if (s[1]-1 >= 0)
  return true if found

  visited[s] = false
  return false
end

Time
----
  T = O(w.size*m*n*each_w.size)

  w = total number of words
  x = max length of a word
  T = O(w*x*m*n)

Space
-----
  S = O(m*n)

Test
----
i = 1
s = [0,0],[1,0],[0,1]
visited = {[0,0]: true, [0,1]: true, [1,1]: true}
m = 4
n = 4
w = "oath"
w.size = 4

b     =    o a a n
           e t a e
           i h k r
           i f l v

oath
