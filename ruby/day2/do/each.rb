# just each

temp = []
(1..16).each do |e|
    temp << e
    if temp.length == 4
        puts temp.inspect
        temp.clear
    end
end

puts

# each_slice

(1..16).each_slice(4) {|a| puts a.inspect}
