class BoredFacade
  class << self
    def get_two_activities(temp)
      activity_data1 = if temp >= 60
                BoredService.activity_data("recreational")
              elsif temp >= 50 && temp < 60
                BoredService.activity_data("busywork")
              else
                BoredService.activity_data("cooking")
              end
      activity_data2 = BoredService.activity_data("relaxation")
      [Activity.new(activity_data1), Activity.new(activity_data2)]
    end
  end
end
