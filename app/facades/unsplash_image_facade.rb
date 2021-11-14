class UnsplashImageFacade
  class << self
    def find_image(location)
      data = UnsplashImageService.image_data(location)
      result = data[:results].first
      BackgroundImage.new(result)
    end
  end
end
