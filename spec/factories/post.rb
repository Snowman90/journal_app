# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    association(:city)
    association(:user)

    note { 'That was fun' }
  end
end
