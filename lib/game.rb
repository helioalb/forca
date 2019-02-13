# encoding: UTF-8

require_relative 'cli_ui'
require_relative 'word_raffler'

class Game
  attr_accessor :raffled_word
  attr_accessor :state
  attr_reader :guessed_letters

  def initialize(word_raffler = WordRaffler.new)
    @word_raffler = word_raffler
    @state = :initial
    @guessed_letters = []
  end

  def ended?
    @state == :ended
  end

  def finish
    @state = :ended
  end

  def guess_letter(letter)
    return false if letter.strip == ''

    if @raffled_word.include?(letter)
      @guessed_letters << letter
      @guessed_letters.uniq!
      return true
    end

    false
  end

  def raffle(word_length)
    @raffled_word = @word_raffler.raffle(word_length)
    @state = :word_raffled if @raffled_word
    @raffled_word
  end

  def start
    initial_message = 'Bem-vindo ao jogo da forca!'
    @ui.write(initial_message)
  end
end
