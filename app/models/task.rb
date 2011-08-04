class Task < ActiveRecord::Base
  belongs_to :project

  def as_json(options = {})
    {:id => id, :name => name, :isDone => is_done}
  end
end
