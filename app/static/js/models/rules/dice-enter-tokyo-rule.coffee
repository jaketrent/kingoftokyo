App.DiceEnterTokyoRule = App.Rule.extend

  applies: (game) ->
    game.get('currentPhase') is 'resolve-dice'

  exec: (game) ->
    if not game.isPlayerInTokyo() and game.isAttackRolled()
      game.get('currentPlayer').set 'isInTokyo', true