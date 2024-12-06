## 2. game pao ying chub
## 2.1 Create Hands Random for computer
hands <- c("hammer", "scissor", "paper")
com_choose_hands <- function() {
  sample(hands, 1)
}

## 2.2 Create Function play_game 
play_game <- function() {
  user_score <- 0
  com_score <- 0
  games <- 0

## 2.3 while loop สำหรับเล่นกี่รอบ
  while (games < 10) {
## 2.4 user input hands & computer choose hands 
  user_choose_hands <- readline("user choose hands: ")
  com_choose_hands <- com_choose_hands()
  cat("com choose hands:", com_choose_hands, "\n")

## 2.4 condition & score
  if (user_choose_hands == com_choose_hands ){
    print("draw")
  } else if (user_choose_hands == "hammer" & com_choose_hands == "scissor") {
    user_score <- user_score + 1
    print("user winn! (+1 point)")
  } else if (user_choose_hands == "scissor" & com_choose_hands == "paper") {
    user_score <- user_score + 1
    print("user winn! (+1 point)")
  } else if (user_choose_hands == "paper" & com_choose_hands == "hammer") {
    user_score <- user_score + 1
    print("user winn! (+1 point)")
  } else {
    com_score <- com_score + 1
    print("com winn! (+1 point)")
  }
  games = games + 1
  }
## 2.5 Summary final score
  print("Final scores")
  if (user_score == com_score) {
    print("draw")
    cat("you score:", user_score, "\n")
    cat("computer score:", com_score, "\n")
  } else if (user_score > com_score) {
    cat('you win! (', user_score,":", com_score, ")", "\n")
  } else {
    cat('computer win! (', com_score,":", user_score, ")", "\n")
  }
}
