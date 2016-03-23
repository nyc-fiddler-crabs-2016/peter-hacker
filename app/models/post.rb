class Post < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :comments

  validates :title, :owner, presence: true

  def post_time
    Kronic.format(self.created_at)
  end
end
