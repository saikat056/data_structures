# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  return 0 if needle == ""
  ff = initialize_ff(needle)
  i=j=0
  while j < haystack.size
    if needle[i] == haystack[j]
      return j - i if i == needle.size - 1
      i +=1
    else
      i = ff[i - 1] while i!=0 && (haystack[j] != needle[i])
      i += 1 if haystack[j] == needle[i]
    end
    j += 1
  end
  return -1  
end

def initialize_ff(needle)
  ff = []
  i= 0
  j = 1
  ff << 0
  while j < needle.size
    if needle[i] == needle[j]
      ff << i + 1
      i += 1
    else
      if i == 0
        ff << 0
      else
        i = ff[i - 1] while i != 0 && needle[i] != needle[j]
        if needle[i] == needle[j] 
          ff << i + 1
          i += 1
        else
          ff << 0
        end
      end
    end
    j += 1
  end
  ff
end
