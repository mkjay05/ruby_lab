class Player
  def play_turn(warrior)
    # cool code goes here
    if @haveRescued.nil?
      @haveRescued = false
    end
    
    if !@haveRescued
      if warrior.feel.empty?
        warrior.walk!
      elsif warrior.feel.captive?
        warrior.rescue!
        @haveRescued = true
      end
    else
      if @space.nil?
        @space = warrior.look
        @time_to_shoot = false
      else
        @space.each do |space|
          if space.enemy?
            @time_to_shoot = true
            break
          else
            @time_to_shoot = false
          end
        end
        if @time_to_shoot
          warrior.shoot!
        else
          warrior.walk!
        end
      end
    end
    
  end
end