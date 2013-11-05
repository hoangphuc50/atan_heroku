class ContactsController < ApplicationController
   layout "home"
   before_filter :check_language
   def check_language
     session[:language]= Language.where(:language_code=>params[:lang]).first().id if !params[:lang].nil?
     session[:locale]= params[:lang] if !params[:lang].nil?
     I18n.locale = session[:locale]
     if session[:language]==nil
       @language_id=Language.where(default='true').first().id
       session[:language]=@language_id
     else
       @language_id=session[:language]
     end
     I18n.locale = Language.where(:id=>session[:language]).first().language_code
   end
  def new
    category_id=Category.where("name='contact'").first().id
    @article_map= ArticleLanguage.includes(:article,:language).where("language_id=#{@language_id} and articles.category_id=#{category_id} and articles.priority=1").first()
    @contact_info= ArticleLanguage.includes(:article,:language).where("language_id=#{@language_id} and articles.category_id=#{category_id} and articles.priority=2").first()
    @inquiry = Contact.new
  end

  def create
    #@inquiry = Contact.new(params[:inquiry])
    #if @inquiry.deliver
    #  render :thank_you
    #else
    #  render :new
    #end
    Pony.mail({
                  :from =>"noreply@atansolutions.com",
                  :to => params[:contact][:email],
                  :subject => "Contact to atansolutions.com",
                  :html_body => "<html><body><h1>Thank you for your contact</h1>
                            <h3>Your name: #{params[:contact][:first_name]} #{params[:contact][:last_name]}</h3>
                            <h3>Content is:</h3><p>#{params[:contact][:message]}</p>
                            <h3>Date: #{Date.today}</h3></body></html>",
                  :via => :smtp,
                  :via_options => {
                      :address              => 'smtp.gmail.com',
                      :port                 => '587',
                      :enable_starttls_auto => true,
                      :user_name            => 'thongtinkhachhang@gmail.com',
                      :password             => '665335665335',
                      :authentication       => :plain,
                      :domain               => "localhost.localdomain"
                  }
              })
     if
       render :thank_you
     else
       render :new
    end
  end

end