import wollok.game.*
import vehiculos.*
import auto.*

class Elemento {
	var velocidad
	var position 
	method position()= position
	
	// definimos los metodos de indicacion
	method moverseAbajo() {
    	const altura= game.height()					//guardo en una var la altura del tablero
    	if (position.y() > 0) {position= game.at(position.x(), position.y()-1) }//si Eje y es mayor a 0 le resto 1
    	else {position= game.at(position.x(), altura-1 ) }	//si eje y es 0 le asigno al eje y el ancho del tablero -1
	}
	 method moverseArriba() {
    	const altura= game.height()						//guardo en una var la altura del tablero
    	const nuevoY= (position.y()+1) % altura			//le sumo 1 a la posicion del eje y, y me fijo si esta en la ultima posicion le doy el valor 0 
	    position = game.at(self.position().x(), nuevoY)	//guardo en la var position la nueva posicion
    }
	method iniciar(){
		game.onTick(velocidad,"elemento1",{self.moverseAbajo()})
	}
}

class Arbusto inherits Elemento{
	// definimos la imagen 

	method image()= "tree.png"
}

class Super inherits Elemento{
	// definimos la imagen 

	method image()= "super.png"
	
	override  method iniciar(){
		game.onTick(velocidad,"elemento1",{self.moverseArriba()})
	}
}
	
class Referencia inherits Elemento{
	// definimos la imagen 

	method image()= "referencia.png"
	
	override method iniciar(){
		game.onTick(velocidad,"elemento1",{self.moverseArriba()})
	}
}

class Fuel inherits Elemento{
	// definimos la imagen 

	method image()= "vida.png"
	method chocar(){
		game.removeVisual(self)
	}
}

object bomba{
	//variables para las animaciones
	const img = ["bomba1.png", "bomba2.png","bomba3.png" ]
	var property image= "bomba1.png"
	method position()= auto.position()
	
	method animacionBomba(){ // Animacion itera sobre la lista de imagenes y cambia el visual cada X tiempo
		var i = 0
		game.onTick(50,"explosion",{self.image(img.get(i%3)) i+=1})
	}
	//elimina la animacion
	method eliminar(tiempo,tick){
		game.schedule(tiempo, {game.removeTickEvent(tick)})		
	}
	
}	

object gameOver {
	method position() = game.center()
	
	method text() = "GAME OVER"
}
