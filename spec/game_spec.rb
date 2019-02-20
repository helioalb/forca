require 'spec_helper'
require 'game'

describe Game do
  let(:word_raffler) { double('word_raffler').as_null_object }
  subject(:game) { Game.new(word_raffler) }

  context 'when just created' do
    its(:state) { should == :initial }
  end

  describe '#guess_letter' do
    it 'returns true if the raffled word contains the given letter' do
      game.raffled_word = 'hey'

      expect(game.guess_letter('h')).to be_truthy
    end

    it "returns false if raffled word does'n t contain the given letter" do
      game.raffled_word = 'hey'

      expect(game.guess_letter('z')).to be_falsey
    end

    it 'returns false if the given letter is a blank string' do
      game.raffled_word = 'hey'

      expect(game.guess_letter('')).to be_falsey
      expect(game.guess_letter(' ')).to be_falsey
    end

    it 'saves the guessed letter when the guess is right' do
      game.raffled_word = 'hey'

      expect do
        game.guess_letter('h')
      end.to change { game.guessed_letters }.from([]).to(['h'])
    end

    it 'does not save a guessed letter more than once' do
      game.raffled_word = 'hey'
      game.guess_letter('h')

      expect do
        game.guess_letter('h')
      end.to_not change { game.guessed_letters }.from(['h'])
    end

    it 'updates the missed parts when the guess is wrong' do
      game.raffled_word = 'hey'

      game.guess_letter('z')

      expect(game.missed_parts).to eq ['cabeça']
    end
  end

  describe '#guessed_letters' do
    it 'returns the guessed letters' do
      game.raffled_word = 'hey'

      game.guess_letter('e')

      expect(game.guessed_letters).to eq ['e']
    end

    it "returns an empty array when there's no guessed letters" do
      expect(game.guessed_letters).to eq []
    end
  end

  describe '#missed_parts' do
    it "returns an empty array when there's no missed parts" do
      expect(game.missed_parts).to eq []
    end

    it 'returns the missed parts for each fail in guessing a letter' do
      game.raffled_word = 'hey'

      3.times do
        game.guess_letter('z')
      end

      expect(game.missed_parts).to eq ['cabeça', 'corpo', 'braço esquerdo']
    end
  end

  describe '#raffle' do
    it 'raffles a word with the given length' do
      expect(word_raffler).to receive(:raffle).with(3)

      game.raffle(3)
    end

    it 'saves the raffled word' do
      raffled_word = 'mom'
      allow(word_raffler).to receive(:raffle).and_return(raffled_word)

      game.raffle(3)

      expect(game.raffled_word).to eq(raffled_word)
    end

    it 'makes a transition from :initial to :word_raffled on success' do
      expect do
        game.raffle(3)
      end.to change { game.state }.from(:initial).to(:word_raffled)
    end

    it 'stays on the :initial state when a word can not be raffled' do
      allow(word_raffler).to receive(:raffle).and_return(nil)

      game.raffle(3)

      expect(game.state).to eq(:initial)
    end
  end

  describe '#ended?' do
    it 'returns false when the game just started' do
      expect(game).not_to be_ended
    end
  end

  describe '#finish' do
    it 'sets the game as ended' do
      game.finish

      expect(game).to be_ended
    end
  end
end
