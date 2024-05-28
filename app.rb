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

  @dog_name = @dog_link_array.at(4).upcase
  
  @dog_sub = @dog_name.gsub("-", " ")

  @dog_order = @dog_sub.split(" ")

  @breed = @dog_order.at(1)
  @type =  @dog_order.at(0)



  erb(:fetch_dog)
end
