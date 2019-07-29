# frozen_string_literal: true

FactoryBot.define do
  factory :city do
    association(:weather)

    name { 'Warszawa' }
  end
end
