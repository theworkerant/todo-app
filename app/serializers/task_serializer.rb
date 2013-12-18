class TaskSerializer < ActiveModel::Serializer  
  embed :ids
  
  attributes :id,
    :user_id,
    :title,
    :due_at,
    :completed_at,
    :complete,
    :priority
    
  def complete
    object.complete?
  end
end