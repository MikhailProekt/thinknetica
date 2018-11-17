sides_triangle = []
puts "Введите сторону треугольника а:"
sides_triangle << gets.chomp.to_f
puts "Введите сторону треугольника b:"
sides_triangle << gets.chomp.to_f
puts "Введите сторону треугольника c:"
sides_triangle << gets.chomp.to_f
a, b, c = sides_triangle.sort!
if a**2 + b**2 == c**2
  puts "Ваш треугольник прямоугольный"
else 
  puts "Ваш треугольник не прямоугольный"
end
if a == b && b == c
  puts "Ваш треугольник равнобедренный и равносторонний, но не прямоугольный"
elsif a == b || a == c || b == c
  puts "Ваш треугольник равнобедренный"
end
