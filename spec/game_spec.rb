# encoding: UTF-8

require 'game'
require 'spec_helper'

describe Game do
  let(:output) { double('output') }

  subject(:game) { Game.new(output) }

  describe '#ended?' do
    it 'returns false when the game just started' do
      expect(game).not_to be_ended
    end
  end

  describe '#start' do
    it 'prints the initial message' do
      initial_message = 'Bem-vindo ao jogo da forca!'

      expect(output).to receive(:puts).with(initial_message)

      game.start
    end
  end
end
