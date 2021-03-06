App.Model = Ember.Object.extend

  # TODO: put this in a utility class, not in the model
  getRandomInt: (min, max) ->
    Math.floor(Math.random() * (max - min + 1)) + min

  # TODO: seriously need to learn how to do bindAttr in .emblem files with dynamic and static class names
  addClassName: (clazz) ->
    @set 'className', "#{@get('className')} #{clazz}"

  # TODO: seriously need to learn how to do bindAttr in .emblem files with dynamic and static class names
  removeClassName: (clazz) ->
    withoutClassName = @get('className').replace new RegExp(clazz, 'gi'), ''
    @set 'className', withoutClassName