puts "Введите коэффициент а:"
a = gets.to_f
puts "Введите коэффициент b:"
b = gets.to_f
puts "Введите коэффициент c:"
c = gets.to_f
d = b**2 - 4 * a * c
if d < 0
  puts "Дискриминант: #{d}, корней нет"
elsif d == 0
  x = -b / (2 * a)
  puts "Дискриминант: #{d}, корни равны #{x}"
else
  e = Math.sqrt(d)
  x1 = (-b + e) / (2 * a)
  x2 = (-b - e) / (2 * a)
  puts "Дискриминант: #{d}, корни уравнения: #{x1},#{x2}"
end
