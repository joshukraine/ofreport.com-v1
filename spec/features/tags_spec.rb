describe "all tags page", type: :feature do
  before do
    visit "/tags"
  end

  it "displays the correct title" do
    expect(page).to have_title("All Tags")
  end

  it "display the correct heading" do
    expect(page).to have_css(:h1, text: "All Tags")
  end
end
