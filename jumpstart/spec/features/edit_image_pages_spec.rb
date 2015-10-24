require 'rails_helper'

describe "edit an image" do
  it "edit an image" do
    login_user
    click_link "Profile"
    click_link "Add an image"
    image = FactoryGirl.create(:image)
    click_on 'Save'
    click_link "Profile"
    click_on 'Edit'
    fill_in 'description', with: 'Woodcut'
    page.attach_file("MtHood", 'spec/fixtures/images/woodcut.jpg')
    click_button 'Save'
    expect(page).to have_content "Logged in as"
  end

  def login_user
    visit root_path
    click_link "Sign up"
    fill_in "Email", with: "cat@cat.com"
    fill_in "Username", with: "cat"
    fill_in "Password", with: "88888888"
    fill_in "Password confirmation", with: "88888888"
    click_on "Sign Up"
  end
end
