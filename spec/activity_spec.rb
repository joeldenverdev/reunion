require './lib/activity'

describe Activity do
  before(:each) do
    @activity = Activity.new("Brunch")
  end

  describe '#initialize' do
    it 'returns an instance of Activity' do
      expect(@activity).to be_a Activity
    end

    it 'stores and returns the name' do
      expect(@activity.name).to eq("Brunch")
    end

    it 'stores and returns a hash of participants' do
      expect(@activity.participants).to eq({})
    end
  end

  describe '#add_participant' do
    it 'adds new participants to the list' do
      @activity.add_participant("Maria", 20)
      expect(@activity.participants).to eq({"Maria" => 20})
    end
  end

  describe '#total_cost' do
    it 'returns the total cost of an activity' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)
      expect(@activity.total_cost).to eq(60)
    end
  end

  describe '#split' do
    it 'should divide the cost evenly across participants' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)
      expect(@activity.total_cost).to eq(60)
      expect(@activity.split).to eq(30)
    end
  end


end
