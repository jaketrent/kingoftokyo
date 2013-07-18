App.Die = App.Model.extend

  init: ->
    @faces = [
      App.Face.create { name: '1' }
      App.Face.create { name: '2' }
      App.Face.create { name: '3' }
      App.Face.create { name: 'A' }
      App.Face.create { name: 'H' }
      App.Face.create { name: 'E' }
    ]
    @calcClassName()
    @onHold = false
    @set 'className', 'die'

  roll: ->
    if not @onHold
      @activeFace = @faces[@getRandomInt 0, 5]
      @calcClassName()
    @

  toggleHold: ->
    @onHold = !@onHold
    @calcClassName()

  calcClassName: ->
    classNames = 'die'
    if @activeFace?
      classNames += " icon-die-#{@activeFace.toString()}"

    if @onHold
      classNames += " is-onhold"

    @set 'className', classNames

  toString: ->
    if @activeFace?
      @activeFace.toString()
    else
      ''