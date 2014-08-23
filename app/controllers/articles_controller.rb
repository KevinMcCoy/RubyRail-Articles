class ArticlesController < ApplicationController

	# Require user/passowrd for everyhting except for index and show.  Since show has some controller function,
	# another http_basic_authenticate_with is added in comments_controller
	http_basic_authenticate_with name: "root", password: "pass", except: [:index, :show]

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		#  @article object is passed back to the new template when it is rendered.
		#  Create else render 'new' is done within the same request as the form submission, whereas the redirect_to will tell the browser to issue another request.
		@article = Article.new
	end

	def create
		#	render text: params[:article].inspect
		#	render plain: params[:article].inspect
		@article = Article.new(article_params)

		##Before if was added
		#@article.save
		#redirect_to @article
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	# Using a private method to encapsulate the permissible parameters
	# is just a good pattern since you'll be able to reuse the same
	# permit list between create and update. Also, you can specialize
	# this method with per-user checking of permissible attributes.
	private
		def article_params
			params.require(:article).permit(:title, :text)
		end

end
