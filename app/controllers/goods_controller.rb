class GoodsController < ApplicationController
	def new
	end

	def create
		@good = Good.new(params[:good])

		@good.save
		redirect_to @good	end
end
