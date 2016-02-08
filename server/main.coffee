'use strict'


Meteor.publish 'todos', (limit) =>
  return @Todos.find {}, {limit}
