require "sinatra"
require "sinatra/reloader"
require "http"

get("/") do
  @dog_url = HTTP.get("https://dog.ceo/api/breeds/image/random")
  
  @parsed_dog_url = JSON.parse(@dog_url)

  @dog_link = @parsed_dog_url.fetch("message")
  erb(:index)
end
