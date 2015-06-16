def count_by(x, n)
  a = []
  (1..n).each do |i|
    a << i*x
  end
  a
end