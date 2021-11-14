class BackgroundImageSerializer
  def self.new_unsplash(background)
    {
      "data": {
        "type": "image",
        "id": nil,
        "attributes": {
          "image": {
            "location": background.location,
            "image_url": background.image_url,
            "credit": {
              "source": "Unsplash",
              "author": background.author
            }
          }
        }
      }
    }
  end
end
