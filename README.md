# Experience Exchange (Back-End / Microservice)
## About
Experience Exchange was built with a core focus in mind - that of the ability to share experiences and knowledge with others. Want to learn to knit? Find a nearby knitting buddy who can pass on their years of knowledge! What about musical interest, piano perhaps? Search for your interests, and whether you'd like an in-person or remote buddy, and you're off to the races!

Experience Exchange is built on a Rails backend leveraging microservices, with a React/TypeScript frontend. The app is deployed via [Heroku](https://dashboard.heroku.com/login) for backend, and [Vercel](https://vercel.com/) for frontend.

This specific repo is a microservice for the retrieval of coordinates for user profiles. The microservice was built with the intent to keep our backend application in a microservice architecture. 

<br>Link to [Frontend Repo](https://github.com/experience-exchange-2307/fe_experience_exchange)
<br>Link to [Backend Repo](https://github.com/experience-exchange-2307/be_experience_exchange)

## Contributors
**Backend**

- Antoine Aube - [GitHub](https://github.com/Antoine-Aube) || [LinkedIn](https://www.linkedin.com/in/antoineaube/)
- Ethan Bustamante - [GitHub](https://github.com/ethanb1145) || [LinkedIn](https://www.linkedin.com/in/ethan-bustamante/)
- Tyler Blackmon - [GitHub](https://github.com/tblackmon-tiel) || [LinkedIn](www.linkedin.com/in/tyler-blackmon/)
- Jorja Fleming - [GitHub](https://github.com/JorjaF) || [LinkedIn](www.linkedin.com/in/jorjaf/)

**Frontend**

* Database creation
- Devin Altobello - [GitHub](https://github.com/daltobello) || [LinkedIn](https://www.linkedin.com/in/devin-altobello-2100036b/)
- Jen Ziel - [GitHub](https://github.com/jenziel) || [LinkedIn](https://www.linkedin.com/in/jen-ziel400/)
- Marisa Wyatt - [GitHub](https://github.com/Marisa5280) || [LinkedIn](https://www.linkedin.com/in/marisarwyatt/)

## Technologies
Primary:
- Ruby 3.2.2
- Rails 7.0.8

Production Gems:
- [Faraday](https://lostisland.github.io/faraday/#/)

Testing Gems:
- [rspec-rails](https://github.com/rspec/rspec-rails)

## Installation/Setup
### Cloning and installing dependencies
- `git clone <repo_name>`
- `cd <repo_name>`
- `bundle install`

### Third Party APIs
Experience Exchange uses two third party APIs - [Geoapify](https://apidocs.geoapify.com/docs/geocoding/forward-geocoding/#about) for geocoding, and [Unsplash](https://unsplash.com/documentation) for randomized user images. Only Geoapify needs to be setup in this microservice repo for retrieval of coordinates for a user's profile.

Follow the Geoapify documentation to get an API key, and place it in the rails credentials file as follows:
- `EDITOR="code --wait" rails credentials:edit`
```
geoapify:
  api_key: <YOUR_API_KEY>
```

### Setting up data
It's worth noting this repo is not intended to stand alone, having no database or way to hold its own data. Instead, it should only return data when its primary endpoint is hit with a valid address(see below).

## Testing
There are two options for testing, either the existing test suite, or manual testing with Postman.
- Test suite: `bundle exec rspec`
- Postman: `rails s`, then test on http://localhost:5001

## Endpoint Example
**Fetch an image - GET /api/v1/coordinates?address=38%20Upper%20Montagu%20Street,%20London%20W1H%201LJ,%20United%20Kingdom**
<details>
  <summary>Example Response</summary>

  ```json
  {
    "lat": 51.52016005,
    "lon": -0.16030636023550826
  }
  ```
</details>
