class Blog < ApplicationRecord
	extend FriendlyId
	has_many :comments, as: :commentable, dependent: :destroy
	belongs_to :category
	belongs_to :blogger, class_name: 'User', foreign_key: 'blogger_id'

	
	friendly_id :slug_candidates, use: [:slugged, :finders]

	def slug_candidates
    [
      :title
    ]
  end

end
