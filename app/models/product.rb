# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text             not null
#  price       :integer          not null
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
	belongs_to :user

	validates :name, :description, :price, :user_id, presence: true
	validates :price, numericality: true

	after_create :send_to_action_cable


	def self.table
		Product.arel_table
	end

	def self.filter_page(page,size)
		Product.order(:created_at).page(page).per(size)
	end

	def self.search(page,size,filter)
		products = Product.filter_name(filter).or(Product.filter_description(filter))
		return products.filter_page(page,size)
	end


	def self.filter_name(filter)
		Product.where(table[:name].matches("%#{filter}%"))
	end

	def self.filter_description(filter)
		Product.where(table[:description].matches("%#{filter}%"))
	end

	private

		def send_to_action_cable
			data = {message: self,action:"new product"}
			ActionCable.server.broadcast "product",data
		end

end
