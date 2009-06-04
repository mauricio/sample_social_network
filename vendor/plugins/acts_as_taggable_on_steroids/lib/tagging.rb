class Tagging < ActiveRecord::Base #:nodoc:
  belongs_to :tag
  belongs_to :taggable, :polymorphic => true

  validates_presence_of :tag_id, :taggable_id, :taggable_type

  def after_destroy
    if Tag.destroy_unused
      if tag.taggings.count.zero?
        tag.destroy
      end
    end
  end
end
