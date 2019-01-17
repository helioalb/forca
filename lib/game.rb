class Game
  def initialize(input= STDIN, output = STDOUT)
    @input = input
    @output = output
    @ended = false
  end

  def ended?
    @ended
  end

  def next_step
    @output.puts('Qual o tamanho da palavra a ser sorteada?')
    word_length = @input.gets
  end

  def start
    initial_message = 'Bem-vindo ao jogo da forca!'
    @output.puts initial_message
  end
end
