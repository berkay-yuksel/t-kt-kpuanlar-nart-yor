extends RichTextLabel


export var stone = 0
export var miner= 0


export var food = 0
export var hunter= 0

export var gold = 0
export var fighter= 0

var laborcost=25
export var totallabors=3
export var totalfighters=0

export var hunterboost= 1
export var hunterboostlevel=0
export var minerboost=1
export var minerboostlevel=0
export var fighterboost=1
export var fighterboostlevel=0


onready var timer = get_parent().get_node("Timer")
onready var buy_labor_button = get_parent().get_node("buy_labor")

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.set_wait_time(0.5)
	timer.start()

	pass # Replace with function body.


func _on_Timer_timeout():
	set_text(String(stone)+"               "+String(stone)+"               "+String(totallabors))
	stone= stone + 1*miner*minerboost
	food= food + 1*hunter*hunterboost
	gold = gold + 0.1*fighter*fighterboost
	pass # Replace with function body.



func _on_Button_pressed():
	if totallabors>0:
		miner+=1
		totallabors-=1
	pass # Replace with function body.


func _on_Button2_pressed():
	if miner>0:
		miner-=1
		totallabors+=1
	pass # Replace with function body.





func _on_inc_hunter_pressed():
	if totallabors>0:
		hunter+=1
		totallabors-=1
	pass # Replace with function body.


func _on_dec_hunter_pressed():
	if hunter>0:
		hunter-=1
		totallabors+=1
	pass # Replace with function body.


func _on_buy_labor_pressed():
	if food >= laborcost:
		food=food-laborcost
		totallabors+=1
		laborcost*=1.17
		get_parent().get_node("buy_labor").text="get labor("+String(int(laborcost))+" food)"
	pass # Replace with function body.


func _on_dec_fighter_pressed():
	if fighter>0:
		fighter-=1
		totallabors+=1
	pass # Replace with function body.


func _on_inc_fighter_pressed():
	if totalfighters>0:
		fighter+=1
		totalfighters-=1
	pass # Replace with function body.


func _on_get_a_fighter_pressed():
	if totallabors > 0 && food >= 50 && stone >= 25:
		food-=50
		stone-=25
		totallabors-=1
		totalfighters +=1 
		get_parent().get_node("buy_labor").text="get labor("+String(laborcost)+" food)"
	pass # Replace with function body.


func _on_boost_hunters_pressed():
	if gold>100:
		hunterboost+=0.25
		hunterboostlevel+=1
		gold-=100
	pass # Replace with function body.


func _on_boost_miners_pressed():
	if gold>100:
		minerboost+=0.25
		minerboostlevel+=1
		gold-=50
	pass # Replace with function body.


func _on_boost_fighters_pressed():
	if gold>150:
		fighterboost+=0.25
		fighterboostlevel+=1
		gold-=50
	pass # Replace with function body.

