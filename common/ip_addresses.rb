input= "192.168.01.1"
ip_parts = ["192","168", "01", "1"]

def valid_ip_address(ip)
  return "Neither" if ip[0] == '.' || ip[0] == ':'
  return "Neither" if ip[-1] == '.' || ip[-1] == ':'
  
  ip_parts = ip.split('.')
  return parse_ip_4(ip_parts) if ip_parts.size == 4
  
  ip_parts = ip.split(':')
  return parse_ip_6(ip_parts) if ip_parts.size == 8
  
  "Neither"
end

def parse_ip_4(ip_parts)
  ip_parts.each do |part|
    return "Neither" if (part.size > 3 || part.size < 1)
    return "Neither" if (part[0] == '0' && part.size > 1)
    return "Neither" if invalid_num?(part)
    return "Neither" if (part.to_i < 0 || part.to_i > 255)
  end
  
  "IPv4"
end

def parse_ip_6(ip_parts)
  ip_parts.each do |part|
    return "Neither" if (part.size > 4 || part.size < 1)
    
    part.chars.each do |c|
      return "Neither" unless valid_hex?(c)
    end
  end
  
  "IPv6"
end

def invalid_num?(part)
  part.chars.each do |c|
    return true if (c < '0' || c > '9')
  end
  
  false
end

def valid_hex?(c)
  (c >= '0' && c <= '9') || (c >= 'a' && c <= 'f') || (c >= 'A' && c <= 'F')
end

Time complexity
----------------
n = number of chars in the ip string
T = O(n)

Test
----
ip = "192.168.01.1"

ip = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"

ip = "02001:0db8:85a3:0000:0000:8a2e:0370:7334"


