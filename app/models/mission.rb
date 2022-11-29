class Mission < ApplicationRecord
    belongs_to :scientist
    belongs_to :planet

    # scientist and planets are already accounted for due to belongs_to relationship
    # if you look at the schema file, scientist_id and planet_id cannot be null due
    # to the ", null: false" rule.
    validates :name, presence: true
    validates :scientist, uniqueness: { scope: :name, message: "scientists can't go on the same mission twice"}
end
