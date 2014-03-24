#encoding: utf-8
require 'sinatra'
require_relative 'lib/game_engine'

set :root, File.dirname(__FILE__)

get '/' do
  erb :index
end

post '/' do
  @output = GameEngine.resolve(["you", "computer"], 
    params[:user_move].to_sym, 
    GameEngine.random_move)
  erb :index
end

get '/player_round' do
  @available_moves = GameEngine.available_moves
  erb :single
end

get '/auto_round' do
  @output = GameEngine.resolve(["player1", "player2"],
    GameEngine.random_move, 
    GameEngine.random_move)
  erb :index
end
