class Sword < ApplicationRecord
    validates :type, presence:true
    validates :subtype, presence:true
    validates :pommel, presence:true
    validates :grip, presence:true
    validates :steel, presence:true
    #validates :description, presence:true 
end
