def num_buses_to_destination(routes, source, target)
   stop_to_bus = {}
   bus_to_stop = {}
  
   n = routes.size
  
   (0..(n-1)).each do |bus|
     route = routes[bus]
     
     route.each do |stop|
       stop_to_bus[stop] ||= {}
       stop_to_bus[stop][bus] = true
       bus_to_stop[bus] ||= {}
       bus_to_stop[bus][stop] = true
     end
   end
        
   q = []
   v_stop = {}
   v_bus = {}
   
   q << [source, 0]
   v_stop[source] = true
  
   while !q.empty? do
     stop, d = q.shift
     
     return d if stop == target
     
     buses = stop_to_bus[stop].keys
     
     buses.each do |bus|
       if !v_bus[bus]
         bus_to_stop[bus].keys.each do |s|
           if !v_stop[s]
             q << [s, d+1]
             v_stop[s]  = true
           end
         end
       end
       
       v_bus[bus] = true
     end
   end
  
   -1
end
