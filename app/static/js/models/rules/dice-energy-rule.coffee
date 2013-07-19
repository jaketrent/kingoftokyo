App.DiceEnergyRule = App.Rule.extend

  applies: (game) ->
    game.get('states.phase') is 'end'

  exec: (game) ->
    energy = 0
    for die in game.get 'dice'
      if die.isEnergy()
        ++energy
    game.set 'currentPlayer.energy', game.get('currentPlayer.energy') + energy