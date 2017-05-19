describe "donate page", type: :feature do
  before do
    visit "/donate"
  end

  it "displays the correct title" do
    expect(page).to have_title("Donate")
  end

  it "display the correct heading" do
    expect(page).to have_css(:h1, text: "How to Donate")
  end

  it "displays a donate button" do
    expect(page).to have_css("p.donate-button>a.button")
    expect(page).to have_link("Donate Online", href: "https://www.paypal.me/joshukraine")
  end
end
