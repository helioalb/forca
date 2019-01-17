class Game
  def initialize(output = STDOUT)
    @output = output
    @ended = false
  end

  def ended?
    @ended
  end

  def start
    initial_message = 'Bem-vindo ao jogo da forca!'
    @output.puts initial_message
  end
end
