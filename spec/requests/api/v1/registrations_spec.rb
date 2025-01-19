require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  describe "POST /api/v1/sign_up" do
    context 'when the correct request sent' do
      let(:valid_attributes) do
        {
          user: {
            nickname: 'Jon',
            email: 'jon@mail.com',
            password: 'moscow',
            password_confirmation: 'moscow'
          }
        }
      end

      subject { post '/api/v1/sign_up', params: valid_attributes }

      it 'should return status code 201' do
        subject
        expect(response).to have_http_status(:created)
      end

      it 'should return proper attributes' do
        subject
        expect(json['data']['attributes']['email']).to eq('jon@mail.com')
      end

      it 'should change users count' do
        expect { subject }.to change { User.all.count }.by(1)
      end
    end

    context 'when incorrect request sent' do
      subject { post '/api/v1/sign_up', params: invalid_attributes }

      context 'when any attribute is blank' do
        let(:invalid_attributes) do
          {
            user: {
              nickname: '',
              email: 'jon@mail.com',
              password: 'moscow',
              password_confirmation: 'moscow'
            }
          }
        end

        it 'should return status 442' do
          subject
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'should return nickname error' do
          subject
          expect(json['nickname']).to include("can't be blank")
        end
      end

      context 'when attribute is use' do
        let(:invalid_attributes) do
          {
            user: {
              nickname: 'John',
              email: 'jon@mail.com',
              password: 'moscow',
              password_confirmation: 'moscow'
            }
          }
        end

        let!(:user) { create :user, :confirmed, email: 'jon@mail.com' }

        it "should return email error" do
          subject
          expect(json['email']).to include('has already been taken')
        end

        it "should't change count user" do
          expect { subject }.not_to change { User.all.count }
        end
      end
    end
  end
end
