class Order
  attr_accessor :amount, :status

  def initialize(amount, status)
    @amount, @status = amount, status
    @mutex = Mutex.new
  end

  def pending?
    status == 'pending'
  end

  def collect_payment
    @mutex.synchronize do
      if pending?
        puts "Collecting payment..."
        self.status = 'paid'
      end
    end
  end
end

order = Order.new(100.00, 'pending')

5.times.map do
  Thread.new do
    order.collect_payment
  end
end.each(&:join)
