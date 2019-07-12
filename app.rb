require 'capybara'
require 'sinatra'
require './lib/player.rb'
require './lib/game.rb'

class Battle < Sinatra::Base

  enable :sessions

    get '/' do
      erb(:intro)
    end

    get '/players' do
      erb(:players)
    end

    post '/names' do
      player_1 = Player.new(params[:player_1])
      player_2 = Player.new(params[:player_2])
      @game = Game.create(player_1, player_2)

      redirect '/play'
    end

    get '/play' do
      @game = Game.instance
      # @game.switch_turns
      erb(:play)
    end

    get '/attack' do
      @game = Game.instance
      @game.switch_turns
      @game.attack(@game.current_turn)
      erb(:attack)
    end

    # get '/attack-1' do
    #   @game = $game
    #   @game.attack(@game.player_1)
    #   erb(:attack_1)
    # end


    run! if app_file == $0
end
