puts "Введите число:"
date = gets.chomp.to_i

puts "Введите месяц (порядковый номер месяца в году):"
month = gets.chomp.to_i

puts "Введите год:"
year = gets.chomp.to_i

months_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

res = months_days[0..month-1].reduce(:+) - (months_days[month-1] - date)

if ( year % 400 == 0 || year % 4 == 0 && year % 100 != 0 ) && ( month > 2 )
	res += 1
end

puts res
