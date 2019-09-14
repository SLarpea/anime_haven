FactoryBot.define do
  factory :anime do
    title {'Onepiece'}
    information {'I will be the King of the Pirates!'}
    before(:create) do |anime|
      anime.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'onepiece.jpeg')), filename: 'saitama.jpeg', content_type: 'image/jpeg')
    end
  end
end