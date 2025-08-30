extends Panel


@export var dash_lenght: int = 10
@export var gap: int = 10


# Sto utilizzando questa funzione per creare una linea tratteggiata
#
# I am using this function to create a dashed line.
func _draw() -> void:
	# Ottiene le coordinate iniziali per disegnare la linea
	#
	# Gets the initial coordinates to draw the line
	var start = Vector2(size.x/2, 0)
	
	var y: int = 0
	
	# Disegna una linea verticale tratteggiata centrata orizzontalmente nel nodo.
	# Ogni tratto bianco ha uno spessore di 8 pixel e una lunghezza definita da dash_length.
	# Tra un tratto e l'altro viene lasciato uno spazio (gap), creando l'effetto tratteggiato.
	# Il ciclo continua finché non si raggiunge il bordo inferiore del nodo.
	#
	# Draw a centered horizontal dashed vertical line in the node.
	# Each white dash has a thickness of 8 pixels and a length defined by dash_length.
	# A space (gap) is left between each dash, creating the dashed effect.
	# The loop continues until the bottom edge of the node is reached.
	while y < size.y:
		var from = Vector2(start.x, y)
		var to = Vector2(start.x, y + dash_lenght)
		
		draw_line(from, to, Color.WHITE, 8)
		
		y += dash_lenght + gap
