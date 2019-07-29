require 'rails_helper'

RSpec.describe CreatePostForm do
  subject { CreatePostForm.new(arguments) }

  let(:arguments) do
    {
      note: 'a',
      user_id: 1,
      city_name: 'Warszawa',
      temperature: 20
    }
  end

  context 'when arguments are correct' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'when note is nil' do
    it 'is invalid' do
      subject.note = nil
      expect(subject).to be_invalid
    end
  end

  context 'when user id is nil' do
    it 'is invalid' do
      subject.user_id = nil
      expect(subject).to be_invalid
    end
  end

  context 'when city name is nil' do
    it 'is invalid' do
      subject.city_name = nil
      expect(subject).to be_invalid
    end
  end

  context 'when temperature is nil' do
    it 'is invalid' do
      subject.temperature = nil
      expect(subject).to be_invalid
    end
  end
end
