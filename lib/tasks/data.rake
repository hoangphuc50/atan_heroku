namespace :data do
  task :load_data => :environment do
    #create User
    User.create(:name=>"hoangphuc50@gmail.com",:encrypted_password=>"665335")
    #Create Languages
    Language.create(:name=>"English",:enable=>true,:default=>true,:language_code=>"en")
    Language.create(:name=>"Vietnamese",:enable=>true,:default=>false,:language_code=>"vi")
    #Create Category
    category=[
        ["index"],
        ["projects"],
        ["news"],
        ["contact"],
        ["about_us"],
        ["services"]
    ]
    category.each do |row|
      Category.create(:name => row[0])
      puts row[0]
    end
  end
  task :index_article => :environment do
    #[
    # ["category id=1","user id = 3","enable","lang_id =1","title","content"]
    # ]
    index_article=[
        [1,3,true,1,"Slide",""],
        [1,3,true,1,"Mini slide about us",""] ,
        [1,3,true,1,"Slide good comment",""]
    ]
    #Create for index page
    index_article.each do |row|
      new_article=Article.create(:category_id => row[0],:user_id=>3,:images=>"",:priority=>1,:enable=>true)
      ArticleLanguage.create(:article_id=>new_article.id,:language_id=>1,:title=>"",:content=>"")
      puts row[0]
    end
  end
  task :services_data=>:environment do
    services_data=[
        ["Worldwide Support 1","Lorem ipsum dolor slo onsec tueraliquet Morbi nec In Curabitur lreaoreet nisl lorem in pellente pellente eget. Lorem ipsum dolor slo onsec Vivamus"],
        ["Worldwide Support 2","Lorem ipsum dolor slo onsec tueraliquet Morbi nec In Curabitur lreaoreet nisl lorem in pellente pellente eget. Lorem ipsum dolor slo onsec Vivamus"],
        ["Worldwide Support 3","Lorem ipsum dolor slo onsec tueraliquet Morbi nec In Curabitur lreaoreet nisl lorem in pellente pellente eget. Lorem ipsum dolor slo onsec Vivamus"],
        ["Worldwide Support 4","Lorem ipsum dolor slo onsec tueraliquet Morbi nec In Curabitur lreaoreet nisl lorem in pellente pellente eget. Lorem ipsum dolor slo onsec Vivamus"],
        ["Worldwide Support 5","Lorem ipsum dolor slo onsec tueraliquet Morbi nec In Curabitur lreaoreet nisl lorem in pellente pellente eget. Lorem ipsum dolor slo onsec Vivamus"],
        ["Worldwide Support 6","Lorem ipsum dolor slo onsec tueraliquet Morbi nec In Curabitur lreaoreet nisl lorem in pellente pellente eget. Lorem ipsum dolor slo onsec Vivamus"],

    ]
    services_data.each do |row|
    new_article=Article.create(:category_id => 6,:user_id=>3,:images=>"",:priority=>1,:enable=>true)
    ArticleLanguage.create(:article_id=>new_article.id,:language_id=>1,:title=>row[0],:short_description =>row[1],:content=>row[1])
    puts row[0]
    end
  end
  task :about_us_data=>:environment do
    about_us_data=[
        ["About us"],
        ["Slide about us"],
        ["Member"],
        ["Slide_bottom"],
    ]
    about_us_data.each do |row|
      new_article=Article.create(:category_id => 5,:user_id=>3,:images=>"",:priority=>1,:enable=>true)
      ArticleLanguage.create(:article_id=>new_article.id,:language_id=>1,:title=>row[0],:short_description =>"",:content=>"")
      puts row[0]
    end
  end
  task :projects_data=>:environment do
  #project_category=[
  #    ["Web design","web_design"],
  #    ["Photography","photography"],
  #    ["Motion graphics",''],
  #    ["Developer",''],
  #]
  projects=[
      ["Black winged angel",7],
      ["Winged angel 2 ",7],
      ["Black winged angel",7],
      ["Black winged angel",8],
      ["Dark angel",8],
      ["Winged angel 2 ",8],
      ["Black winged angel",8],
      ["Black winged angel",9],
      ["Black winged angel",9],
      ["Dark angel",9],
      ["Winged angel 2 ",10],
      ["Black winged angel",10]

  ]
  #project_category.each do |row|
  #  new_category=Category.create(:parent_id=>2,:name=>row[1])
  #  CategoryLanguage.create(:category_id=>new_category.id,:language_id=>1,:title=>row[0])
  #  puts row[0]
  #end
  projects.each do |row|
    new_article=Article.new
    new_article.category_id=row[1]
    new_article.user_id=3
    new_article.priority=1
    new_article.enable=true
    new_article.images="project_demo.jpg"
    new_article.save

    new_article_lang= ArticleLanguage.new
    new_article_lang.article_id=new_article.id
    new_article_lang.language_id=1
    new_article_lang.title=row[0]
    new_article_lang.short_description=""
    new_article_lang.content=""
    new_article_lang.save
    #ArticleLanguage.create(:article_id=>new_article.id,:language_id=>1,:title=>row[0],:short_description =>"",:content=>"")
    #puts row[0]
  end
  end
  task :news_data=>:environment do
    #news_category=[
    #    ["Branding"],
    #    ["Development"],
    #    ["Graphic design"],
    #    ["Photo"],
    #    ["Web design"],
    #    ["Solutions"],
    #]
    #news_category.each do |row|
    #  new_category=Category.create(:parent_id=>3,:name=>row[0].downcase)
    #  CategoryLanguage.create(:category_id=>new_category.id,:language_id=>1,:title=>row[0])
    #  puts row[0]
    #end
    news=[
        [""],
        [""],
        [""],
        [""],
        [""]
    ]
    news.each do |row|
      new_article=Article.create(:category_id => 12,:user_id=>3,:images=>"",:priority=>1,:enable=>true)
      ArticleLanguage.create(:article_id=>new_article.id,:language_id=>1,:title=>row[0],:short_description =>"Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. isl ut aliquip ex ea commodo ",:content=>"")
      puts row[0]
    end
  end
  task :contact_data=>:environment do
    news=[
        [""],
        [""],
        [""],
        [""],
        [""]
    ]
    news.each do |row|
      new_article=Article.create(:category_id => 4,:user_id=>3,:images=>"",:priority=>1,:enable=>true)
      ArticleLanguage.create(:article_id=>new_article.id,:language_id=>1,:title=>row[0],:short_description =>"Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. isl ut aliquip ex ea commodo ",:content=>"")
      puts row[0]
    end

  end
end