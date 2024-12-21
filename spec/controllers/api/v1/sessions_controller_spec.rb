require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do
  describe '#sign_up' do 
    # let(:request_body) do 
		# 	data: {
		# 		attributes: {
		# 		  email: 'mike@mail.com',
		# 			phone_number: '8888888',
		# 			nickname: 'Mike'
		# 		}
		# 	}
    # end

    it 'should create User' do 
      post :sign_up#, params: request_body 
			expect(response).to have_http_status(201) 
    end
  end
end
