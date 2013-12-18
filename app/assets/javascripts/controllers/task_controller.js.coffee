App.TaskController = Em.ObjectController.extend
  actions:
    save: ->
      @get("model").deleteRecord() if Ember.isEmpty(@get("model.title"))
      @get("model").save().then(
        (response) -> console.log "succes!"
        (response) -> debugger
      )