App.User = DS.Model.extend
  tasks:  hasMany "task"
  
  email:  attr "string"