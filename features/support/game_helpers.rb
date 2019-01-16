module GameHelpers
  def start_new_game
    steps %{
      * I run `forca` interactively
    }
  end
end

World(GameHelpers)
