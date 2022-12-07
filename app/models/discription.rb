class Discription < ApplicationRecord
	belongs_to :discriptionable, polymorphic: true
end
