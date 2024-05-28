require "sinatra"
require "sinatra/reloader"
require "http"

get("/") do

  erb(:dog_house)
end

post("/fetch_dog") do
  @dog_url = HTTP.get("https://dog.ceo/api/breeds/image/random")
  
  @parsed_dog_url = JSON.parse(@dog_url)

  @dog_link = @parsed_dog_url.fetch("message")

  @dog_link_array = @dog_link.split("/")

  @dog_name = @dog_link_array.at(4)
  
  @clean_dog_name = @dog_name.capitalize.gsub("-", " ")
  erb(:fetch_dog)
end
