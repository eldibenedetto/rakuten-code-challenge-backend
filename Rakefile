# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require 'open-uri'
require 'rubygems/package'
require 'csv'

Rails.application.load_tasks




desc "Process Data"
task :process => :environment do

  uri = "https://s3.amazonaws.com/rm-rant-interviewing/products.tar.gz"
  source = open(uri)
  tar_extract = Gem::Package::TarReader.new(Zlib::GzipReader.open(source))
  tar_extract.rewind # The extract has to be rewinded after every iteration
  tar_extract.each do |entry|
    if File.extname(entry.full_name) === ".txt"
      txt_info = entry.read.split(",")
      txt_info.map do |entry|
        advertiser = entry[1...-1]
        Advertiser.create(advertiser_name: advertiser)
      end
      puts Advertiser.all.length
    elsif File.extname(entry.full_name) === ".csv"
      csv_info = entry.full_name
      products = []
      CSV.foreach(csv_info, :headers => true, :col_sep => ',') do |row|
        advertiser = Advertiser.find_or_create_by(advertiser_name: row["Advertiser"])
        products << Product.new(product_name: row["Product Name"], sku: row["SKU"], advertiser_id: advertiser.id)
      end
      Product.import(products)
      puts Product.all.length
    else
      puts "We cannot handle #{File.extname(entry.full_name)} files at this time."
    end
    # puts entry.read
  end
  tar_extract.close

end
