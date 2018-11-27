activate :directory_indexes

set :relative_links, true
set :haml, format: :html5

# Disable Haml warnings
Haml::TempleEngine.disable_option_validator!

page "/*.xml", layout: false
page "/*.json", layout: false
page "/*.txt", layout: false
page "/404.html", directory_index: false
page "/feed.xml", layout: false

set :css_dir, "assets/stylesheets"
set :images_dir, "assets/images"
set :js_dir, "assets/javascripts"

Time.zone = "Central Time (US & Canada)"

activate :blog do |blog|
  blog.permalink = "{year}/{month}/{title}.html"
  blog.sources = "articles/{year}-{month}-{title}.html"
  blog.taglink = "tags/{tag}.html"
  blog.layout = "article_layout"
  blog.summary_separator = /(READMORE)/
  blog.tag_template = "tag.html"
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/{num}"
  blog.new_article_template = File.expand_path("article-template.erb", File.dirname(__FILE__))
end

configure :build do
  activate :external_pipeline,
           name: :gulp,
           command: "npm run production",
           source: ".tmp",
           latency: 1

  ignore "assets/javascripts/all.js"
  ignore "assets/stylesheets/site"

  activate :gzip

  activate :minify_html do |html|
    html.remove_quotes = false
    html.remove_intertag_spaces = true
  end
end
