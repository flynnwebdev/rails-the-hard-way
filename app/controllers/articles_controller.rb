class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index
        @articles = Article.all
    end
    def new
        @article = Article.new
    end
    def create
        # Create new instance of the Article model,
        # populated with data from the params hash
        @article = Article.new(article_params)
        # Save the new article to the db
        if @article.save
            # Redirect to the page for viewing a single article
            redirect_to @article
        else
            render 'new'
        end
    end
    def show
        # @article = Article.find(params[:id])
        # ... write code here. We can assume @article exists.
    end
    def edit
        # @article = Article.find(params[:id])
    end
    def update
        # @article = Article.find(params[:id])        
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end         
    end
    def destroy
        # @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end
    
    private
    
    def article_params
        params.require(:article).permit(:title, :content)
    end

    def set_article
        @article = Article.find(params[:id])
    end

end
