'use strict'


Template.todo.onRendered =>
  new Vue
    el: '#demo'

    data:
      limit: @limit.get()
      newTodo: ''
      subscriptionsReady: no
      title: 'todos'
      todos: []
      todosSubscription: null

    destroyed: ->
      @subscription.stop()
      return

    methods:
      addTodo: ->
        return unless @newTodo.trim().length

        Meteor.call 'addTodo', @newTodo
        @newTodo = ''
        return

      loadMore: =>
        @limit.set @limit.get() + 5
        return

      markDone: (_id) ->
        Meteor.call 'markDone', _id
        return

      removeTodo: (_id) ->
        Meteor.call 'removeTodo', _id
        return

    sync:
      subscriptionsReady: =>
        return @subscriptionsReady

      todos: =>
        return @todos()

      todosSubscription: =>
        limit = @limit.get()
        subscription = Meteor.subscribe('todos', limit)
        return unless subscription.ready()

        @loaded.set limit
        return subscription

  return
