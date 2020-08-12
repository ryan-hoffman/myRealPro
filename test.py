
tune_list = [
            {"chart": "after_youve_gone", "title": "After You've Gone"},
            {"chart": "all_of_me", "title": "All of Me"},
            {"chart": "all_the_things_you_are", "title": "All the Things You Are"},
            {"chart": "autumn_leaves", "title": "Autumn Leaves"}
]



def tunes():
    for number in range(0, 4):
        print(tune_list[number]["chart"], tune_list[number]["title"])

tunes()

# for myRealPro user selection will be the number for the tune selection

files_dict = [{1: "after_youve_gone.eps"},
              {2: "all_of_me.eps"},
              {3: "all_the_things_you_are.eps"}
              ]

def tune_choice():
    for thing in files_dict():
        print(thing[0])

tune_choice()