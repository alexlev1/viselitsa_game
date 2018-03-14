require 'rspec'

require_relative "../lib/game"
require "unicode_utils/downcase"

describe Game do

  describe '#play and won' do
    it 'should do play and win' do
      game = Game.new("загадка")
      game.next_step("з")
      game.next_step("а")
      game.next_step("г")
      game.next_step("д")
      game.next_step("к")
      expect(game.status).to eq :won
      expect(game.errors).to eq 0
    end
  end

  describe '#play and lose' do
    it 'should do play and lose' do
      game = Game.new("загадка")
      game.next_step("б")
      game.next_step("в")
      game.next_step("и")
      game.next_step("г")
      game.next_step("д")
      game.next_step("e")
      game.next_step("ж")
      game.next_step("о")
      game.next_step("л")
      expect(game.status).to eq :lost
      expect(game.errors).to eq 7
    end
  end
end