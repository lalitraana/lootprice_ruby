#require 'flipkart_api'

class WelcomeController < ApplicationController
  
  def index
  	
  	###########################################
  	#				JSON TESTING			  #
  	###########################################

  	#@a = "Hi"
  	#Mobile.destroy_all
  	#@mobile = Mobile.all
  	
  	json = File.read('app/assets/json/input.json')
	obj = JSON.parse(json)
	
	@x = obj["President"]
	
	@y = obj["CEO"]
  end

  
  def id
  	
	###########################################
  	#  	    flipkart fetching from id		  #
  	###########################################

  	json = File.read('app/assets/json/flipkart.json')
	obj = JSON.parse(json)

	fp_api = FlipkartApi.new("rubalpsgm", "d31f2e4d912e4670942b0e6170b8e571")

	categories = fp_api.get_categories   #Returns in JSON format

	#@products = fp_api.get_products_by_category("mobiles") #Name is as present in categories (xml/json). Returns in json format.

	product = fp_api.get_product_by_id("MOBDPPZZDX8WSPAT") #id assigned by flipkart for a product.
	
	obj = JSON.parse(product)
	
	@name = obj["productBaseInfo"]["productAttributes"]["title"]
	@img = obj["productBaseInfo"]["productAttributes"]["imageUrls"]["275x275"]
	@mrp = obj["productBaseInfo"]["productAttributes"]["maximumRetailPrice"]["amount"]
	@sp = obj["productBaseInfo"]["productAttributes"]["sellingPrice"]["amount"]
	@buy = obj["productBaseInfo"]["productAttributes"]["productUrl"]

	#dotd= fp_api.get_dotd_offers(format) #to get deals of the day. format = xml/json

	#top_offers = fp_api.get_topoffers(format)

	#render action: 'index'
  end

  def reference

  	###########################################
  	#  	    flipkart reference json		      #
  	###########################################

  	json = File.read('app/assets/json/flipkart.json')
	obj = JSON.parse(json)
	
	@x = obj["title"]
	@y = obj["description"]

	fp_api = FlipkartApi.new("rubalpsgm", "d31f2e4d912e4670942b0e6170b8e571")

	categories = fp_api.get_categories   #Returns in JSON format

	#@products = fp_api.get_products_by_category("mobiles") #Name is as present in categories (xml/json). Returns in json format.

	@product = fp_api.get_product_by_id("MOBDPPZZDX8WSPAT") #id assigned by flipkart for a product.
	#@a = product
	#obj = JSON.parse(product)
	#@name = obj["productBaseInfo"]["productAttributes"]["title"]
	#@img = obj["productBaseInfo"]["productAttributes"]["imageUrls"]["275x275"]
	#@mrp = obj["productBaseInfo"]["productAttributes"]["maximumRetailPrice"]["amount"]
	#@sp = obj["productBaseInfo"]["productAttributes"]["sellingPrice"]["amount"]
	#@buy = obj["productBaseInfo"]["productAttributes"]["productUrl"]
	
	#require 'flipkart_api'

	#fp_api = FlipkartApi.new(Fk-Affiliate-Id, Fk-Affiliate-Token)

	#categories = fp_api.get_categories   #Returns in JSON format

	#products = fp_api.get_products_by_category(category_name) #Name is as present in categories (xml/json). Returns in json format.

	#product = fb_api.get_product_by_id(product_id) #id assigned by flipkart for a product.

	#dotd= fp_api.get_dotd_offers(format) #to get deals of the day. format = xml/json

	#top_offers = fp_api.get_topoffers(format)



  end

  def unnamed

  	fp_api = FlipkartApi.new("rubalpsgm", "d31f2e4d912e4670942b0e6170b8e571")

	categories = fp_api.get_categories
	#@products = fp_api.get_products_by_category("mobiles")
	top_offers = fp_api.get_top_offers("json")
	@a = top_offers

	@x = Array.new()
	@r = Array.new()
	
	obj = JSON.parse(top_offers)
	@x = obj["topOffersList"]

	len = @x.length

	for i in 0..(len-1)
		@r[i] = @x[i]["imageUrls"][0]
	end

	#@product = fp_api.get_product_by_id("MOBDPPZZDX8WSPAT")

  end

end