# kamizato_file  slime.rbコードを参考に書いてみる
require "./dq_finish_action3_slime.rb"
require "./dq_finish_action3_hero.rb"

slime = Slime.new
hero = Hero.new

puts <<~EOS

スライムが　現れた！

スライム　HP：#{slime.hp}

EOS
#EOS = End of String

 sleep(2)

#コマンド選択
while true
 puts <<~EOS

 名前：#{hero.name}
 ＨＰ：#{hero.myhp}
 ＭＰ：#{hero.mymp}


 ▶︎コマンドを選択してください
  1：攻撃
  2：魔法
  3：逃げる
   EOS
 command = gets.chomp.to_i
sleep(1)

 #コマンド部分
case command
when 1 then    #攻撃コマンド
   puts "#{hero.name} の攻撃！"

   num = rand(6)  #クリティカル判定
   sleep(2)
   if num == 0
     puts "会心の一撃！"
     damage = rand(7..10)
   else
     damage = rand(3..5)
   end

   puts "敵のスライムに#{damage}のダメージ！"
   slime.hp -= damage

  sleep(1)
   if slime.hp > 0
     puts "スライムのHP：#{slime.hp}"
   else
     puts "スライムのHP：0"
    sleep(2)
     puts <<~EOS
     敵は　倒れた！
     EOS
    sleep(2)
     puts <<~EOS
     ---------------------
     経験値５を獲得した！
     ３Ｇを獲得した！
     ---------------------
     EOS
     exit    #終了させないと、ずっとコマンド入力を求められてしまう
   end
   sleep(2)

 when 2 then       #魔法コマンド
   puts "#{hero.name} は　メラを唱えた！"

   magic_cost = 5
 sleep(2)
   if hero.mymp < magic_cost
     puts "ＭＰが足りない！"
   else
     hero.mymp -= magic_cost
     magic_damage = 6
   puts "敵のスライムに#{magic_damage}のダメージ！"
   slime.hp -= magic_damage

 sleep(2)
     if slime.hp > 0
      puts "スライムのHP：#{slime.hp}"
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

 when 3 then  #逃げるコマンド
  esc = rand(7)
 puts "#{hero.name}は　逃げ出した！"

 sleep(2)
  if esc == 0  #逃走成功
   puts "逃走成功！戦闘から逃げた！"
   exit
  else
   puts "しかし敵に回り込まれてしまった！"
  end


 else    #それ以外のコマンドはないので警告
   puts "※コマンド入力ミスです。指定された数字(半角入力)で入力して下さい※"
 end



#slime.ememy_attack  #スライム攻撃ターンを入れる
sleep(3)
 puts <<~EOS

 スライム の攻撃！
 EOS
 num = rand(4)  #クリティカル判定

sleep(2)
 if num == 0
   puts "敵の会心の一撃！"
   damage = rand(7..10)
 else
   damage = rand(4..6)
 end

sleep(1)
 puts "#{hero.name}は#{damage}のダメージを受けた！"
 hero.myhp -= damage

sleep(2)
 if hero.myhp <= 0
   puts <<~EOS
   #{hero.name}は　倒れた・・・
   ---------------------
       GAME   OVER
   ---------------------
   EOS
   exit    #終了させないと、ずっとコマンド入力を求められてしまう
 end
end
