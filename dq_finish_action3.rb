# kamizato_file  slime.rbコードを参考に書いてみる
require "./dq_finish_action3_slime.rb"



puts <<~EOS

スライムが　現れた！

スライム　HP：#{hp}

EOS
#EOS = End of String

#コマンド選択

while true
sleep(3)
 puts <<~EOS

 名前：#{name}
 ＨＰ：#{myhp}
 ＭＰ：#{mymp}

 ▶︎コマンドを選択してください
  1：攻撃
  2：魔法
  3：逃げる
   EOS
 command = gets.chomp.to_i
sleep(2)

 #コマンド部分
case command
when 1 then    #攻撃コマンド
   puts "#{name} の攻撃！"

   num = rand(6)  #クリティカル判定

   if num == 0
     puts "会心の一撃！"
     damage = rand(7..10)
   else
     damage = rand(3..5)
   end

   puts "敵のスライムに#{damage}のダメージ！"
   hp -= damage

   if hp > 0
     puts "スライムのHP：#{hp}"
   else
     puts "スライムのHP：0"
     puts <<~EOS
     敵は　倒れた！
     ---------------------
     経験値５を獲得した！
     ３Ｇを獲得した！
     ---------------------
     EOS
     exit    #終了させないと、ずっとコマンド入力を求められてしまう
   end
   sleep(2)

 when 2 then       #魔法コマンド
   puts "#{name} は　メラを唱えた！"

   magic_cost = 5

   if mymp < magic_cost
     puts "ＭＰが足りない！"
   else
     mymp -= magic_cost
     magic_damage = 6
   puts "敵のスライムに#{magic_damage}のダメージ！"
   hp -= magic_damage

     if hp > 0
      puts "スライムのHP：#{hp}"
     else
      puts "スライムのHP：0"
      puts <<~EOS
       敵は　倒れた！
       ---------------------
       経験値５を獲得した！
       ３Ｇを獲得した！
       ---------------------
       EOS
       exit    #終了させないと、ずっとコマンド入力を求められてしまう
   end
 end
   sleep(2)

 when 3 then  #逃げるコマンド
  esc = rand(7)
 puts "#{name}は　逃げ出した！"

 sleep(4)
  if esc == 0  #逃走成功
   puts "逃走成功！戦闘から逃げた！"
   exit
  else
   puts "しかし敵に回り込まれてしまった！"
  end


 else    #それ以外のコマンドはないので警告
   puts "※コマンド入力ミスです。指定された数字(半角入力)で入力して下さい※"
 end

ememy_attack  #スライム攻撃ターンを入れる
end
