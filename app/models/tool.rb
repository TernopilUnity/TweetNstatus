class Tool < ActiveRecord::Base
  has_and_belongs_to_many :users
  before_save :check_counts

  CONDITIONS = ["New", "Rusty", "Broken"]

  def toggle_condition
    c_index = CONDITIONS.find_index(self.condition)
    self.condition = CONDITIONS[c_index - 1]
    self.save
  end

  private
  def check_counts
    if counts == 3
      ToolMailer.low_counts(@user).deliver
    end
  end
end
