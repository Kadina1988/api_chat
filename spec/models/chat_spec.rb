require 'rails_helper'

RSpec.describe Chat, type: :model do
  context "#validation" do
    let(:user_1) { create :user, :confirmed }
    let(:user_2) { create :user, :confirmed }
    it 'is valid with sender and receiver' do
      chat = build(:chat, sender: user_1, receiver: user_2)
      expect(chat).to be_valid
    end

    it 'is not valid without receiver' do
      chat = build(:chat, sender: user_1)
      expect(chat).not_to be_valid
    end
  end
end
