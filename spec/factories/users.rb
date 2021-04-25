FactoryBot.define do
  factory :user do
    nick_name             {'test'}
    email                 {'test@example'}
    password              {'0a'}
    password_confirmation {'0a'}

    first_name            {'漢字'}
    second_name           {'漢字'}
    first_name_kana       {'カナ'}
    second_name_kana      {'カナ'}
    birthday              {'1930'}
  end
end