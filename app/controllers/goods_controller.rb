require 'date'

class GoodsController < ApplicationController

	def index
		@goods = Good.all.order(:expirationDate)
	end

	def show
		@good = Good.find(params[:id])
	end

	def new
		@good = Good.new
	end

	def edit
		@good = Good.find(params[:id])
	end

	def create
		@good = Good.new(good_params)

		@good.purchaseDate = Date.today()
		@good.expirationDate= @good.purchaseDate + @good.shelfLife

		if @good.save
			redirect_to goods_index_path
		else
			render 'new'
		end
	end

	def update
		@good = Good.find(params[:id])

		if @good.update(good_params)
			redirect_to goods_index_path
		else
			render 'edit'
		end
	end

	def destroy
		@good = Good.find(params[:id])
		@good.destroy

		redirect_to goods_path
	end

	def threedays
		@goods = Good.where("expirationDate < ?", Date.today + 3).order(:expirationDate)
	end

	def week
		@goods = Good.where("expirationDate < ?", Date.today + 7).order(:expirationDate)
	end

	private
	def good_params
		params.require(:good).permit(:product, :shelfLife)
	end

end
