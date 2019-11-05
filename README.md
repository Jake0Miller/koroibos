# Production Link

[Heroku](https://koroibos.herokuapp.com/)
[Agile Board](https://github.com/Jake0Miller/koroibos/projects/1)

# Introduction

This app reads in Olympic data from a CSV file, saves it to a database, and exposes several endpoints

# Endpoints

```
GET api/v1/olympians
```

**Example Response**
```
{
  "olympians":
    [
      {
        "name": "Maha Abdalsalam",
        "team": "Egypt",
        "age": 18,
        "sport": "Diving"
        "total_medals_won": 0
      },
      {
        "name": "Ahmad Abughaush",
        "team": "Jordan",
        "age": 20,
        "sport": "Taekwondo"
        "total_medals_won": 1
      },
      {...}
    ]
}
```

```
GET api/v1/olympians?age=youngest
```

**Example Response**
```
{
  [
    {
      "name": "Ana Iulia Dascl",
      "team": "Romania",
      "age": 13,
      "sport": "Swimming"
      "total_medals_won": 0
    }
  ]
}
```

```
GET api/v1/olympians?age=oldest
```

**Example Response**
```
{
  [
    {
      "name": "Julie Brougham",
      "team": "New Zealand",
      "age": 62,
      "sport": "Equestrianism"
      "total_medals_won": 0
    }
  ]
}
```

```
GET api/v1/olympian_stats
```

**Example Response**
```
{
  "olympian_stats": {
    "total_competing_olympians": 3120
    "average_weight:" {
      "unit": "kg",
      "male_olympians": 75.4,
      "female_olympians": 70.2
    }
    "average_age": 26.2
  }
}
```

```
GET api/v1/events
```

**Example Response**
```
{
  "events":
    [
      {
        "sport": "Archery",
        "events": [
          "Archery Men's Individual",
          "Archery Men's Team",
          "Archery Women's Individual",
          "Archery Women's Team"
        ]
      },
      {
        "sport": "Badminton",
        "events": [
          "Badminton Men's Doubles",
          "Badminton Men's Singles",
          "Badminton Women's Doubles",
          "Badminton Women's Singles",
          "Badminton Mixed Doubles"
        ]
      },
      {...}
    ]
}
```

```
GET api/v1/events/:id/medalists
```

**Example Response**
```
{
  "event": "Badminton Mixed Doubles",
  "medalists": [
      {
        "name": "Tontowi Ahmad",
        "team": "Indonesia-1",
        "age": 29,
        "medal": "Gold"
      },
      {
        "name": "Chan Peng Soon",
        "team": "Malaysia",
        "age": 28,
        "medal": "Silver"
      }
    ]
}
```

# Database Schema

# Setup

Gemfile dependencies `bundle install`

Setup database
`rails db:{create,migrate}`

Rake task `rake import`

Run server `rails s`

# Testing

Run tests with
`rspec`

# Tech Stack

* Ruby v2.4.1
* Rails v5.2.3
* PostgreSQL v11.5
* RSpec testing suite
* Travis CI

# Core Contributors

[Jake Miller](https://github.com/Jake0Miller)
