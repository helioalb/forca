# encoding: UTF-8

Quando /^começo um novo jogo$/ do
  steps %{
    * I run `forca` interactively
  }
end

Então /^vejo na tela:$/ do |string|
  pending
end
