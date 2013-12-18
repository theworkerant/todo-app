App.TodoItemComponent = Ember.Component.extend
  dueText: Em.computed ->
    if Em.isEmpty(@get("task.due_at"))
      "Never"
    else
      moment.utc(@get("task.due_at")).format("ddd MMM Do, YYYY")
  .property("task.due_at")
  
  validDueDate: Em.computed ->
    Em.isEmpty(@get("dueDate")) or ( !Em.isEmpty(@get("dueDate")) and not isNaN(new Date(@get("dueDate"))) )
  .property("dueDate")
  
  actions:
    complete: -> 
      @set("task.completed_at",new Date)
      @sendAction("action")
      
    setPriority: (priority) ->
      unless @get("task.priority") is priority
        @set("task.priority",priority)
        @sendAction("action") if @get("action") isnt "create" and @get("editing") isnt true
        
    done: ->
      if @get("validDueDate")
        due_date = new Date(@get("dueDate"))
        @set("task.due_at", due_date) if not isNaN(due_date) and not Em.isEmpty(@get("dueDate"))
        @sendAction("action")
        @set("editing", false) unless @get("action") is "create"
      else
        App.generalError("That's not a valid date! Please use MM/DD/YYYY format")

    doneEditing: ->
      if @get("action") isnt "create"
        @set("editing", false)
        @get("task").rollback()
      
    edit: (field)->
      field ||= "title"
      self    = this
      
      @set("editing", true)
      Ember.run.next -> self.$("input.#{field}-field").focus()
      
    delete: ->
      if window.confirm("Are you sure you want to delete?")
        @get("task").deleteRecord()
        @sendAction("action")
      
    