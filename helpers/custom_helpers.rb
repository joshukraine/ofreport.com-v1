module CustomHelpers
  def full_title(page_title=nil)
    page_title ||= ""
    base_title = data.site.title
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def twitter_link_for(author)
    if author.to_s.include?("@") # We have a Twitter handle
      link_to author[0], "https://twitter.com/#{author[1][1..-1]}"
    else
      author.to_s
    end
  end

  def smart_robots(path, env)
    # Add paths (like "thank you" pages) that search engines should not index.
    # Multiple paths look like this:
    # /first_path|another_path|yet_another/
    if !!(path =~ /thanks/) || env != "production"
      "noindex, nofollow"
    else
      "index, follow"
    end
  end

  def add_visible_class(path)
    unless !!(path =~ /index/)
      " is-visible"
    end
  end

  # https://robots.thoughtbot.com/organized-workflow-for-svg
  # https://gist.github.com/bitmanic/0047ef8d7eaec0bf31bb
  def inline_svg(filename, options = {})
    root = Middleman::Application.root
    file_path = "#{root}/source/assets/images/#{filename}"
    if File.exists?(file_path)
      file = File.read(file_path).force_encoding("UTF-8")
      doc = Nokogiri::HTML::DocumentFragment.parse file
      svg = doc.at_css "svg"
      if options[:class].present?
        svg["class"] = options[:class]
      end
      doc
    else
      "file not found: #{file_path}"
    end
  end
end
