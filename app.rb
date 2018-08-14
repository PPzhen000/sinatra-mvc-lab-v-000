require_relative 'config/environment'
require_relative 'models/piglatinizer.rb'
require 'pry'

class App < Sinatra::Base

  get '/' do
    erb :user_input
  end

  post '/piglatinize' do
    @pig_text = PigLatinizer.new.piglatinize(params[:user_phrase])
    # binding.pry
    erb :piglatinize
  end
end
