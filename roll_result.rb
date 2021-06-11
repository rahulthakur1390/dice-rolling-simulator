class RollResult
  attr_reader :description, :values, :total

  def initialize(description, values)
    @description = description
    @values = values
    @total = values.sum
  end

  def to_s
    "#{description}: #{values.join(', ')} | Total: #{total}"
  end
end
