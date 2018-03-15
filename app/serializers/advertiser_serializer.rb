class AdvertiserSerializer < ActiveModel::Serializer
  attributes :advertiser_name

  has_many :products
end
