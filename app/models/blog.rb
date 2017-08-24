class Blog < ApplicationRecord
	extend FriendlyId
	has_many :comments, as: :commentable, dependent: :destroy
	belongs_to :category
	belongs_to :blogger, class_name: 'User', foreign_key: 'blogger_id'
	has_and_belongs_to_many :tags

	
	friendly_id :slug_candidates, use: [:slugged, :finders]

	def slug_candidates
    [
      :title
    ]
  end

  def self.search(search)
  	# binding.pry
  	where("title LIKE ?", "%#{search}%")
  	# where("description LIKE ?", "%#{search}%")
  end

end
