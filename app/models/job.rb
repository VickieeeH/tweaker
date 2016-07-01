class Job < ApplicationRecord
  belongs_to :project

  after_create :set_status

  def set_status
    self.update_attributes(status: 0)
  end
end
