require "rails_helper"

describe "Sword Attribute Requirements on Create", :type => :model do
  context "validation tests" do
    it "ensures the type is present when creating sword" do
      sword = Sword.new(description: "Content of the description")
      expect(sword.valid?).to eq(false)
    end
    it "should not be able to save sword when type is missing" do
      sword = Sword.new(description: "Some description content goes here")
      expect(sword.save).to eq(false)
    end
    it "should be able to save project when type, subtype, pommel, grip, and steel are present" do
      sword = Sword.new(type: "type", subtype: "subtype", pommel: "pommel", grip: "grip", steel: "steel")
      expect(sword.save).to eq(true)
    end
  end
end

describe "Sword Attribute Requirements on Edit", :type => :model do
  context "Edit sword" do  
    before (:each) do
      @sword = Sword.create(type: "type", subtype: "subtype", pommel: "pommel", grip: "grip", steel: "steel", description: "Content of the description")
      end
    it "ensures the type is present when editing the sword" do
      @sword.update(:type => "New type")
      expect(@sword.type == "New type")
    end
    it "ensures the subtype is present when editing the sword" do
        @sword.update(:subtype => "New subtype")
        expect(@sword.subtype == "New subtype")
    end
    it "ensures the pommel is present when editing the sword" do
        @sword.update(:pommel => "New pommel")
        expect(@sword.pommel == "New pommel")
    end
    it "ensures the grip is present when editing the sword" do
        @sword.update(:grip => "New grip")
        expect(@sword.grip == "New grip")
    end
    it "ensures the steel is present when editing the sword" do
        @sword.update(:steel => "New steel")
        expect(@sword.steel == "New steel")
    end
  end
end
