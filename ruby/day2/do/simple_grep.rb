File.foreach('resources/file.txt') do |line| 
    puts "#{$.} #{line}" if line.match /ruby is nice/
end
