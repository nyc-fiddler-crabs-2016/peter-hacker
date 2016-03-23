class Comment < ActiveRecord::Base
  belongs_to :writer, class_name: "User"
  belongs_to :post

  validates :body, :writer, :post, presence: true


  def post_time
    Kronic.format(self.created_at)
  end
end
