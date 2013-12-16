class TaskSerializer < ActiveModel::Serializer  
  root false
  embed :ids, include: false
  
  attributes :id,
    :title,
    :due_at,
    :completed_at,
    :priority
    
end