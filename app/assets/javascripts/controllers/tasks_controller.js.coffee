App.TasksController = Em.ArrayController.extend
  savedTasks: Em.computed ->
    @get("model").rejectBy("id", null)
  .property("@each")
  
  incompleteTasks: Em.computed ->
    @get("savedTasks").filterBy("completed_at", null)
  .property("@each.completed_at")
  completeTasks: Em.computed ->
    @get("savedTasks").rejectBy("completed_at", null)
  .property("@each.completed_at")
  
  actions:
    create: ->
      self = @
      @get("newTask").save().then(
        (response) -> self.set("newTask", self.store.createRecord("task", {priority: "medium"}))
        (response) -> debugger
      )
  