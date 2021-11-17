puts "何本勝負？(press 1 or 3 or 5)"
num = gets.to_i
puts "#{num}本勝負を選びました\n\r"
$win = 0
$lose = 0


def janken()
  jankens = {"g" => "グー", "c" => "チョキ", "p" => "パー"}
  cpu = ["g", "c", "p"].sample
  player = gets.chomp.to_s
  
  puts "CPU…#{jankens[cpu]}"
  puts "あなた…#{jankens[player]}"
  
  if jankens[cpu] == jankens[player]
    puts "あいこで...(press g or c or p)"
    return true
  elsif (player == "g" && cpu == "c")||
        (player == "c" && cpu == "p")||
        (player == "p" && cpu == "g")
    puts "勝ち！"
    $win += 1
    puts "#{$win}勝#{$lose}敗\n\r"
    return false
  else 
    puts "負け！"
    $lose += 1
    puts "#{$win}勝#{$lose}敗\n\r"
    return false
  end

  next_game = true
  
  while next_game do
    next_game = janken()
  end
end

1.upto(num) do |i|
  puts "#{i}本目"
  puts "じゃんけん…(press g or c or p)"
  janken()

end

puts "結果"
if $win > $lose
  puts "#{$win}勝#{$lose}敗であなたの勝ち"
else
  puts "#{$win}勝#{$lose}敗であなたの負け"
end