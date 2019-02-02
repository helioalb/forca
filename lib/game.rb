# encoding: UTF-8

require_relative 'cli_ui'

class Game
  attr_accessor :raffled_word

  def initialize(ui = CliUi.new)
    @ui = ui
    @ended = false
  end

  def ended?
    @ended
  end

  def next_step
    @ui.write('Qual o tamanho da palavra a ser sorteada?')
    player_input = @ui.read.strip

    if player_input == 'fim'
      @ended = true
    else
      word_length = player_input.to_i
      words = %w(hi mom game fruit)

      @raffled_word = words.detect { |word| word.length == word_length }
    end
  end

  def start
    initial_message = 'Bem-vindo ao jogo da forca!'
    @ui.write(initial_message)
  end
end
