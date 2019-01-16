# encoding: UTF-8

Quando /^começo um novo jogo$/ do
  start_new_game
end

Então /^o jogo termina com a seguinte mensagem na tela:$/ do |text|
  assert_passing_with(text)
end

Dado /^que comecei um jogo$/ do
  start_new_game
end

Quando /^escolho que a palavra a ser sorteada deverá ter "(.*?)" letras$/ do |number_of_letters|
  type(number_of_letters)
end
