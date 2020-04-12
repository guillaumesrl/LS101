

class SecretFile
  include SecurityLogger
  attr_reader :data

  def initialize(secret_data)
    @login = create_log_entry
    @data = secret_data
  end
end

class SecurityLogger
  def create_log_entry
    # ... implementation omitted ...
  end
end