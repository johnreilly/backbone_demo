object @project
attributes :id, :name
child :tasks do
  attributes :id, :name, :is_done
end
