class Mission < ApplicationRecord

    # Belongs_to makes it so a Mission instance MUST have a scientist and planet -- so no need to validate those attributes
    belongs_to :scientist
    belongs_to :planet

    validates :name, presence: true
    
    # Scope is the instance of planet
    # Validate that this Planet instance has a unique scientist_id value
    
    #   
    validates :scientist_id, uniqueness: { scope: :planet_id }
    
end
