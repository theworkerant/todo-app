App.Router.map ->
  @resource "index", path: "/"#, ->
    
    # @resource "sessions", path: "sessions", ->
    #   @route "new", {path: "new", queryParams: ["skills_encoded"]}
    #   @route "session", {path: "/:id", queryParams: ["skills_encoded"]}
      
      
App.IndexRoute = Em.Route.extend
  # model: -> @store.find("session")
  # enter: -> @get("pusher").subscribe("sessions")
  setupController: (controller, model) ->
    controller.set "content", model
    @setupAjax()
    
  setupAjax: ->
    # token = @get("credentials.token")
    $.ajaxSetup
      beforeSend: (xhr, settings) -> 
        # just because the auth_token is a private information
        if settings.crossDomain then return
        # if settings.type is "GET" then return
    
        # xhr.setRequestHeader('X-AUTHENTICATION-TOKEN', token)
      
        csrf_token = $('meta[name="csrf-token"]').attr('content');
        if csrf_token then xhr.setRequestHeader('X-CSRF-Token', csrf_token)