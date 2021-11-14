class UserSerializer
  def self.new(user)
    {
      "data": {
        "type": "users",
        "id": user.id,
        "attributes": {
          "email": user.email,
          "api_key": user.access_token
        }
      }
    }
  end
end
