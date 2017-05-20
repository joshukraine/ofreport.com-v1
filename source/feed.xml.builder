xml.instruct! :xml, :version => '1.0'
xml.rss :version => "2.0" do
# xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.channel do
    site_url = "#{data.site.url}/"
    content_url = "http:#{data.site.content_server_url}"
    xml.title data.site.title
    xml.id URI.join(site_url, blog.options.prefix.to_s)
    xml.link "href" => URI.join(site_url, blog.options.prefix.to_s)
    xml.link "href" => URI.join(site_url, current_page.path), "rel" => "self"
    xml.updated(blog.articles.first.date.to_time.iso8601) unless blog.articles.empty?
    xml.author { xml.name "Joshua and Kelsie Steele" }

    blog.articles[0..1].each do |article|
      xml.entry do
        xml.title article.title
        xml.link "rel" => "alternate", "href" => URI.join(site_url, article.url)
        xml.id URI.join(site_url, article.url)
        xml.published article.date.to_time.iso8601
        xml.updated File.mtime(article.source_file).iso8601
        xml.author { xml.name feed_author_name(article.data.author) }
        # xml.tag!("media:content") { "foo" }
        #   xml.url URI.join(content_url, article.data.image)
        #   xml.title "foobar"
        #   xml.link "rel" => "alternate", "href" => URI.join(site_url, article.url)
        # }
        xml.summary article.summary, "type" => "html"
        xml.content article.body, "type" => "html"
      end
    end
  end
end
