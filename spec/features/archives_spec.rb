describe "archives page", type: :feature do
  before do
    visit "/archives"
  end

  it "displays the correct title" do
    expect(page).to have_title("Archives")
  end

  it "display the correct heading" do
    expect(page).to have_css(:h1, text: "Through the Years")
  end
end
