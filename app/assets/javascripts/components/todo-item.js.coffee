App.TodoItemComponent = Ember.Component.extend
  actions:
    complete: -> 
      @set("task.completed_at",new Date)
      @sendAction("action")
      
    setPriority: (priority) ->
      unless @get("task.priority") is priority
        @set("task.priority",priority)
        @sendAction("action")
        
    done: ->
      @set("saving", true)
      if @get("action") is "create"
        @sendAction("action")
      else
        @sendAction("action")
        @set("editing", false)
        @set("saving", false)
    
    doneEditing: ->
      if @get("action") isnt "create" and not @set("saving")
        @set("editing", false)
        @get("task").rollback()
      
    edit: ->
      @toggleProperty("editing")
      self = this
      Ember.run.next -> self.$("input").focus()