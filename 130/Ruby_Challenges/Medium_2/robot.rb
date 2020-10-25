class Robot
  attr_accessor :robot_name
  @@historic = []

  def name
    return @robot_name if robot_name
    @robot_name = generate_name while @@historic.include?(@robot_name) || @robot_name.nil?
    @@historic << @robot_name
    @robot_name
  end

  def reset
    @robot_name = nil
  end

  private

  def generate_name
    name_temp = ''
    2.times { |time| name_temp << rand(65..90).chr}
    3.times { |time| name_temp << rand(0..9).to_s }
    name_temp
  end
end