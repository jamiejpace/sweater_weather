class BoredFacade
  class << self
    def get_two_activities(temp)
      data1 = BoredService.activity_data("relaxation")
      data2 = if temp >= 60
                BoredService.activity_data("recreational")
              elsif temp >= 50 && temp < 60
                BoredService.activity_data("busywork")
              else
                BoredService.activity_data("cooking")
              end
      [Activity.new(data1), Activity.new(data2)]
    end
  end
end
