sides_triangle = []
puts "Введите сторону треугольника а:"
sides_triangle << gets.chomp.to_f
puts "Введите сторону треугольника b:"
sides_triangle << gets.chomp.to_f
puts "Введите сторону треугольника c:"
sides_triangle << gets.chomp.to_f
sides_triangle.sort!
if sides_triangle[0] ** 2 + sides_triangle[1] ** 2 == sides_triangle[2] ** 2
  puts "Ваш треугольник прямоугольный"
else 
  puts "Ваш треугольник не прямоугольный"
end
if sides_triangle[0] == sides_triangle[1] && sides_triangle[1] == sides_triangle[2]
  puts "Ваш треугольник равнобедренный и равносторонний, но не прямоугольный"
elsif sides_triangle[0] == sides_triangle[1] || sides_triangle[0] == sides_triangle[2] || sides_triangle[1] == sides_triangle[2]
  puts "Ваш треугольник равнобедренный"
end
