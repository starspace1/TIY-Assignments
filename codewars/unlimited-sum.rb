def sum(*n)
 n.delete_if {|val| !val.is_a?(Integer) }
 n.inject(0) { |sum, value| sum + value }
end