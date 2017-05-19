include CustomHelpers

describe CustomHelpers do
  describe "#full_title" do

    context "when no custom page title is provided" do
      it "provides only the base title" do
        site_title = "MAIN SITE TITLE"
        page_title = nil
        expect(full_title(page_title, site_title)).to eq("MAIN SITE TITLE")
      end
    end

    context "when a custom title is provided" do
      it "displays the custom title and the base title separated by a pipe" do
        site_title = "MAIN SITE TITLE"
        page_title = "Custom"
        expect(full_title(page_title, site_title)).to eq("Custom | MAIN SITE TITLE")
      end
    end
  end

  describe "#smart_robots" do
    context "when on contact thanks page" do
      it "returns 'noindex, nofollow'" do
        current_page = double("Sitemap")
        allow(current_page).to receive(:path).and_return("contact/thanks/")
        expect(smart_robots(current_page.path, "production")).to eq("noindex, nofollow")
      end
    end

    context "when not in production environment" do
      it "returns 'noindex, nofollow'" do
        current_page = double("Sitemap")
        allow(current_page).to receive(:path).and_return("contact")
        expect(smart_robots(current_page.path, "staging")).to eq("noindex, nofollow")
      end
    end

    context "when on normal page, production environment" do
      it "returns 'index, follow'" do
        current_page = double("Sitemap")
        allow(current_page).to receive(:path).and_return("contact")
        expect(smart_robots(current_page.path, "production")).to eq("index, follow")
      end
    end
  end

  describe "#add_visible_path" do
    context "when on home page" do
      it "returns nothing" do
        path = "/index.html"
        expect(add_visible_class(path)).to be_nil
      end
    end

    context "when on any page besides home page" do
      it "returns ' is-visible'" do
        path = "/contact/"
        expect(add_visible_class(path)).to eq(" is-visible")
      end
    end
  end

  describe "#twitter_link_for" do
    context "when Twitter handle is provided" do
      it "returns a link to the corresponding Twitter profile" do
        author = ["Joshua", "@joshukraine"]
        link = "<a href=\"https://twitter.com/joshukraine\">Joshua</a>"
        expect(twitter_link_for(author)).to eq(link)
      end
    end

    context "when no Twitter handle is provided" do
      it "returns the author as a string" do
        author1 = "Fred"
        author2 = ["Joe", "Smith"]

        expect(twitter_link_for(author1)).to eq("Fred")
        expect(twitter_link_for(author2)).to eq("[\"Joe\", \"Smith\"]")
      end
    end
  end

  describe "#article_og_desc_for" do
    context "when article provides caption" do
      it "returns the caption" do
        site_desc = "The default site description."
        article = double("article")
        allow(article).to receive(:caption).and_return("This is my caption!")
        expect(article_og_desc_for(article, site_desc)).to eq("This is my caption!")
      end
    end

    context "when article provides desciption, no caption" do
      it "returns description" do
        site_desc = "The default site description."
        article = double("article")
        allow(article).to receive(:caption).and_return(nil)
        allow(article).to receive(:desc).and_return("This is my description!")
        expect(article_og_desc_for(article, site_desc)).to eq("This is my description!")
      end
    end

    context "when article provides neither caption nor desciption" do
      it "returns the default site description" do
        site_desc = "The default site description."
        article = double("article")
        allow(article).to receive(:caption).and_return(nil)
        allow(article).to receive(:desc).and_return(nil)
        expect(article_og_desc_for(article, site_desc)).to eq(site_desc)
      end
    end
  end
end
