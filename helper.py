import requests, json

def load_test_recipe():
    guac_ingredients = [{
            "amount": "1",
            "item": "avocado"
         }, {
            "amount": ".5 teaspoon",
            "item": "salt"
        }
        ]
    payload_one = {"recipe": {"title": "guacamole", "ingredients": guac_ingredients}}
    #payload_one = {"recipe": {"title": "guacamole"}}
    requests.post("https://reecipes.ironrobin.net/api/recipes", json=payload_one)

load_test_recipe()
