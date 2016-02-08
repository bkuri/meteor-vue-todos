'use strict'


Template.todo.onCreated =>
  @limit = new ReactiveVar(5)
  @loaded = new ReactiveVar(0)

  @todos = () =>
    return @Todos.find {}, limit: @limit.get()

  return
