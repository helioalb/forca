# encoding: UTF-8

require 'game'
require 'spec_helper'

describe Game do
  describe '#start' do
    it 'prints the initial message' do
      game = Game.new

      game.start

      initial_message = 'Bem-vindo ao jodo da forca!'
      expect(STDOUT).to include(initial_message)
    end
  end
end

