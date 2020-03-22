class Bike  
  def initialize
    @broken = false
  end

  def report_broken
    @broken = true
  end

  def broken?
    @broken
  end

  def is_working?
    @broken ? false : true
  end
end
