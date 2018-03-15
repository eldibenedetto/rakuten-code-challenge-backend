class ProductSerializer < ActiveModel::Serializer
  attributes :id, :product_name, :sku

  belongs_to :advertiser
end
