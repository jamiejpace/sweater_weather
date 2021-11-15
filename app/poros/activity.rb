class Activity
  attr_reader :type, :participants, :price, :title

  def initialize(data)
    @type = data[:type]
    @participants = data[:participants]
    @price = data[:price]
    @title = data[:activity]
  end
end
