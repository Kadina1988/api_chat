class UserSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :email, :phone_number
end
