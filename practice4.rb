
class Brave
  def initialize(name, hp, sword)
    @name = name
    @hp = hp
    @sword = sword
  end

  def attack(monster)
    monster.hp - 

  end

  def heal
  
  end

end

class Sword
  def initialize(name,attackpoint)
    @name = name
    @attackpoint = attackpoint
  end
  #外部から読み込みだけできるようにする
  def name
    @name
  end
  def attackpoint
    @attackpoint
  end

end

class Monster
  def initialize(name,hp,attackpoint)
    @name = name
    @hp = hp
    @attackpoint = attackpoint
  end

  #モンスターの攻撃、勇者のHPを減らす
  def attack(brave)
    brave.hp -= @attackpoint
  end

end


sword = Sword.new("炎の剣", 20)
brave = Brave.new("イレブン", 100, sword)
