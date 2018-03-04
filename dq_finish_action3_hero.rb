#chara1は勇者のクラスとして独立させる
class Hero

  attr_accessor :name, :hp, :mp, :attack

  def initialize(name:, hp:, mp:, attack:)
   self.name = name
   self.hp = hp
   self.mp = mp
   self.attack = attack
  end

  #攻撃行動などメソッド化
    def chara_attack  #引数で相手を指定すれば使えるか？
     puts ""
     puts "#{self.name} の攻撃！"

     sleep(1)
     num = rand(4)  #クリティカル判定

     if num == 0
      puts "会心の一撃！"
      self.attack *= 2
     else
      self.attack *= (1 + rand(1..4) / 100)
      self.attack.floor
     end
    end


    def chara_attack_react  #攻撃を受けて倒れるかどうかの判定、残HPの表示
     if self.hp > 0
      puts "#{self.name}のHP：#{self.hp}"
     else
      puts "#{self.name}のHP：0"
      puts <<~EOS
      #{self.name}は　倒れた
      EOS
     end
    end



  def lose_message
    puts <<~EOS

     全　　滅　　し　　た・・・
     ---------------------
         GAME   OVER
     ---------------------
     EOS
     exit
   end

  def win_message
    puts <<~EOS
      ---------------------
       #{self.name}は
       経験値５を獲得した！
       ３Ｇを獲得した！
      ---------------------
      EOS
      exit
    end






end
