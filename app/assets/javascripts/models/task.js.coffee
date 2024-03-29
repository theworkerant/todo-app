App.Task = DS.Model.extend
  title:        attr "string"
  priority:     attr "string"
  completed_at: attr "date"
  due_at:       attr "date"
  
  high:   Em.computed(-> @get("priority") is "high").property("priority")
  medium: Em.computed(-> @get("priority") is "medium").property("priority")
  low:    Em.computed(-> @get("priority") is "low").property("priority")
  
  complete: Em.computed(-> @get("completed_at") isnt null).property("completed_at")
  
  priorityCode: Em.computed -> 
    switch @get("priority")
      when "high" then 1
      when "medium" then 2
      when "low" then 3
  .property("priority")