
# GroceryMate 


## Schema

### Grocery
name (string)
quantity (1-4)
contains (dairy, nuts, gluten)
quality (1-5)
cost (Integer 1-100)
owner = roommate instance
### Roommate
name (string)
allergy (lactose intolerant, nut allergy, gluten free) 
budget (Integer)

### Classes
Grocerymate
Roommates
Groceries

## Associations Model
A grocerymate *has many* roommates
A grocerymate *has many* groceries
Groceries can *have many* roommates
Roommates *have many* groceries


## User stories
As a roommate, I want to see how much of a grocery I have left (Read)
As a roommate, I want to add my groceries to the grocerymate (Create)
As a roommate, I want to to see all the groceries I have in the grocerymate (Read)
As a roommate, I want to consume a grocery which reflects in the groceries quantity (Update)
As a roommate I want to be able to toss one of my groceries (Delete)
A roommate should be able to see all their groceries (Read)
As a roommate I should be able to share groceries with another roommate (Update)
As a roommate I should be able to see which groceries are share with other roommates (Read)
As a roommate I should be able to gift a grocery to another roommate (Update)
As a roommate I should be able to move out and my groceries become shared among the remaining roommates (Update)
As a roommate I expect to be able to *steal* another roommates groceries if it is under a quarter quantity (Update)

## Stretch Goals
Store class contains many grocery items
grocerymate can put grocery items from the Store in to the grocerymate

