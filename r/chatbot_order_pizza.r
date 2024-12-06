## 1. chatbot order pizza

## 1.1 Create menu to a user

  menus_df <- data.frame(
    menus = c("Ham with Smoke Tomato Cheese Sauce", 
              "Spicy Ham with Smoke Tomato Cheese Sauce", 
              "Crab Sticks and Sausage"),
    price = c(399, 399, 129)
  )

    drinks_df <- data.frame(
    drinks = c("Coke 1.25 Ltr.",
               "Sprite 1.25 Ltr.",
               "Ovaltin"),
    price = c(45,
              45,
              39)
  )

## 1.2 present menu to a user
  pizza <- function() {
    number <- 0


    print("Hello welcome to pizzeria restuarant!")
    cat("------------- Pizzas -------------\n")
    cat("\t\tMenus\t\t\t\tPrice\n")
    for (i in 1:nrow(menus_df)) {
      cat(i, ". ", menus_df$menus[i], format(menus_df$price[i], width = 6, justify = "right"), " Baht\n", sep = "")
    }

    cat("\n------------- Drinks -------------\n")
    cat("\tDrinks\t\tPrice\n")
    for (i in 1:nrow(drinks_df)) {
      cat(i, ". ", drinks_df$drinks[i], format(drinks_df$price[i], width = 6, justify = "right"), " Baht\n", sep = "")
    }

## let them choose a menu 
    sum_items <- c()
    total_price1 <- 0
    total_price2 <- 0
      while (TRUE) {
        choose_menu <- readline("Select Pizza: ")
        if(!(choose_menu) %in% menus_df$menus) {
          break
        }
        sum_items <- c(sum_items, choose_menu)
      }
      while (TRUE) {
        choose_drink <- readline("Select Drink: ")
        if(!(choose_drink) %in% drinks_df$drinks) {
          break
        }
        sum_items <- c(sum_items, choose_drink)
      }


      other <- readline("Would you like anything else? Yes/No: ")
      if(other == "Yes") {
        while (TRUE) {
          choose_menu <- readline("Select Pizza: ")
          if(!(choose_menu) %in% menus_df$menus) {
            break
          }
          sum_items <- c(sum_items, choose_menu)
        }
        while (TRUE) {
          choose_drink <- readline("Select Drink: ")
          if(!(choose_drink) %in% drinks_df$drinks) {
            break
          }
          sum_items <- c(sum_items, choose_drink)
        }
      } else {
        # Order summary
        cat("\n------------------Order Summary------------------\n")
        for (item in sum_items) {

          if (item %in% menus_df$menus) {
            price1 <- menus_df$price[menus_df$menus == item]
            total_price1 <- total_price1 +  price1
            cat(number <- number+1,".",item,price1,"Baht","\n")
          } else if (item %in% drinks_df$drinks) {
            price2 <- drinks_df$price[drinks_df$drinks == item]
            total_price2 <- total_price2 + price2
            cat(number <- number+1,".",item,price2,"Baht","\n")
          } else {
            print("Item not found")
          }
        }
        total_price <- (total_price1+total_price2)
         cat("Total Price: ",total_price, " Baht\n", sep = "")
      }
}
  pizza()







