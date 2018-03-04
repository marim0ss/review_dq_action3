# kamizato_file  slime.rbコード→配列導入版
require "./dq_finish_action3_slime.rb"
require "./dq_finish_action3_hero.rb"

hero = Hero.new(name: "トンヌラ", hp:20, mp:10, attack:5)

chara1 = Chara.new(name: "キメラ", hp:20, mp:10, attack:4)
chara2 = Chara.new(name: "スライム", hp:15, mp:0, attack:7)
chara3 = Chara.new(name: "ゴーレム", hp:40, mp:10, attack:10)


charas = [chara1,chara2,chara3]
enemy = charas.sample    #enemyに入れれば別の敵をnewした時も応用が効くのでは？
#charaの配列は敵だけにして、配列からランダムで取り出してenemyに代入すればランダムで敵が決定できる

puts <<~EOS

#{enemy.name}が　現れた！

#{enemy.name}　HP：#{enemy.hp}

EOS
#EOS = End of String

#コマンド選択

while true
sleep(2)
 puts <<~EOS

 名前：#{hero.name}
 ＨＰ：#{hero.hp}
 ＭＰ：#{hero.mp}

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
   hero.chara_attack
  sleep(2)

   puts "敵の#{enemy.name}に#{hero.attack}のダメージ！"
   enemy.hp -= hero.attack
   sleep(1)
   enemy.chara_attack_react
   hero.win_message if enemy.hp <= 0
  sleep(2)

 when 2 then       #魔法コマンド
   puts "#{hero.name} は　メラを唱えた！"

   magic_cost = 5

   if hero.mp < magic_cost
     puts "ＭＰが足りない！"
   else
     hero.mp -= magic_cost
     magic_damage = 8
   puts "敵の#{enemy.name}に#{magic_damage}のダメージ！"
   enemy.hp -= magic_damage
   enemy.chara_attack_react
   end


   hero.win_message if enemy.hp <= 0
   sleep(2)

 when 3 then  #逃げるコマンド
  esc = rand(7)
 puts "#{hero.name}は　逃げ出した！"

 sleep(4)
  if esc == 0  #逃走成功
   puts "逃走成功！戦闘から逃げた！"
   exit
  else
   puts "しかし敵に回り込まれてしまった！"
   enemy.chara_attack
  end


 else    #それ以外のコマンドはないので警告
   puts "※コマンド入力ミスです。指定された数字(半角入力)で入力して下さい※"
 end



 #敵の攻撃部分
  enemy_num = rand(10)
  magic_cost = 5
  heal_cost = 5

  if enemy_num == 0 #攻撃はミス
    puts ""
    puts "#{enemy.name} の攻撃！"
    sleep(1)
    puts "しかし#{enemy.name}は攻撃を外した！"
    sleep(2)
  elsif enemy_num == (2 || 3 || 4)  and enemy.mp >= magic_cost #魔法で攻撃
    puts ""
    puts "#{enemy.name} は　呪文を唱えた！"

    enemy.mp -= magic_cost
    magic_damage = rand(7..10)

    puts "#{hero.name}に#{magic_damage}のダメージ！"
    hero.hp -= magic_damage
    #hero.chara_attack_react
    sleep(2)
  elsif enemy_num == (1 || 5) and enemy.mp >= heal_cost
    puts ""
    puts "#{enemy.name} は　呪文を唱えた！"

    enemy.mp -= magic_cost
    enemy.hp += rand(5..10)

    puts "敵の#{enemy.name}のHPが回復した！"
    sleep(2)
  else  #物理攻撃
    enemy.chara_attack

    puts "#{hero.name}に#{enemy.attack}のダメージ！"
    hero.hp -= enemy.attack
    sleep(2)
 end


 hero.chara_attack_react

 hero.lose_message if hero.hp <= 0


end
