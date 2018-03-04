#ついでに勇者クラスも作って変数myho,mympをこっちへ移しておく

class Hero

 attr_accessor :myhp, :mymp, :name

  def initialize
   self.myhp = 15    #自分のhp
   self.mymp = 8
   self.name = "トンヌラ"
  end
end
