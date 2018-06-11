def solution(original_text, pattern, lower_limit)

  regex = patternToRegex(pattern)
  queue = []
  queue.push(original_text)

  # マッチした文字列を記録するハッシュを用意しておく
  calculated = {}
  # 最小強度を記録する変数を用意する
  answer = -1

  # queueが空になる(もしくは強度がlower_limitと一致する)まで繰り返し
  while current = queue.shift

    # current文字列中のregexにマッチする最長文字列を取得する
    arr = current.scan(regex)
    #マッチする文字列がない場合は次のqueueへ
    next if arr.length === 0

    matched = arr[0]
    # matchedがすでに記録済みの場合は次のqueueへ
    next if calculated.has_key?(matched)

    # matchedの強度を計算する
    strength = calculateStrength(matched)
    calculated["#{matched}"] = strength

    # strength < lower_limit -> 次のqueueへ
    next if strength < lower_limit

    # strength < answer (またはanswerが未記録(-1)) の時だけanswerを更新
    if answer === -1 || strength < answer
      answer = strength
    end
    # strength === lower_limit の時、break
    break if strength === lower_limit

    # matchedの左１文字を削ったものと右１文字削ったものをそれぞれqueueに追加
    queue.push(matched.slice(1..-1))
    queue.push(matched.chop)
  end

  answer
end

def patternToRegex(pattern)
  txt = pattern.gsub(/\*/,'.+')
  /#{txt}/
end

def calculateStrength(text)
  v = strengthDef
  sum = 0
  text.chars {|ch| sum += v[ch]}
  sum
end

def strengthDef()
  {
      '0' => 0,
      '1' => 1,
      '2' => 2,
      '3' => 3,
      '4' => 4,
      '5' => 5,
      '6' => 6,
      '7' => 7,
      '8' => 8,
      '9' => 9,
      'a' => 1,
      'b' => 2,
      'c' => 3,
      'd' => 4,
      'e' => 5,
      'f' => 6,
      'g' => 7,
      'h' => 8,
      'i' => 9,
      'j' => 10,
      'k' => 11,
      'l' => 12,
      'm' => 13,
      'n' => 14,
      'o' => 15,
      'p' => 16,
      'q' => 17,
      'r' => 18,
      's' => 19,
      't' => 20,
      'u' => 21,
      'v' => 22,
      'w' => 23,
      'x' => 24,
      'y' => 25,
      'z' => 26,
  }
end