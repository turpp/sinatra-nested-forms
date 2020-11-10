require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      erb :root
    end

    get '/new' do
      erb :"pirates/new"
    end

    post '/pirates' do
      #  binding.pry
      @pirate=Pirate.new(params[:pirate][:name],params[:pirate][:weight],params[:pirate][:height])

      params[:pirate][:ships].each do |details|
        Ship.new(details)
      end
      @ship=Ship.all
      
      erb :'pirates/show'
       
    end
  end
end
