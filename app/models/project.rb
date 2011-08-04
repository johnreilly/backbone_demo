class Project < ActiveRecord::Base
  has_many :tasks, :dependent => :destroy

  def as_json(options = {})
    {:id => id, :name => name, :tasks => tasks}
  end
end
