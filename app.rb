require 'capybara'
require 'sinatra'
require '/Users/student/Projects/admin/battle-project/lib/player.rb'
require '/Users/student/Projects/admin/battle-project/lib/game.rb'

class Battle < Sinatra::Base

  enable :sessions

    get '/' do
      erb(:intro)
    end

    get '/players' do
      erb(:players)
    end

    post '/names' do
      $game = Game.new(params[:player_1], params[:player_2])

      redirect '/play'
    end

    get '/play' do
      @game = $game
      erb(:play)
    end

    get '/attack' do
      @game = $game
      @game.attack(@game.player_2)
      erb(:attack)
    end

    get '/attack-1' do
      @game = $game
      @game.attack(@game.player_1)
      erb(:attack_1)
    end

    run! if app_file == $0
end
