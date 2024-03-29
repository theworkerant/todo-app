App.Router.map ->
  @resource "tasks", path: "/"
    
  @resource "login", path: "login"
  @resource "register", path: "register"
  

App.AuthenticatedRoute = Ember.Route.extend
  beforeModel: (transition) ->
    login = @controllerFor('login')
    if (!login.get("isAuthenticated"))
      @redirectToLogin(transition)
      
  redirectToLogin: (transition) ->
    loginController = @controllerFor('login')
    loginController.set('attemptedTransition', transition)
    @transitionTo('login')
        
  actions:
    error: (reason, transition) ->
      if (reason.status is 401)
        @redirectToLogin(transition)
      else
        App.generalError("There was a problem navigating to that page. Please make sure you've entered it correctly and try again.")
      
App.RegisterRoute = Ember.Route.extend()
App.LoginRoute = Ember.Route.extend
  beforeModel: (transition) ->
    if (@controllerFor('login').get("isAuthenticated"))
      @transitionTo('tasks')
      
  setupController: (controller, context) ->
    controller.reset()
  
App.TasksRoute = App.AuthenticatedRoute.extend
  model: -> @store.find("task")
  setupController: (controller, model) ->
    controller.set "model", model
    controller.set("newTask", @store.createRecord("task", {priority: "medium", due_at: null}))
    
  
