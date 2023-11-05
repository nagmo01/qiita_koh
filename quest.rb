#------------------勇者クラス----------------------------------------
class Brave
  attr_reader :name
  attr_reader :hp
  attr_reader :sword
  #swordにはSwordクラスのインスタンスが入ります。
  def initialize(name, hp, sword = "武器未所持！")
    
    @name = name
    @hp = hp
    @sword = sword
  end

  #monsterにはmonsterクラスのインスタンスが入ります。
  def attack(monster)
    unless @sword == "武器未所持！"
      monster.damage(@sword.attackpoint) 
      "#{@name}の攻撃! #{monster.name}は#{@sword.attackpoint}のダメージを受けた！"
    else 
      raise "武器未所持！"
    end

  end

  #HPを20回復させる。その後100を超えた場合は100を代入する
  def heal
    @hp += 20
    if @hp > 100
      @hp = 100
    end
    "勇者は回復を使った。HP:#{@hp}"
  end

  def damage(damage)
    @hp -= damage
    if @hp < 0
      raise "GAME OVER！"
    end
  end

end  


#---------------------------SWORDクラス----------------------------------

class Sword
  #外部から読み込みだけできるようにする
  attr_reader :name
  attr_reader :attackpoint

  def initialize(name,attackpoint)
    @name = name
    @attackpoint = attackpoint
  end

end




#---------------------------モンスタークラス----------------------------




class Monster
  #外部から読み込みだけできるようにする
  attr_reader :name
  attr_reader :hp
  attr_reader :attackpoint

  def initialize(name,hp,attackpoint)
    @name = name
    @hp = hp
    @attackpoint = attackpoint
  end

  #モンスターの攻撃、勇者のHPを減らす
  def attack(brave)
    brave.damage(@attackpoint)
    "#{@name}の攻撃! #{brave.name}は#{@attackpoint}のダメージを受けた！"
  end

  #攻撃を受けた際に自分側のメソッドで計算する
  def damage(damage)
    @hp -= damage
    if @hp < 0
      raise "モンスター討伐！"
    end
  end

end

#---------------------------神様のクラス----------------------------

sword = Sword.new("炎の剣", 20)
brave = Brave.new("イレブン", 100, sword)
monster = Monster.new("スライム", 30, 30)



puts monster.attack(brave)
puts brave.attack(monster)

puts "勇者のHP#{brave.hp}"
puts "モンスターのHP#{monster.hp}"

puts monster.attack(brave)
puts brave.heal

puts "勇者のHP#{brave.hp}"
puts "モンスターのHP#{monster.hp}"

puts monster.attack(brave)
puts brave.attack(brave)

