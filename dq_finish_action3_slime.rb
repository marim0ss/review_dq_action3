#スライムの攻撃部分を定義してみる
myhp = 15    #自分のhp
mymp = 8
hp = rand(10..15)   #スライムのhp
name = "トンヌラ"


def ememy_attack
  puts "スライム の攻撃！"

  num = rand(4)  #クリティカル判定

  if num == 0
    puts "敵の会心の一撃！"
    damage = rand(7..10)
  else
    damage = rand(4..6)
  end

  puts "#{name}は#{damage}のダメージを受けた！"
  myhp -= damage

  if myhp < 0
    puts <<~EOS
    #{name}は　倒れた・・・
    ---------------------
        GAME   OVER
    ---------------------
    EOS
    exit    #終了させないと、ずっとコマンド入力を求められてしまう
  end

end
