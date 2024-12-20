require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validation' do 
    it 'should not be valid with the same nickname' do 
      user = create(:user)
      new_user = build(:user, nickname: user.nickname)
      expect(new_user).not_to be_valid
    end

    it "should't be valid with the same email" do 
      user = create(:user) 
      new_user = build(:user, email: user.email) 
      expect(new_user).not_to be_valid
    end
    
    it 'should be valid' do 
      user = build(:user)
      expect(user).to be_valid
    end
  end
end
