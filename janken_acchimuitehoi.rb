puts "じゃんけん..."

def janken        #じゃんけんのメソッド
  puts "0（グー）、1（チョキ）、2（パー）、3（戦わない）"
  user_throw = gets.chomp.to_i
  
  if user_throw == 3        #戦わないを選択した場合の処理
    puts "-------------------"
    puts "ゲームを終了します。またの挑戦をお待ちしております。"
    
  else          #戦う選択をした場合の処理
    choice = ["グー", "チョキ", "パー", "お疲れ様でした"]
    opponent_throw = rand(3)
    
    puts "ホイ！"
    puts "-------------------"

    puts "あなた：#{choice[user_throw]}を出しました"
    puts "相手：#{choice[opponent_throw]}を出しました"
    
    if user_throw == opponent_throw         #あいこの場合
      puts "あいこで…"
      return "janken_draw"
    elsif (user_throw == 0 && opponent_throw == 1) || (user_throw == 1 && opponent_throw == 2) || (user_throw == 2 && opponent_throw == 0)        #勝ちの場合
      puts "あなたの勝ちです"
      return "janken_win"
    else        #負けの場合
      puts "あなたの負けです"
      return "janken_lose"
    end
  end  
end  

#あいこの場合にはじゃんけんを繰り返す
janken_judge = "janken_draw"
while janken_judge == "janken_draw"
  janken_judge = janken
end


def acchimuitehoi(result)         #あっち向いてホイのメソッド
  choice = ["上", "下", "左", "右"]
  opponent_direction = rand(3)

  puts "あっち向いて〜"
  puts "0（上）、1（下）、2（左）、3（右）"
  
  user_direction = gets.chomp.to_i
  puts "ホイ！"
  puts "-------------------"
  
 if user_direction != opponent_direction          #あっち向いてホイの決着がつかなかった場合
  puts "あなた：#{choice[user_direction]}"
  puts "相手：#{choice[opponent_direction]}"
  puts "-------（ドロー）------------"
  puts "じゃんけん..."

  #再度じゃんけんの処理を繰り返す
  janken_judge = "janken_draw"
  while janken_judge == "janken_draw"
    janken_judge = janken
  end

  return "acchimuitehoi_draw"

 elsif user_direction == opponent_direction && result == "janken_win"         #あっち向いてホイで勝った場合
  puts "あなた：#{choice[user_direction]}"
  puts "相手：#{choice[opponent_direction]}"
  puts "-------------------"
  puts "あなたの勝利です！おめでとうございます！"
  return "acchimuitehoi_win"
  
 elsif user_direction == opponent_direction && result == "janken_lose"         #あっち向いてホイで負けた場合
  puts "あなた：#{choice[user_direction]}"
  puts "相手：#{choice[opponent_direction]}"
  puts "-------------------"
  puts "あなたの負けです。またチャレンジしてください。"
  return "acchimuitehoi_lose"
 end
end


#決着がつくまであっち向いてホイを繰り返す
acchimuitehoi_judge = "acchimuitehoi_draw"
while acchimuitehoi_judge == "acchimuitehoi_draw"
  acchimuitehoi_judge = acchimuitehoi(janken_judge)
end

