describe "contact page", type: :feature do
  before do
    visit "/contact"
  end

  it "displays the correct title" do
    expect(page).to have_title("Contact")
  end

  it "display the correct heading" do
    expect(page).to have_css(:h1, text: "Hello")
  end

  it "displays a contact form" do
    expect(page).to have_css("div.contact-form>form")
  end
end
