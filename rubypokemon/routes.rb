require 'sinatra'
require 'pry'
require 'httparty'

class MyServer < Sinatra::Base

  get '/' do
    @team = []

    3.times do
      num = rand(1..150)
      response = HTTParty.get "https://pokeapi.co/api/v2/pokemon/#{num}"
      pokemon = response.parsed_response['name']
      @team.push pokemon
      sleep 0.5
    end

    erb :index
  end

end
