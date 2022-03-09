# README
![Sweater Weather PIC](https://res.cloudinary.com/teepublic/image/private/s--4uOp7owU--/t_Resized%20Artwork/c_fit,g_north_west,h_1054,w_1054/co_ffffff,e_outline:53/co_ffffff,e_outline:inner_fill:53/co_bbbbbb,e_outline:3:1000/c_mpad,g_center,h_1260,w_1260/b_rgb:eeeeee/c_limit,f_auto,h_630,q_90,w_630/v1555323054/production/designs/4642747_0.jpg
)

#### Project stats:
   ![languages](https://img.shields.io/github/languages/top/kbhoffmann/sweater_weather?color=red)
   ![closed PRs](https://img.shields.io/github/issues-pr-closed/kbhoffmann/sweater_weather?style=flat-square)   

#### Created using:
![RoR](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
- Ruby 2.7.2 
- Rails 5.2.6  
- PostgreSQL
- RSpec
- Postman

## Learning Goals for this Turing School Project:
  - Expose an API that aggregates data from multiple external APIs
  - Expose an API that requires an authentication token
  - Expose an API for CRUD functionality
  - Determine completion criteria based on the needs of other developers
  - Research, select, and consume an API based on your needs as a developer

## Project Description:
  Imagine you are a back-end developer working on a team that is building an application to plan road trips. This app will allow users to see the current weather as well as the forecasted weather at the destination.  Your team is working in a service-oriented architecture. The front-end will communicate with your back-end through an API. Your job is to expose that API that satisfies the front-end team’s requirements.
  
  3 different APIs were used for this project:
1. [Open Weather's One Call](https://openweathermap.org/api/one-call-api)
2. [Mapquest API](https://developer.mapquest.com/documentation/)
3. [Unsplash API](https://unsplash.com/documentation#getting-started)

API keys are required to use this project.  Visit the links to get your own!  They will then be used in further instructions below.

## Cloning and Setup:
   * Clone this repo onto your local machine
   * cd into the sweater_weather directory
   * Run ```bundle```
   * Run ```rails db:{create, migrate}```
   * To run the test suite run ```bundle exec rspec```
   * Run `bundle exec figaro install` (this creates an `application.yml` file. Add this file to your .gitignore so your keys are not for others to see!
   * Add the following lines to your `application.yml` file, adding in your own keys as the values to the variables I included.  Do not change the variables! They are necessary for the code to work.
   ```
   weather_api_key: your weather api key

   unsplash_client_id: your unsplash client id

   mapquest_api_key: your mapquest api key
   ```
   * Now you are ready to fire it up!
   * To use in Postman, in your console run the server ```rails s```
   * Now you're on your way!

## How to get an API key and Posting to your Database using Postman:
   Using the Postman API platform tool you can simulate creating an account on the backend by running ```rails s``` in your terminal.  In Postman send a POST request to localhost:3000 and which ever endpoint you would like to hit. (ie: localhost:3000/?location=milwaukee,wi)  For posting to /users, /sessions, and /road_trip, make sure you put the body of your parameters such as email, password, password confirmation, api_key, destination, and origin in the body of the Postman request, not the params.  This is done for security reasons to help protect user information. Examples of what to include in the body are demonstrated below in each example.  You must include your API key when planning a road trip!
   
## API endpoints:
### Example GET request for forcast for mandatory location parameter.
```
      GET /api/v1/forecast?location=denver,co
      Content-Type: application/json
      Accept: application/json
```
### Corresponding JSON response for example GET request for forcast for location parameter.  This gives the current weather, the next 5 days of weather, and the next 8 hours of weather.
```
      {
          "data": {
              "id": null,
              "type": "forecast",
              "attributes": {
                  "current_weather": {
                      "datetime": "2022-03-06 10:51:19 -0700",
                      "sunrise": "2022-03-06 06:25:35 -0700",
                      "sunset": "2022-03-06 17:57:04 -0700",
                      "temperature": 23.45,
                      "feels_like": 16.05,
                      "humidity": 81,
                      "uvi": 3.02,
                      "visibility": 7428,
                      "conditions": "snow",
                      "icon": "13d"
                  },
                  "daily_weather": [
                      {
                          "date": "2022-03-06",
                          "sunrise": "2022-03-06 06:25:35 -0700",
                          "sunset": "2022-03-06 17:57:04 -0700",
                          "max_temp": 26.17,
                          "min_temp": 21.31,
                          "conditions": "snow",
                          "icon": "13d"
                      },
                      {
                          "date": "2022-03-07",
                          "sunrise": "2022-03-07 06:24:02 -0700",
                          "sunset": "2022-03-07 17:58:07 -0700",
                          "max_temp": 30.79,
                          "min_temp": 19.2,
                          "conditions": "light snow",
                          "icon": "13d"
                      },
                      {
                          "date": "2022-03-08",
                          "sunrise": "2022-03-08 06:22:28 -0700",
                          "sunset": "2022-03-08 17:59:10 -0700",
                          "max_temp": 37.63,
                          "min_temp": 24.08,
                          "conditions": "clear sky",
                          "icon": "01d"
                      },
                      {
                          "date": "2022-03-09",
                          "sunrise": "2022-03-09 06:20:54 -0700",
                          "sunset": "2022-03-09 18:00:13 -0700",
                          "max_temp": 28.87,
                          "min_temp": 15.33,
                          "conditions": "snow",
                          "icon": "13d"
                      },
                      {
                          "date": "2022-03-10",
                          "sunrise": "2022-03-10 06:19:20 -0700",
                          "sunset": "2022-03-10 18:01:16 -0700",
                          "max_temp": 27.36,
                          "min_temp": 13.91,
                          "conditions": "light snow",
                          "icon": "13d"
                      }
                  ],
                  "hourly_weather": [
                      {
                          "time": "10:00:00",
                          "temperature": 23.5,
                          "conditions": "light snow",
                          "icon": "13d"
                      },
                      {
                          "time": "11:00:00",
                          "temperature": 23.45,
                          "conditions": "snow",
                          "icon": "13d"
                      },
                      {
                          "time": "12:00:00",
                          "temperature": 23.92,
                          "conditions": "snow",
                          "icon": "13d"
                      },
                      {
                          "time": "13:00:00",
                          "temperature": 24.35,
                          "conditions": "light snow",
                          "icon": "13d"
                      },
                      {
                          "time": "14:00:00",
                          "temperature": 24.89,
                          "conditions": "light snow",
                          "icon": "13d"
                      },
                      {
                          "time": "15:00:00",
                          "temperature": 25.65,
                          "conditions": "overcast clouds",
                          "icon": "04d"
                      },
                      {
                          "time": "16:00:00",
                          "temperature": 26.01,
                          "conditions": "overcast clouds",
                          "icon": "04d"
                      },
                      {
                          "time": "17:00:00",
                          "temperature": 24.62,
                          "conditions": "light snow",
                          "icon": "13d"
                      }
                  ]
              }
          }
      }

```
### Example GET request for an image for mandatory location parameter.
```
GET /api/v1/backgrounds?location=denver,co
Content-Type: application/json
Accept: application/json

```
### Corresponding JSON response for example GET request for an image for mandatory location parameter.
```
    {
        "data": {
            "id": null,
            "type": "image",
            "attributes": {
                "image": {
                    "location": "denver,co",
                    "image_url": "https://images.unsplash.com/photo-1629163330223-c183571735a1?ixid=MnwzMDczNjN8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2NDY1OTY2MzM&ixlib=rb-1.2.1",
                    "credit": {
                        "hotlink": "https://api.unsplash.com/photos/zSm5JPgNeuc",
                        "author": "tayloradaugherty"
                    }
                }
            }
        }
    }
```

### Example POST request for user account creation with mandatory email, password, and password confirmation fields.
```
POST /api/v1/users
Content-Type: application/json
Accept: application/json

    {
      "email": "BurtTheCat@email.com",
      "password": "passwordddd",
      "password_confirmation": "passwordddd"
    }
```

### Corresponding JSON response for example POST request for user account creation, an API key is returned. 
```
    {
        "data": {
            "type": "users",
            "id": 26,
            "attributes": {
                "email": "BurtTheCat@email.com",
                "api_key": "0b4f95c0b38d429442ce4a960d6cc4e6"
            }
        }
    }
```

### Example POST request for user account login with mandatory email and password fields.
```
      POST /api/v1/sessions
      Content-Type: application/json
      Accept: application/json

    {
      "email": "BurtTheCat@example.com",
      "password": "passwordddd"
    }

```

### Corresponding JSON response for example POST request for user account login, an API key is returned. 
```
    {
        "data": {
            "type": "users",
            "id": 26,
            "attributes": {
                "email": "BurtTheCat@email.com",
                "api_key": "0b4f95c0b38d429442ce4a960d6cc4e6"
            }
        }
    }

```

### Example POST request for user road trip plan with mandatory origin, destination, and api_key fields.
```
      POST /api/v1/road_trip
      Content-Type: application/json
      Accept: application/json

      body:

      {
        "origin": "Denver,CO",
        "destination": "Seattle,WA",
        "api_key": "0b4f95c0b38d429442ce4a960d6cc4e6"
      }
```
### Corresponding JSON response for example POST request for user road trip plan including the travel time for driving to the destination city and the weather at the estimated time of arrival to the destination city.
```
      {
          "data": {
              "id": null,
              "type": "roadtrip",
              "attributes": {
                  "start_city": "Denver,CO",
                  "end_city": "Seattle,WA",
                  "travel_time": "20 hours, 38 minutes",
                  "weather_at_eta": {
                      "temperature": 35.98,
                      "conditions": "scattered clouds"
                  }
              }
          }
      }
```
### Example response for a city that does not have a driving route.
```
      {
          "data": {
              "id": null,
              "type": "roadtrip",
              "attributes": {
                  "start_city": "Denver,CO",
                  "end_city": "London,UK",
                  "travel_time": "Impossible",
                  "weather_at_eta": {}
              }
          }
      }
```


   ## Contributor(s)
<table>
   <tr>
      <td><img src="https://avatars.githubusercontent.com/u/84674761?s=120&v=4" width=150 height=150></td>
   </tr>
   <tr>
      <td><a href="https://github.com/kbhoffmann">Kerri Hoffmann</a></td>
   </tr>
</table>
