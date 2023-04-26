require "rails_helper"
#change update to create sword
RSpec.feature "Swords", type: :feature do
    context "Update sword" do
      let(:sword) { Sword.create(type: "Test type", subtype: "Test subtype", pommel: "Test pommel", grip: "Test grip", steel: "Test steel") }
      before(:each) do
        user = FactoryBot.create(:user)
        login_as(user)
        visit edit_sword_path(sword)
      end
 
 
      scenario "should be successful" do
        click_button "Update Sword"
        expect(page).to have_content("Sword was successfully updated")
        within("form")do
        fill_in "description", with: "Oakshott type"
        fill_in "Type", with: "Type XV"
        fill_in "Subtype", with: "Type XVa"
        fill_in "Pommel", with: "Disc"
        fill_in "Grip", with: "Oak"
        fill_in "Steel", with: "Medium Carbon"
        click_button "Update Sword"
        end
        expect(page).to have_content("Oakshott type")
        expect(page).to have_content("Type XV")
        expect(page).to have_content("Type XVa")
        expect(page).to have_content("Disc")
        expect(page).to have_content("Oak")
        expect(page).to have_content("Medium Carbon")

      end
 
     
    end#end contex

    context "Login" do
      scenario "should sign up" do
        visit root_path
        click_link 'Sign up'
        within("form") do
          fill_in "Email", with: "testing@test.com"
          fill_in "Password", with: "123456"
          fill_in "Password confirmation", with: "123456"
          click_button "Sign up"
        end
        expect(page).to have_content("Welcome! You have signed up successfully.")
      end
  
  
      scenario "Create New Sword" do
        user = FactoryBot.create(:user)
        login_as(user)
        visit new_sword_path
        expect(page).to have_content("Logged in")
      end
    end#end context
end#end rspec
