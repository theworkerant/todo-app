App.Task = DS.Model.extend
  title:        attr "string"
  priority:     attr "string"
  completed_at: attr "date"
  due_at:       attr "date"