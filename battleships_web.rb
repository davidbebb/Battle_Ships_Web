require 'sinatra/base' #controller
require './lib/board'
require './lib/cell'

class BattleshipsWeb < Sinatra::Base
  set :views, proc { File.join(root, 'views') }

  get '/' do
    erb :index
  end

  get '/new_game' do
    @name = params[:name]
    @board = Board.new(Cell).grid #we need .new here - WHY? And if we remove it, it only affects a new session....
    # erb :new_game
    erb :print_board
  end

  # post '/board' do
  #   session[:name] = params[:name]
  #   @name = session[:name]
  #   # @board = Board.new
  #   erb :board
  # end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
