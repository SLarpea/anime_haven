FactoryBot.define do
  factory :character do
    character_name {'Nami'}
    character_description {'Navigator of Mugiwara Pirates'}
    appearance {'2nd Episode'}
    anime {}

    after(:build) do |character|
      character.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'saitama.jpeg')), filename: 'saitama.jpeg', content_type: 'image/jpeg')
      character.avatar.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'saitama.jpeg')), filename: 'saitama.jpeg', content_type: 'image/jpeg')
    end

  end

  factory :main_character, parent: :character do
    role {'Main Character'}
  end

  factory :side_character, parent: :character do
    role {'Side Character'}
  end

end