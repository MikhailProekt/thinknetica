puts "Введите коэффициент а:"
a = gets.strip.to_i
puts "Введите коэффициент b:"
b = gets.strip.to_i
puts "Введите коэффициент c:"
c = gets.strip.to_i
e = 4*a*c
f = b**2
d = f - e
if d < 0
  puts "Дискриминант: #{d}, корней нет"
elsif d == 0
  x = -b/(2*a)
  puts "Дискриминант: #{d}, корни равны #{x}"
else
  x1 = (-b + Math.sqrt(d))/(2*a)
  x2 = (-b - Math.sqrt(d))/(2*a)
  puts "Дискриминант: #{d}, корни уравнения: #{x1},#{x2}"
end
