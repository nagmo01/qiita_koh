
class Guitar

  def initialize
    @guitar_life = 4
  end

  def play
    if @guitar_life == 0
      puts "ガシャン・・・！"
    end
    if @guitar_life > 0
      puts "ジャン！"
      @guitar_life -= 1
    end
  end
  
  def repair
    @guitar_life = 4
  end

end

#    以下仕様を満たすギターを作成してください。
#    1クラスのみ作成してください。
#    ギターを演奏すると「ジャン！」という音が鳴る。
#    4回演奏するとギターが壊れます。壊れた後のギターは「ガシャン・・・」という音が鳴ります。
#    何回演奏済みかは外部からは分かりません。
#    修理することでギターが修理されます。
#        修理した後は、演奏回数がリセットされます。
#        修理した後は、壊れる前の正常な音で演奏ができます。

  guitar = Guitar.new
  5.times { guitar.play }
  guitar.repair
  guitar.play
