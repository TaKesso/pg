require_relative 'solution'

print "迷路の最短歩数を求めます\n\n"
print '迷路の大きさ(n行 m列 *半角スペース区切りの半角数字): '
arr = gets.chomp.split(' ')
n = arr[0].to_i
m = arr[1].to_i
print "迷路の要素( s g . o x ): \n"
while 1 do
  maze = []
  n.times do |i|
    while 1 do
      print "　#{i+1}行目(#{m}個の要素): "
      maze_elms = gets.chomp.split(' ')
      if maze_elms.length === m
        maze.push(maze_elms)
        break
      else
        print "　要素数が間違っています。もう一度入力してください\n"
      end
    end
  end
  flatten = maze.flatten
  s_count = flatten.count('s')
  g_count = flatten.count('g')
  if s_count != 1 || g_count != 1
    print "迷路には要素sと要素gが必ず1つずつ存在しなければなりません。迷路を作り直してください。\n"
    next
  end
  dot_count = flatten.count('.')
  hole_count = flatten.count('o')
  x_count = flatten.count('x')
  if s_count + g_count + dot_count + hole_count + x_count != flatten.length
    print "迷路に使えない要素が含まれています。使える要素は s g . o x の5種類です。迷路を作り直してください。\n"
    next
  end
  break
end

print "\n\n以下の#{n}行x#{m}列の迷路\n"
maze.each do |row|
  print "　#{row.join(' ')}\n"
end
step = solution(n, m, maze)
print "の最短歩数は #{step}歩 です。\n"
