require_relative 'solution'

print 'テストケース数(n): '
n = gets.chomp.to_i
n.times do |i|
  while 1 do
    print "ケース#{i+1}: "
    elms = gets.chomp.split(' ')
    if elms.length != 3
      print "「難解な文字列」「文字列の要件」「強度の要件」の3要素を半角スペース区切りで入力してください\n"
      next
    end
    if elms[0] =~ /[^0-9a-z]/
      print "「難解な文字列」は半角英数字（0-9a-z）で入力してください\n"
      next
    end
    if elms[1] =~ /[^0-9a-z\.\*]/
      print "「文字列の要件」は半角英数字（0-9a-z）'.' '*' で入力してください\n"
      next
    end
    if elms[2] =~ /[^0-9]/
      print "「強度の要件」は半角数字で入力してください\n"
      next
    end
    answer = solution(elms[0].to_s, elms[1].to_s, elms[2].to_i)
    print "最弱強度は #{answer} です\n"
    break
  end
end
