puts "Пожалуйста, введите Ваше имя: "
name = gets.chomp
puts "Введите Ваш рост:"
growth = gets.to_i
weight = growth - 110
if weight > 0
  puts "Уважаемый #{name}, Ваш идеальный вес: #{weight}"
else 
  puts "Уважаемый #{name}, Ваш вес уже идеальный!"
end
