class Admin::CategoriesController < Admin::ApplicationController
  before_action :signed_in_user
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @category = Category.order('parent_id desc,name asc').all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @articles = Article.where('category_id = ?',params[:id])
    page_size=5
    if params[:page]==nil
      page=1
    else
      page=params[:page]
    end
    @total_page= Array.new(@articles.count / page_size +1)
    offset=(page.to_i*page_size.to_i)- page_size.to_i
    @articles=@articles.limit(page_size).offset(offset)
  end

  # GET /categories/new
  def new
    @category = Category.new
    #@category_language=CategoryLanguage.new
  end

  # GET /categories/1/edit
  def edit
    #@category_language=CategoryLanguage.find(params[:id],params[:language_id])
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = I18n.t('admin.categories.new.success', :name => @category.name)
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    if @category.update(category_params)
      flash[:notice] = I18n.t('admin.categories.edit.success', :name => @category.name)
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    if @category.destroy
      flash[:notice] = I18n.t('admin.categories.destroy.success', :name => @category.name)
    else
      flash[:notice] = I18n.t('admin.categories.destroy.failure', :name => @category.name)
    end

    redirect_to :action => :index
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
    #@category_language=CategoryLanguage.where(:language_id=>params[:language_id],:category_id=>params[:category_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
end
