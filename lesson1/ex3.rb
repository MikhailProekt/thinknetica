puts "Введите сторону треугольника а:"
a = gets.strip.to_i
puts "Введите сторону треугольника b:"
b = gets.strip.to_i
puts "Введите сторону треугольника c:"
c = gets.strip.to_i
if a > b && a > c then
  if a**2 == b**2 + c**2
    puts "Ваш треугольник прямоугольный"
  else 
    puts "Ваш треугольник не прямоугольный"
  end
end
if b > a && b > c then 
  if b**2 == a**2 + c**2
    puts "Ваш треугольник прямоугольный"
  else 
    puts "Ваш треугольник не прямоугольный"
  end
end
if c > a && c > b then 
  if c**2 == a**2 + b**2
    puts "Ваш треугольник прямоугольный"
  else 
    puts "Ваш треугольник не прямоугольный"
  end
end
if a == b || a == c || b == c 
  puts "Ваш треугольник равнобедренный"
end
if a == b && b == c && a == c
  puts "Ваш треугольник равнобедренный и равносторонний, но не прямоугольный"
end