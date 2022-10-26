puts "じゃんけん..."

def janken        #じゃんけんのメソッド
  puts "0（グー）、1（チョキ）、2（パー）、3（戦わない）"
  user_throw = gets.chomp.to_i
  
  if user_throw == 3        #戦わないを選択した場合の処理
    puts "-------------------"
    puts "ゲームを終了します。またの挑戦をお待ちしております。"
    return "finish"
    
  elsif user_throw == 0 || user_throw == 1 || user_throw == 2          #戦う選択をした場合の処理
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
  else            #0,1,2,3以外を選択した場合
    puts "-------------------"
    puts "０、１、２、３のいずれかを選択ください"
    janken
  end  
end  


def acchimuitehoi(result)         #あっち向いてホイのメソッド
  choice = ["上", "下", "左", "右"]
  opponent_direction = rand(3)

  puts "あっち向いて〜"
  puts "0（上）、1（下）、2（左）、3（右）"
  
  user_direction = gets.chomp.to_i
  puts "ホイ！"
  puts "-------------------"
  
 if user_direction != 0 && user_direction != 1 && user_direction != 2 && user_direction != 3          #0,1,2,3以外を選択した場合
  puts "０、１、２、３のいずれかを選択ください"
  return "error"
  
 elsif user_direction != opponent_direction          #あっち向いてホイの決着がつかなかった場合
  puts "あなた：#{choice[user_direction]}"
  puts "相手：#{choice[opponent_direction]}"
  puts "-------（ドロー）------------"
  puts "じゃんけん..."
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


#じゃんけんとあっち向いてホイの処理実行
janken_judge = "janken_draw"
acchimuitehoi_judge = "acchimuitehoi_draw"

while janken_judge == "janken_draw" || acchimuitehoi_judge == "acchimuitehoi_draw"
  janken_judge = janken         #じゃんけんの処理実行

  if janken_judge == "janken_draw"         #じゃんけんがあいこの場合にはあっち向いてホイの処理に移行しないよう制御
    next
  elsif janken_judge == "finish"           #3(戦わない)を選択した場合処理を終了する
    break
  end

  acchimuitehoi_judge = acchimuitehoi(janken_judge)         #あっち向いてホイの処理実行
  if acchimuitehoi_judge == "error"                         #0,1,2,3以外を選択した場合に、再度あっち向いてホイの選択をさせる
    while acchimuitehoi_judge == "error"
      acchimuitehoi_judge = acchimuitehoi(janken_judge)
    end
  end
end