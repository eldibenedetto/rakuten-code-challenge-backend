class CreateAdvertiser < ActiveRecord::Migration[5.1]
  def change
    create_table :advertisers do |t|
      t.string :advertiser_name
    end
  end
end
