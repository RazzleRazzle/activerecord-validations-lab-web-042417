class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :validate_clickbait

  def validate_clickbait
    ["Won't", "Believe", "Secret","Top", "Guess"].each do |word|
      if self.title == nil
        errors.add(:title, "Nothing supplied, do over.")
        return
      elsif self.title.include?(word)
        return
      elsif
        errors.add(:title, "not clickbaity")
      end
    end
  end

end
