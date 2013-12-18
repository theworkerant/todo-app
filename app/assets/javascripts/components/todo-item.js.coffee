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
      if @get("action") is "create"
        @sendAction("action")
      else
        @sendAction("action")
        @set("editing", false)
    
    doneEditing: ->
      unless @get("action") is "create"
        @set("editing", false)
        @get("task").rollback()
      
    edit: ->
      @toggleProperty("editing")
      self = this
      Ember.run.next -> self.$("input").focus()
      
    delete: ->
      @get("task").deleteRecord()
      @get("task").save()