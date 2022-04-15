GC.start
before = GC.stat(:total_freed_objects)

RETAINED = []
100_000.times do
     foo =  "a string"
end

GC.start
after = GC.stat(:total_freed_objects)
puts "Objects Freed: #{after - before}"
