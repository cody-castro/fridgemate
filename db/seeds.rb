Roommate.delete_all
Grocery.delete_all
Fridgemate.delete_all


cody = Roommate.new(name: "Cody", allergy: "nut allergy", budget: 100)
greg = Roommate.new(name: "Greg", allergy: "lactose intolerant", budget: 200)
karen = Roommate.new(name: "Karen", allergy: "gluten free", budget: 500)
beyonce = Roommate.new(name: "Beyoncé", allergy: "no allergy", budget: 10000)

ketchup = Grocery.create(name: "Heinz Ketchup", contains: "Gluten", quantity: 4, quality: 4, cost: 5)
oatmilk = Grocery.create(name: "Oatly", contains: "oats", quantity: 3, quality: 4, cost: 10) 
milk = Grocery.create(name: "Whole Goat Milk", contains: "Dairy", quantity: 2, quality: 3, cost: 8)
nachos = Grocery.create(name: "Dos Toros Nachos", contains: "Dairy", quantity: 2, quality: 4, cost: 5)
ritz = Grocery.create(name: "Original Ritz Crackers", contains: "Gluten", quantity: 1, quality: 4, cost: 8)

fm1 = Fridgemate.create(roommate: karen, grocery: ketchup)
fm2 = Fridgemate.create(roommate: beyonce, grocery: oatmilk)
fm3 = Fridgemate.create(roommate: beyonce, grocery: milk)
fm4 = Fridgemate.create(roommate: cody, grocery: nachos)
fm4 = Fridgemate.create(roommate: greg, grocery: ritz)


