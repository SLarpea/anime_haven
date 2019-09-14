require 'rails_helper'

RSpec.describe CharactersHelper, type: :helper do
  describe '#main_character' do
    let(:anime) {create(:anime)}
    before :each do
      5.times do
        create(:main_character,anime: anime)
      end
    end

    it 'should check the character role if its main character' do
      characters = helper.main_character(Character.all)
      characters.each do |character|
        expect(character.role).to eq('Main Character')
      end
    end
  end

  describe '#side_character' do
    let(:anime) {create(:anime)}
    before :each do
      5.times do
        create(:side_character, anime: anime)
      end
    end

    it 'should check the character role if its side character' do
      characters = helper.main_character(Character.all)
      characters.each do |character|
        expect(character.role).to eq('Side Character')
      end
    end
  end
end