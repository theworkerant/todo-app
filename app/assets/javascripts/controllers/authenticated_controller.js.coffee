App.AuthenticatedController = Ember.Controller.extend App.LoginStatusMixin,
  needs: ["todos", "user"]
  
  userBinding: "controllers.user"
  