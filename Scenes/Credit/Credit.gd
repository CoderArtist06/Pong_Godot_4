extends Control


@onready var credit_label: Label = $CreditLabel
var speed: float = 40.0  # pixel al secondo


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("exit"):
		GameManager.set_mode("main")


func _ready():
	credit_label.text = """
	Pong
	
	
	
	
	Credit
	
	
	Programmer
	
	Valentin Cristian Ghita (aka CoderArtist06)
	
	
	Artist
	
	Valentin Cristian Ghita (aka CoderArtist06)
	
	
	
	
	Third-Party Resources
	
	
	Font
	
	The Tiny5 Project 
	Authors (https://github.com/Gissio/font_tiny5)
	licensed under 
	SIL Open Font License, Version 1.1
	
	
	SFX
	
	Nicolás A. Ortega (Deathsbreed), DeathsbreedGames
	Licensed under 
	CC-BY-SA
	Source
	(http://deathsbreedgames.github.io/)
	(https://opengameart.org/content/pong-sfx)
	
	
	Music
	
	“HBABUA - 8:6:25, 12.58 AM” by VADE 
	Licensed under 
	CC BY 4.0 
	Source
	Free Music Archive
	
	
	
	
	Special Thanks
	
	Inspired by Pong (1972), one of 
	the earliest and most influential 
	video games.
	
	
	thank you all for playing my first game 
	- CoderArtist06
	
	
	
	
	
	The video game is licensed under 
	GPL-3.0.
	"""
	
	# Posiziona il testo sotto lo schermo
	credit_label.position.y = size.y


func _process(delta):
	credit_label.position.y -= speed * delta
	# Rimuove il nodo quando è completamente fuori dallo schermo
	if credit_label.position.y + credit_label.size.y < -48:
		credit_label.queue_free()
		GameManager.set_mode("main")
