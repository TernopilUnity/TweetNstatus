 class User < ActiveRecord::Base
  has_many :tweets
  has_and_belongs_to_many :tools

  def as_json(options)
    super(options || {only: [:name, :counts], include: :tools})
  end
end
