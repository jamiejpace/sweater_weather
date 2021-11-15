require 'rails_helper'

RSpec.describe Activity do
  it 'exists and has attributes' do
    data = {
            :activity=>"Shop at support your local farmers market",
            :type=>"relaxation",
            :participants=>1,
            :price=>0.2,
            :link=>"",
            :key=>"8979931",
            :accessibility=>0.1
          }

    activity = Activity.new(data)

    expect(activity).to be_an(Activity)
    expect(activity.title).to eq(data[:activity])
    expect(activity.type).to eq(data[:type])
    expect(activity.participants).to eq(data[:participants])
    expect(activity.price).to eq(data[:price])
  end
end
