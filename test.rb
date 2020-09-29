a = [1,2,4]
r = 1..10
proc = Proc.new { |i| i**3 }

p r.map{|i| i ** 5}
