class Question < ActiveRecord::Base
	scope :category, ->(category) { where('category=?', category)}
	scope :keyword, ->(keyword) { where('keyword=?', keyword)} 
	scope :rating, ->(rating) { where('rating=?', rating)}
	scope :min_rating, ->(min_rating) { where('rating>=?', min_rating)}
	scope :title_includes, ->(title_includes) { 
		where("lower(title) like ?", "\%#{title_includes}\%".downcase)
	}
end
