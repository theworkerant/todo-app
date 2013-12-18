App.TaskController = Em.ObjectController.extend
  actions:
    uncomplete: ->
      @set("model.completed_at", null)
      @send("save")
    save: ->
      @get("model").deleteRecord() if Ember.isEmpty(@get("model.title"))
      @get("model").save().then(
        (response) -> 
        (response) -> App.generalError(reason, "There was a problem with that entry, please make sure everything is filled out correctly.")
      )