class ArticlesController < ApplicationController
  before_action :set_article , only: [:show,:destroy,:update,:edit]
  def index
    @articles=Article.paginate(page: params[:page], per_page:5).order(id: :desc)
    #@articles=Article.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @article=Article.new
  end

  def create
    @article=Article.new(article_params)
    @article.user=User.first
    if @article.save
      flash[:notice]="Article was saved successfully"
      redirect_to @article
    else
      render :new
    end
  end

  def edit
   end

  def update
     if @article.update(article_params)
      flash[:notice] = "Article was updated Successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  private
  def article_params
    params.require(:article).permit(:title,:description)
  end

  def set_article
    @article=Article.find(params[:id])
  end
end
