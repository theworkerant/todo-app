App.TodoItemComponent = Ember.Component.extend
  dueText: Em.computed ->
    if Em.isEmpty(@get("task.due_at"))
      "Never"
    else
      moment.utc(@get("task.due_at")).format("ddd MMM Do, YYYY")
  .property("task.due_at")
      
  dueDateChange: Em.observer ->
    unless @get("dueDate")
      if Em.isEmpty(@get("task.due_at"))
        @set("dueDate", moment.utc(new Date).format("MM/DD/YYYY"))
      else
        @set("dueDate", moment.utc(@get("task.due_at")).format("MM/DD/YYYY"))
    
    due_date = new Date(@get("dueDate"))
    @set("task.due_at", due_date) if due_date
  .observes("dueDate").on("didInsertElement")
  
  actions:
    complete: -> 
      @set("task.completed_at",new Date)
      @sendAction("action")
      
    setPriority: (priority) ->
      unless @get("task.priority") is priority
        @set("task.priority",priority)
        @sendAction("action") if @get("action") isnt "create" and @get("editing") isnt true
        
    done: ->
      @sendAction("action")
      @set("editing", false) unless @get("action") is "create"

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
      @get("task").deleteRecord()
      @sendAction("action")