def solution(n, m, maze)
  n.to_s + ':' + m.to_s

  # start/goalの位置を特定する
  start = getOnePosition('s', maze)
  goal = getOnePosition('g', maze)
  # todo: 's'と'g'の数のチェック（１個もない場合とか２個以上ある場合とかどこで制御しようか）

  # 's'から各セルへの到達歩数を記録する(未到達の場合(と's')は0)
  step_logs = Array.new(n).map{Array.new(m){0}}

  # startをqueueに入れる
  queue = []
  queue.push(start)

  # queueが空になるまで繰り返す
  while current = queue.shift # queueの先頭のセルを取得する(current)
    # 計算効率化:
    #   step_logsにすでに'g'の記録があり
    #   currentへの到達歩数+1 >= 'g'への到達歩数 ならば調べてもより良い解は得られない -> 次のqueueへ
    next if step_logs[goal[0]][goal[1]] != 0 && step_logs[current[0]][current[1]] + 1 >= step_logs[goal[0]][goal[1]]

    # currentから上下左右のどれかのセルへの移動を試みる
    [[-1, 0], [1, 0], [0, -1], [0, 1]].each { |direction|
      row = current[0] + direction[0]
      col = current[1] + direction[1]

      # 迷路の外には出れない -> 別の方向へ
      next if row < 0 || row > n-1 || col < 0 || col > m-1
      # 通過不可能地点には行けない、's'に戻っても意味ない -> 別の方向へ
      next if maze[row][col] === 'x' || maze[row][col] === 's'

      # currentから[row,col]に行く場合の's'からの到達歩数(step)
      add = maze[row][col] === 'o' ? 2 : 1
      step = step_logs[current[0]][current[1]] + add

      # すでに到達歩数が記録されており、その歩数がstepよりも小さい場合は記録しない -> 別の方向へ
      next if step_logs[row][col] != 0 && step_logs[row][col] < step

      # 到達歩数を記録して、[row,col]をqueueに入れる
      step_logs[row][col] = step
      queue.push([row, col])
    }
  end

  step_logs[goal[0]][goal[1]]
end

def getOnePosition(target, maze)
  row_num = col_num = nil
  maze.each_with_index {|row, i|
    if row.include?(target)
      row_num = i
      col_num = row.index(target)
      break
    end
  }
  [row_num, col_num]
end