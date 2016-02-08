'use strict'


@Todos = new Mongo.Collection('todos')


Meteor.methods
  addTodo: (text, done=no) =>
    @Todos.insert {text, done}
    return

  markDone: (_id, done=yes) =>
    return @Todos.update _id, $set: {done}

  removeTodo: (_id) =>
    @Todos.remove _id
    return
