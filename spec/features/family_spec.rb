describe "family page", type: :feature do
  before do
    visit "/family"
  end

  it "displays the correct title" do
    expect(page).to have_title("The Steele Family")
  end

  it "display the correct heading" do
    expect(page).to have_css(:h1, text: "Pleased to meet you!")
  end

  it "displays a hero image" do
    expect(page).to have_css("div.family-hero>img")
  end
end
