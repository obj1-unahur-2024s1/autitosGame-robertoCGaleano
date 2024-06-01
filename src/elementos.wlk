import wollok.game.*

object enemigo1 {
	
	const velocidad = 250
	
	// definimos los atributos para la imagen y la posición inicial de nuestro elemento(objeto)
	var image = "enemigo1.png"
	var position = game.at(4,6)
	// definimos los getter y setter para poder preguntarle y cambiarle 
	// a nuestro elemento su imagen y posición. 
	//getters
	method image() 		{return image}
	method position()	{return position}
	//setters
	method image(nuevaImagen) 		{ image = nuevaImagen }
	method posicion(nuevaPosicion) 	{ position = nuevaPosicion }
	method moverseAbajo() {
    	var altura= game.height()					//guardo en una var la altura del tablero
    	if (position.y() > 0) {position= game.at(position.x(), position.y()-1) }//si Eje y es mayor a 0 le resto 1
    	else {position= game.at(position.x(), altura-1 ) }	//si eje y es 0 le asigno al eje y el ancho del tablero -1
	}
	method iniciar(){
		game.onTick(velocidad,"enemigo1",{self.moverseAbajo()})
	}
}
object enemigo4 {
	const velocidad = 250
	
	// definimos los atributos para la imagen y la posición inicial de nuestro elemento(objeto)
	var image = "enemigo4.png"
	var position = game.at(4,3)
	// definimos los getter y setter para poder preguntarle y cambiarle 
	// a nuestro elemento su imagen y posición. 
	//getters
	method image() 		{return image}
	method position()	{return position}
	//setters
	method image(nuevaImagen) 		{ image = nuevaImagen }
	method posicion(nuevaPosicion) 	{ position = nuevaPosicion }
	method moverseAbajo() {
    	var altura= game.height()					//guardo en una var la altura del tablero
    	if (position.y() > 0) {position= game.at(position.x(), position.y()-1) }//si Eje y es mayor a 0 le resto 1
    	else {position= game.at(position.x(), altura-1 ) }	//si eje y es 0 le asigno al eje y el ancho del tablero -1
	}
	method iniciar(){
		game.onTick(velocidad,"enemigo4",{self.moverseAbajo()})
	}
}	
object elemento1 {
	const velocidad = 250
	
	// definimos los atributos para la imagen y la posición inicial de nuestro elemento(objeto)
	var image = "tree.png"
	var position = game.at(10,6)
	// definimos los getter y setter para poder preguntarle y cambiarle 
	// a nuestro elemento su imagen y posición. 
	//getters
	method image() 		{return image}
	method position()	{return position}
	//setters
	method image(nuevaImagen) 		{ image = nuevaImagen }
	method posicion(nuevaPosicion) 	{ position = nuevaPosicion }
	method moverseAbajo() {
    	var altura= game.height()					//guardo en una var la altura del tablero
    	if (position.y() > 0) {position= game.at(position.x(), position.y()-1) }//si Eje y es mayor a 0 le resto 1
    	else {position= game.at(position.x(), altura-1 ) }	//si eje y es 0 le asigno al eje y el ancho del tablero -1
	}
	method iniciar(){
		game.onTick(velocidad,"elemento1",{self.moverseAbajo()})
	}
}
object elemento2 {
	const velocidad = 450
	
	// definimos los atributos para la imagen y la posición inicial de nuestro elemento(objeto)
	var image = "super.png"
	var position = game.at(10,2)
	// definimos los getter y setter para poder preguntarle y cambiarle 
	// a nuestro elemento su imagen y posición. 
	//getters
	method image() 		{return image}
	method position()	{return position}
	//setters
	method image(nuevaImagen) 		{ image = nuevaImagen }
	method posicion(nuevaPosicion) 	{ position = nuevaPosicion }
	
	method moverseArriba() {
    	var altura= game.height()					//guardo en una var la altura del tablero
    	var nuevoY= (position.y()+1) % altura		//le sumo 1 a la posicion del eje y, y me fijo si esta en la ultima posicion le doy el valor 0 
	    position = game.at(self.position().x(), nuevoY)	//guardo en la var position la nueva posicion
    }
    method iniciar(){
		game.onTick(velocidad,"elemento2",{self.moverseArriba()})
	}
}	
