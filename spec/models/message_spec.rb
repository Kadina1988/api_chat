require 'rails_helper'

RSpec.describe Message, type: :model do
  context '#validation' do
    it 'is not valid when text is empty' do
      message = build(:message, text: '')
      expect(message).not_to be_valid
    end

    it 'is valid with text' do
      message = build(:message, text: "My text")
      expect(message).to be_valid
    end
  end
end
