#スライムの攻撃部分を定義してみる
#クラス定義しないとaction3.rbでrequireしてここの変数を使えない
require "./dq_finish_action3_hero.rb"

class Slime

 attr_accessor :hp

  def initialize
   self.hp = rand(10..15)   #スライムのhp
  end




end
