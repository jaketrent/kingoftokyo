App.Game = App.Model.extend

  init: ->
    @score = 0
    @resetDice()
    @players = (App.Player.create { name: "Player #{num}" } for num in [1..2])
    @set 'currentPlayerIndx', 0
    @set 'currentPlayer', @players[@get 'currentPlayerIndx']

  endTurn: ->
    @resetDice()
    @nextPlayer()

  resetDice: ->
    # TODO: move to player
    @set 'dice', (App.Die.create() for num in [1..6])
    @set 'rollNum', 1

  nextPlayer: ->
    indx = @get 'currentPlayerIndx'
    if indx < @players.length - 1
      @incrementProperty 'currentPlayerIndx'
    else
      @set 'currentPlayerIndx', 0
    @set 'currentPlayer', @players[@get 'currentPlayerIndx']