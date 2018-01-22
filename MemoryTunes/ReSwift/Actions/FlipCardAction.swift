/**
 * Copyright (c) 2017 Razeware LLC
 */

import ReSwift

//The logic of the game allows the user to flip two cards, If they’re the same, they remain uncovered; if not, they get hidden again. The player’s objective is to uncover all cards with the fewest steps possible.
//To do this, you’ll need a flip action. Open FlipCardAction.swift and add the following

struct FlipCardAction: Action {
  let cardIndexToFlip: Int
}

