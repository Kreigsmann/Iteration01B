class Sword < ApplicationRecord
    validates_presence_of :type, :subtype, :pommel, :grip, :steel
    self.inheritance_column = :_type_disabled
    #validates :type, presence:true
    #validates :subtype, presence:true
    #validates :pommel, presence:true
    #validates :grip, presence:true
    #validates :steel, presence:true
    #validates :description, presence:true 
end
