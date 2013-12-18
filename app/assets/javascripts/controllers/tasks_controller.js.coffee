App.TasksController = Em.ArrayController.extend

  sortProperties: ["priorityCode"]
  sortAscending: true
  prioritySorted: Em.computed(-> @get("sortProperties.firstObject") is "priorityCode" ).property("sortProperties")
  dateSorted: Em.computed(-> @get("sortProperties.firstObject") is "due_at" ).property("sortProperties")
  
  savedTasks: Em.computed ->
    @get("arrangedContent").rejectBy("id", null)
  .property("@each")
  
  incompleteTasks: Em.computed ->
    @get("savedTasks").filterBy("completed_at", null)
  .property("@each.completed_at")
  
  completeTasks: Em.computed ->
    @get("savedTasks").rejectBy("completed_at", null)
      
  .property("@each.completed_at")
  
  actions:
    sortBy: (key) -> @set("sortProperties", [key])
    create: ->
      self = @
      @get("newTask").save().then(
        (response) -> self.set("newTask", self.store.createRecord("task", {priority: "medium"}))
        (response) -> App.generalError("There was a problem with that entry, please make sure everything is filled out correctly.")
      )
  