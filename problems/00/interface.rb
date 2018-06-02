require_relative 'solution'

print "入力された数字のFizzBuzzを答えます\n終了したいときは end と入力してください\n\n"
print '入力: '
while val = gets
  break if val.to_s.chomp === 'end'
  res = solution(val.to_i)
  puts '出力: ' + res
  print "\n入力: "
end