describe "home page", type: :feature do
  before do
    visit "/"
  end

  it "displays the correct title" do
    expect(page).to have_title("Joshua and Kelsie Steele - Missionaries serving Christ in Ukraine")
  end

  it "displays the home navbar" do
    expect(page).to have_css("header.home-navbar")
  end

  it "displays the svg logo" do
    expect(page).to have_css("svg", class: "home-logo__svg")
  end

  it "provides links to tag pages" do
    first("li.meta-tag-item > a").click
    expect(page).to have_css(:h1, text: "Articles tagged")
  end
end
