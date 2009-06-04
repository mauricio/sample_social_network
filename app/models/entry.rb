
class Entry < ActiveRecord::Base

  acts_as_taggable

  belongs_to :user

  validates_presence_of :title, :description, :user_id

  attr_protected :user_id

  def to_s
    title
  end

end