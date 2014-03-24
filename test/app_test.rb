#encoding: utf-8
require_relative '../app.rb'
require 'test/unit'
require 'rack/test'

class RPSTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_default
    get '/'
    assert last_response.ok?
    assert last_response.body.include?('<h2>Select the game mode</h2>')
  end

  def test_player_round
    get '/player_round'
    assert last_response.ok?
    assert last_response.body.include?('<h2>Your turn to play :)</h2>')
  end

  def test_auto_round
    get '/auto_round'
    assert last_response.ok?
  end

  def test_player_move
    post '/', :move => 'rock'
    assert last_response.body.include?('rock')
  end

end
