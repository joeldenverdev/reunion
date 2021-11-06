class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, paid)
    @participants[name] = paid
  end

  def total_cost
    @participants.values.sum
  end

  def split
    total_cost / @participants.size
  end

  def owed
    @participants.transform_values { |participant| (participant - split) }
  end

end
