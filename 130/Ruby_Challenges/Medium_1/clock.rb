class Clock
  attr_accessor :hour, :minute

  def initialize(hour=0, minutes=0)
    @hour = hour
    @minutes = minutes
    self.calculate
  end

  class << Clock
    alias_method :at, :new
  end
  
  def to_s
    '%02d:%02d' % [@hour, @minutes]
  end

  def +(minutes)
    @minutes += minutes
    self.calculate
    self.to_s
  end

  def -(minutes)
    @minutes -= minutes
    self.calculate
    self.to_s
  end

  def calculate
    @hour , @minutes = ((@hour*60+@minutes)%1440).divmod(60)
  end

  def ==(other_object)
    self.to_s == other_object.to_s
  end

end