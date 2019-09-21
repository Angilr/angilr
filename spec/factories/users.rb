FactoryBot.define do
  factory :user do
    username { 'Binladen' }
    email { 'bin@la.den' }
    gender { 0 }
    birthday { Date.new(1993, 7, 13) }
  end
end
