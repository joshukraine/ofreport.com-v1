describe "ministry page", type: :feature do
  before do
    visit "/ministry"
  end

  it "displays the correct title" do
    expect(page).to have_title("Ministry")
  end

  it "display the correct heading" do
    expect(page).to have_css(:h1, text: "We live to serve Jesus Christ.")
  end
end
