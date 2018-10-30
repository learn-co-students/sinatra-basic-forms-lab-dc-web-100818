require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/' do
    dog = Puppy.new(params["name"], params["breed"], params["age"])
    @name = dog.name
    @breed = dog.breed
    @age = dog.age
    erb :display_puppy
  end

  get '/new' do
    erb :create_puppy
  end

end
