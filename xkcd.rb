require 'thread'
require 'net/http'
mutex = Mutex.new
condvar = ConditionVariable.new
results = Array.new
Thread.new do
  10.times do
    sleep 3
    random_comic_url = "Location"
    mutex.synchronize do
      results << random_comic_url
      condvar.signal # Signal the ConditionVariable
    end
  end
end

comics_received = 0
until comics_received >= 10
  mutex.synchronize do
    if results.empty?
      puts "Before wait ... #{comics_received}"
      condvar.wait(mutex)
      puts "After wait ... #{comics_received}"
    end
    url = results.shift
    puts "You should check out #{url}"
  end

  comics_received += 1
end
