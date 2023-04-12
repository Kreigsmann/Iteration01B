require "rails_helper"

RSpec.describe SwordsController, :type => :controller do

    login_user

    describe "test web requests" do
        context "GET #index" do
            it "returns a success response" do
            get :index
            expect(response).to have_http_status(:ok)
            end
        end

        context "GET #show" do
            let!(:sword) { Sword.create(type: "Test type", subtype: "Test subtype", pommel: "Test pommel", grip: "Test grip", steel: "Test steel") }
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end
        context "GET #edit" do
            let!(:project) { Sword.create(:sword) }
            it "returns a success response" do
              expect(response).to have_http_status(:ok)
            end
        end
        context "GET #new" do
            it "returns a success response" do
             get :new
             expect(response).to have_http_status(:ok)
           end
        end


    end
end