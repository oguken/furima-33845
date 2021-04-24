FactoryBot.define do
  factory :user do
    nick_name             {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}

    first_name            {'test'}
    second_name           {'test'}
    first_name_kana       {'test'}
    second_name_kana      {'test'}
    birthday              {'test'}
  end
end