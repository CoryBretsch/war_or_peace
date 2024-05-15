require './lib/card'
require './lib/card_generator'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'


# "7" lines max in a runner file

suits = [:spades, :diamonds, :hearts, :clubs]
values = ["2","3","4","5","6","7","8","9","10","J","Q","K", "A"]
ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

game = Game.new(suits, values, ranks).start_game

