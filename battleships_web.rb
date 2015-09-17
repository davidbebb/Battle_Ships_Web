require 'sinatra/base' #controller
require 'sinatra/partial'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/water'


class BattleshipsWeb < Sinatra::Base
  register Sinatra::Partial
  set :views, proc { File.join(root, 'views') }
  set :partial_template_engine, :erb
  # enable :partial_underscores


  get '/' do
    erb :index
  end

  get '/new_game' do
    @name = params[:name]
    @board = Board.new(Cell).grid
    output = ""
    output << partial( :new_game )
    output << partial( :print_board )
    output
  end

  get '/add_ships' do
    @fleet = [Ship.aircraft_carrier, Ship.battleship, Ship.destroyer, Ship.submarine, Ship.patrol_boat ]
    erb :add_ships
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
