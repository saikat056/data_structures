# https://leetcode.com/problems/minimize-max-distance-to-gas-station/


# @param {Integer[]} stations
# @param {Integer} k
# @return {Float}
def minmax_gas_dist(stations, k)
  lo = 0 
  hi = 10**8
    
  while (hi - lo) > 10**-6 do
    mid = (hi + lo).to_f / 2
      
    if bs(mid, stations, k)
      hi = mid
    else
      lo = mid
    end
  end
    
  lo
end

def bs(d, stations, k)
  used = 0
  n = stations.size
    
  (1..(n-1)).each do |i|
    used +=  ((stations[i] - stations[i-1]) / d).floor
  end
    
  used <= k
end
