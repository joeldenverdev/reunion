class Reunion
  attr_reader :name, :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    cost = @activities.map { |activity| activity.participants.values.sum }.sum
  end

  def breakout
    total_money = Hash.new(0)
    #
    # participants = @activities.map do |activity|
    #   activity.participants.transform_values do |participant|
    #     participant - activity.split
    #   end
    # end

    @activities.each do |activity|
      activity.owed.each do |name, owed|
        total_money[name] -= owed
      end
    end

    return total_money
  end

end
