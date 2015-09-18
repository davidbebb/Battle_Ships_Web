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
  enable :sessions
  # enable :partial_underscores


  get '/' do
    erb :index
  end

  get '/new_game' do
    @name = params[:name]
    @board = Board.new(Cell)
    session[:board] = @board
    output = ""
    output << partial( :new_game )
    output << partial( :print_board )
    output
  end

  get '/add_ships' do
    @ship = Ship.aircraft_carrier
    session[:ship] = @ship
    @board=session[:board]
    output = ""
    output << partial( :add_ships )
    output << partial( :print_board )
    output
  end

  post '/add_ships' do
    session[:board].place(session[:ship], params[:coords].to_sym, params[:orientation].to_sym)
    redirect '/add_ships'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
