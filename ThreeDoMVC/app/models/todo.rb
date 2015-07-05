class Todo < ActiveRecord::Base
  validates_presence_of :title

  def self.more_to_do?
    Todo.where(is_complete: false).any?
  end

  def self.num_left_to_do
    Todo.where(is_complete: false).size
  end
end
