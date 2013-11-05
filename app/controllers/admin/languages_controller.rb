class Admin::LanguagesController < Admin::ApplicationController
  before_action :signed_in_user
  before_action :set_language, only: [:show, :edit, :update, :destroy]

  # GET /languages
  # GET /languages.json
  def index
    @language = Language.order('name ASC').all
  end
  def select
    render(:partial => '/admin/categories/title_category_by_language',
           :layout => false,
           :locals => {
               :language_id => params[:language_id],
               :category_id => params[:category_id]
           })
  end
  # GET /languages/1
  # GET /languages/1.json
  def show
  end

  # GET /languages/new
  def new
    @language = Language.new
    @category_language = CategoryLanguage.new
  end

  # GET /languages/1/edit
  def edit
  end

  # POST /languages
  # POST /languages.json
  def create

    @language = Language.new(language_params)
    if @language.save
      if language_params[:default] ='true'
        Language.where(:default  =>true).where("id != #{@language[:id]}").first().update_attributes(:default => false)
      end
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  # PATCH/PUT /languages/1
  # PATCH/PUT /languages/1.json
  def update

    if @language.update(language_params)
      if language_params[:default] ='true'
        Language.where(:default  =>true).where("id != #{@language[:id]}").first().update_attributes(:default => false)
      end
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end

  # DELETE /languages/1
  # DELETE /languages/1.json
  def destroy
    if @language[:default] ='true'
      Language.where("id != #{@language[:id]}").first().update_attributes(:default => true)
    end
    if @language.destroy
      flash[:notice] = I18n.t('admin.languages.destroy.success', :name => @language.name)
    else
      flash[:notice] = I18n.t('admin.languages.destroy.failure', :name => @language.name)
    end

    redirect_to :action => :index
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_language
    @language = Language.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def language_params
    params.require(:language).permit(:name, :description, :language_code, :enable, :default)
  end

end
