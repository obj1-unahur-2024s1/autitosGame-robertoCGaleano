//ejercicio wollok game en archivo auto
import wollok.game.*

object auto {
	// definimos los atributos para la imagen y la posición inicial de nuestro elemento(objeto)
	var image = "auto1.png"
	var position = game.at(3,1)

	// definimos los getter y setter para poder preguntarle y cambiarle 
	// a nuestro elemento su imagen y posición. 
	//getters
	method image() 		{return image}
	method position()	{return position}
	//setters
	method image(nuevaImagen) 		{ image = nuevaImagen }
	method posicion(nuevaPosicion) 	{ position = nuevaPosicion }

    //metodo en auto para moverse una posicion a la derecha 
    method moverseALaDerecha(){
    	var ancho= game.width()					//guardo en una var el ancho del tablero
    	var nuevoX= (position.x()+1) % ancho	//le sumo 1 a la posicion del eje X, y me fijo si esta en la ultima posicion le doy el valor 0 
	    position = game.at(nuevoX, self.position().y())	//guardo en la var position la nueva posicion
    }
    
    method moverseALaIzquierda(){
    	var ancho= game.width()					//guardo en una var el ancho del tablero
    	if (position.x() > 0) {position= game.at(position.x()-1, position.y() ) }//si Eje x es mayor a 0 le resto 1
    	else {position= game.at(ancho -1, position.y() ) }	//si eje x es 0 le asigno al eje x el ancho del tablero -1
    }
    
    method moverseArriba() {
    	var altura= game.height()					//guardo en una var la altura del tablero
    	var nuevoY= (position.y()+1) % altura		//le sumo 1 a la posicion del eje y, y me fijo si esta en la ultima posicion le doy el valor 0 
	    position = game.at(self.position().x(), nuevoY)	//guardo en la var position la nueva posicion
    }
    method moverseAbajo() {
    	var altura= game.height()					//guardo en una var la altura del tablero
    	if (position.y() > 0) {position= game.at(position.x(), position.y()-1) }//si Eje y es mayor a 0 le resto 1
    	else {position= game.at(position.x(), altura-1 ) }	//si eje y es 0 le asigno al eje y el ancho del tablero -1
    }
}
