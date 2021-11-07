require './lib/reunion'
require './lib/activity'

describe Reunion do
  before(:each) do
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
    @activity_2 = Activity.new("Drinks")

  end

  describe '#initialize' do
    it 'returns an instance of Reunion' do
      expect(@reunion).to be_a(Reunion)
    end

    it 'stores and returns the name' do
      expect(@reunion.name).to eq("1406 BE")
    end

    it 'stores and returns the list of activities' do
      expect(@reunion.activities).to eq([])
    end
  end

  describe '#add_activity' do
    it 'takes and stores the activity' do
      @reunion.add_activity(@activity_1)
      expect(@reunion.activities).to eq([@activity_1])
    end
  end

  describe '#breakout' do
    it 'returns what each person owes' do
      @activity_1.add_participant("Maria", 20)
      @activity_1.add_participant("Luther", 40)
      @reunion.add_activity(@activity_1)
      @reunion.total_cost
      @activity_2.add_participant("Maria", 60)
      @activity_2.add_participant("Luther", 60)
      @activity_2.add_participant("Louis", 0)
      @reunion.add_activity(@activity_2)
      expect(@reunion.breakout).to eq({"Maria" => -10, "Luther" => -30, "Louis" => 40})
    end
  end

  xdescribe '#summary' do
    it 'returns a summary of what each person owes' do
      @activity_1.add_participant("Maria", 20)
      @activity_1.add_participant("Luther", 40)
      @reunion.add_activity(@activity_1)
      @reunion.total_cost
      @activity_2.add_participant("Maria", 60)
      @activity_2.add_participant("Luther", 60)
      @activity_2.add_participant("Louis", 0)
      @reunion.add_activity(@activity_2)
      expect(@reunion.summary).to eq("Maria: -10\nLuther: -30\nLouis: 40")
    end
  end


end
