# <div align="center">Sweater Weather</div>


#### <div align="center">The backend for a roadtrip planning application</div>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

### Overview

Sweather Weather is a backend application that exposes several external API's to support an application for planning roadtrips based on weather conditions.

##### Learning Goals Achieved:
* Expose an API that aggregates data from multiple external APIs
* Expose an API that requires an authentication token
* Expose an API for CRUD functionality
* Determine completion criteria based on the needs of other developers
* Research, select, and consume an API based on your needs as a developer


#### Framework
<p>
  <img src="https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white" />
</p>

#### Languages
<p>
  <img src="https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white" />
  <img src="https://img.shields.io/badge/ActiveRecord-CC0000.svg?&style=flaste&logo=rubyonrails&logoColor=white" />
</p>

#### Tools
<p>
  <img src="https://img.shields.io/badge/Atom-66595C.svg?&style=flaste&logo=atom&logoColor=white" />  
  <img src="https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white" />
  <img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />
  <img src="https://img.shields.io/badge/Postman-FF6E4F.svg?&style=flat&logo=postman&logoColor=white" />
  <img src="https://img.shields.io/badge/CircleCI-FFBC4F.svg?&style=flat&logo=travis&logoColor=white" />
</p>

#### Gems
<p>
  <img src="https://img.shields.io/badge/rspec--rails-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />   
  <img src="https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  </br>
  <img src="https://img.shields.io/badge/bcrypt-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/figaro-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/faraday-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
</p>

#### Development Principles
<p>
  <img src="https://img.shields.io/badge/OOP-b81818.svg?&style=flaste&logo=OOP&logoColor=white" />
  <img src="https://img.shields.io/badge/TDD-b87818.svg?&style=flaste&logo=TDD&logoColor=white" />
  <img src="https://img.shields.io/badge/MVC-b8b018.svg?&style=flaste&logo=MVC&logoColor=white" />
  <img src="https://img.shields.io/badge/REST-33b818.svg?&style=flaste&logo=REST&logoColor=white" />  
</p>


### <ins>Contributors</ins>

👤  **Jamie Pace**
- Github: [Jamie Pace](https://github.com/jamiejpace)
- LinkedIn: [Jamie Pace](https://www.linkedin.com/in/jamiejpace/)


![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- MARKDOWN LINKS & IMAGES -->

[contributors-shield]: https://img.shields.io/github/contributors/jamiejpace/viewing_party.svg?style=flat
[contributors-url]: https://github.com/jamiejpace/viewing_party/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/jamiejpace/viewing_party.svg?style=flat
[forks-url]: https://github.com/jamiejpace/viewing_party/network/members
[stars-shield]: https://img.shields.io/github/stars/jamiejpace/viewing_party.svg?style=flat
[stars-url]: https://github.com/jamiejpace/viewing_party/stargazers
[issues-shield]: https://img.shields.io/github/issues/jamiejpace/viewing_party.svg?style=flat
[issues-url]: https://github.com/jamiejpace/viewing_party/issues
[travisci-shield]: https://img.shields.io/circleci/build/github/jamiejpace/viewing_party?logo=travisci
[travisci-url]: https://travisci.com/gh/jamiejpace/viewing_party


### Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Set up the database: `rails db:{drop,create,migrate,seed}`
4. Get API keys from [MapQuest](https://developer.mapquest.com/documentation/), [OpenWeather](https://openweathermap.org/api), and [Unsplash](https://unsplash.com/documentation#creating-a-developer-account)
5. Enter API keys into your `application.yml` file 
```
map_consumer_key: <enter your key here>
weather_key: <enter your key here>
background_access_key: <enter your key here>

```

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

### Endpoints

#### Retrieve weather for a city:

*Request*

`GET /api/v1/forecast?location=denver,co`

*Response*
```
{
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "datetime": "2020-09-30 13:27:03 -0600",
        "temperature": 79.4,
        etc
      },
      "daily_weather": [
        {
          "date": "2020-10-01",
          "sunrise": "2020-10-01 06:10:43 -0600",
          etc
        },
        {...} etc
      ],
      "hourly_weather": [
        {
          "time": "14:00:00",
          "conditions": "cloudy with a chance of meatballs",
          etc
        },
        {...} etc
      ]
    }
  }
}
```

#### Retrieve background image for a city:

*Request*

`GET /api/v1/backgrounds?location=denver,co`

*Response*
```
{
  "data": {
    "type": "image",
    "id": null,
    "attributes": {
      "image": {
        "location": "denver,co",
        "image_url": "https://pixabay.com/get/54e6d4444f50a814f1dc8460962930761c38d6ed534c704c7c2878dd954dc451_640.jpg",
        "credit": {
          "source": "pixabay.com",
          "author": "quinntheislander"
        }
      }
    }
  }
}
```

#### Register a user:

*Request*

`POST /api/v1/users`

Request body:
```
{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```

*Response*
```
{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```

#### Login a user:

*Request*

`POST /api/v1/sessions`

Request body:
```
{
  "email": "whatever@example.com",
  "password": "password"
}
```

*Response*
```
{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```

#### Roadtrip:

*Request*

`POST /api/v1/road_trip`

Request body:
```
{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```

*Response*
```
{
  "data": {
    "id": null,
    "type": "roadtrip",
    "attributes": {
      "start_city": "Denver, CO",
      "end_city": "Estes Park, CO",
      "travel_time": "2 hours, 13 minutes"
      "weather_at_eta": {
        "temperature": 59.4,
        "conditions": "partly cloudy with a chance of meatballs"
      }
    }
  }
}
```

#### Acknowlegements
* MapQuest API
* OpenWeather API
* Unsplash API - please refer to this [documentation](https://help.unsplash.com/en/articles/2511315-guideline-attribution) for crediting image use

