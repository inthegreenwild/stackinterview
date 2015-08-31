class Question < ActiveRecord::Base
	scope :category, ->(category) { where('category=?', category)}
end
