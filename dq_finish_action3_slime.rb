#キャラの共通のでステータスとしてクラスを定義。情報持たせる
class Chara

 attr_accessor :name, :hp, :mp, :attack

 def initialize(name:, hp:, mp:, attack:)
  self.name = name
  self.hp = hp
  self.mp = mp
  self.attack = attack
 end


#攻撃行動などメソッド化できるか？
  def chara_attack  #引数で相手を指定すれば使えるか？
   puts ""
   puts "#{self.name} の攻撃！"

   sleep(1)
   num = rand(5)  #クリティカル判定

   if num == 0
    puts "会心の一撃！"
    self.attack *= 2
   else
    self.attack *= (1 + rand(2..5) / 100)
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



end
