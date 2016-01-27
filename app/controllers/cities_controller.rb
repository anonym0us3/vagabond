class CitiesController < ApplicationController

	before_action :logged_in?, only: [:new, :edit, :create]

	def index
		@cities = City.all
	end

	def new
		@cities = City.new
	end

	#TODO: good coding convention on the get prefix, i'm going to use just city_params as per our wdi labs
	def create
		@cities = City.create(city_params)

		redirect_to '/show.html.erb'
	end

	def show
		@cities = City.find_by_id(params[:id])
		@posts = @cities.posts
	end

	private

	def city_params
		params.require(:cities).permit(:name)
	end
end
