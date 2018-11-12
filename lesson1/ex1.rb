puts "Пожалуйста, введите Ваше имя: "
name = gets.strip
puts "Введите Ваш рост:"
growth = gets.strip.to_i
weight = growth - 110
if weight > 0
  puts "Уважаемый #{name}, Ваш идеальный вес: #{weight}"
elsif weight < 0
  puts "Уважаемый #{name}, Ваш вес уже идеальный!"
else
  puts "Уважаемый #{name}, Ваш вес не может быть равен нулю, что-то не так ;-)"
end
