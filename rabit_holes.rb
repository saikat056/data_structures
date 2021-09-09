===begin
You're having a grand old time clicking through the rabbit hole that is your favorite online encyclopedia.
The encyclopedia consists of NN different web pages, numbered from 11 to NN. There are MM links present across the pages, the iith of which is present on page A_iA 
i
​
  and links to a different page B_iB 
i
​
 . A page may include multiple links, including multiple leading to the same other page.
A session spent on this website involves beginning on one of the NN pages, and then navigating around using the links until you decide to stop. That is, while on page ii, you may either move to any of the pages linked to from it, or stop your browsing session.
Assuming you can choose which page you begin the session on, what's the maximum number of different pages you can visit in a single session? Note that a page only counts once even if visited multiple times during the session.

===end


n = 4
m = 4
a = [1, 2, 3, 4]
b = [4, 1, 2, 1]

n = 10
m = 9
a = [3, 2, 5, 9, 10, 3, 3, 9, 4]
b = [9, 5, 7, 8, 6, 4, 5, 3, 9]


n = 5
m = 6
a = [3, 5, 3, 1, 3, 2]
b = [2, 1, 2, 4, 5, 4]

links = {3: [2,5], 5:[1], 1:[4], 2:[4]}

def rabbit_hole(n, m, a, b)
  links = {}
  
  (0..(m-1)).each do |i|
    links[a[i]] ||= []
    links[a[i]] << b[i]
  end
  
  max_count = [-Float::INFINITY]
  
  links.keys.each do |k|
    traverse(k, links, {}, {}, max_count)
  end
  
  max_count[0]
end

def traverse(page, links, v_links, v_pages, max_count)
  v_pages[page] ||= 0
  v_pages[page] += 1
  
  max_count[0] = [v_pages.keys.count, max_count[0]].max
  
  
  if links[page]
    links[page].uniq.each do |i|
      next if v_links[[page, i]]
    
      v_links[[page, i]] = true
    
      traverse(i, links, v_links, v_pages, max_count)
    
      v_links[[page, i]] = false
    end
  end
  
  v_pages[page] -= 1
  v_pages.delete(page) if v_pages[page] == 0
end
