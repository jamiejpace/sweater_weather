class BackgroundImage
  attr_reader :location, :image_url, :author

  def initialize(data)
    @location = data[:user][:location]
    @image_url = data[:urls][:full]
    @author = data[:user][:name]
  end
end
