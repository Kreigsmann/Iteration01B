require "rails_helper"

RSpec.feature "Swords", type: :feature do
    context "Update sword" do
      let(:sword) { Sword.create(type: "Test type", subtype: "Test subtype", pommel: "Test pommel", grip: "Test grip", steel: "Test steel") }
      before(:each) do
        user = FactoryBot.create(:user)
        login_as(user)
        visit edit_sword_path(sword)
      end
 
 
      scenario "should be successful" do
        within("form") do
          fill_in "Description", with: "New description content"
        end
        click_button "Update Sword"
        expect(page).to have_content("Sword was successfully updated")
      end
 
      scenario "Title can't be blank" do
        within("form") do
          fill_in "Type", with: ""
        end
        click_button "Update Sword"
        expect(page).to have_content("Type can't be blank")
      end

      scenario "Subtype cant be blank" do
        within("form") do
          fill_in "Subtype", with: ""
        end
        click_button "Update Sword"
        expect(page).to have_content("Subtype can't be blank")
      end
 
      scenario "Pommel can't be blank" do
        within("form") do
          fill_in "Pommel", with: ""
        end
        click_button "Update Sword"
        expect(page).to have_content("Pommel can't be blank")
      end

      scenario "Grip can't be blank" do
        within("form") do
          fill_in "Grip", with: ""
        end
        click_button "Update Sword"
        expect(page).to have_content("Grip can't be blank")
      end

      scenario "Steel cant be blank" do
        within("form") do
          fill_in "Steel", with: ""
        end
        click_button "Update Sword"
        expect(page).to have_content("Steel can't be blank")
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
        #expect(page).to have_content("Logged in")
      end
    end#end context
end#end rspec
