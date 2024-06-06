import wollok.game.*
import fondos.*
//import vehiculos.*
import auto.*

class Elemento {
	var velocidad
	var position 
	
	method position()= position
	
	// definimos los metodos de indicacion
	method moverseAbajo() {
    	const altura= game.height()					//guardo en una const la altura del tablero
    	if (position.y() > 0) {position= game.at(position.x(), position.y()-1) }//si Eje Y es mayor a 0 le resto 1
    	else {position= game.at(position.x(), altura-1 ) }	//si eje Y es 0 le asigno al eje Y la altura del tablero -1
	}
	 method moverseArriba() {
    	const altura= game.height()						//guardo en una const la altura del tablero
    	const nuevoY= (position.y()+1) % altura			//le sumo 1 a la posicion del eje Y, me fijo si esta en la ultima posicion le doy el valor 0 
	    position = game.at(self.position().x(), nuevoY)	//guardo en la var position la nueva posicion
    }
    
    method chocar(){
		game.say(self,"vuelve a la carretera")
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
	//modificamos el metodo que hereda para que se mueva hacia arriba
	override  method iniciar(){
		game.onTick(velocidad,"elemento1",{self.moverseArriba()})
	}
}
	
class Referencia inherits Elemento{
	// definimos la imagen 

	method image()= "referencia.png"
	//modificamos el metodo que hereda para que se mueva hacia arriba
	override method iniciar(){
		game.onTick(velocidad,"elemento1",{self.moverseArriba()})
	}
	
	//method mostrarLlegada(){
		//if(position.y()==7) fondo.cambiarFondo("fondoLlegada.png")
	//}
}

class Fuel inherits Elemento{
	// definimos la imagen 

	method image()= "vida.png"
	//modificamos el metodo que hereda 
	override method chocar(){
		game.removeVisual(self)
		//auto.sumarVida()   //tiene una inconsistencia al actualizar imagenes de vidas
		//deberiamos agregar un metodo que vuelva a agregar la imagen 
	}
}

class Bandera {
	const position
	var image
	
	method image()= image
	method position()= position
	
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


object pepita{
	var position= game.at(0,7)
	
	method position()= position
	method image()= "pepita.png"
	
	method moverseALaDerecha(){
    	const ancho= game.width()					//guardo en una const el ancho del tablero
    	const nuevoX= (position.x()+1) % ancho	//le sumo 1 a la posicion del eje X, y me fijo si esta en la ultima posicion le doy el valor 0 
	    position = game.at(nuevoX, self.position().y())	//guardo en la var position la nueva posicion
    }
    method salir(){
    	game.schedule(300, {game.say(self, if (auto.vida()>0)"apresurate" else "perdiste")})
    	game.schedule(300, {self.moverseALaDerecha()})
    }
}

object mano{
	var position= game.at(5,2)
	var level= 1
	
	method image()= "selecInicial.png"
	method position()= position
	method level()= level
	
	method moverseArriba(){
		position= game.at(5,2)
		level= 1
	}
	method moverseAbajo(){
		position= game.at(5,1)
		level= 2
	}
}

object medidorFuel{
	var image = "barraNafta5.png"
	const img= ["barraNafta5.png", "barraNafta4.png", "barraNafta3.png", "barraNafta2.png", "barraNafta1.png", "barraNafta0.png"]
	
	method image()= image
	method position()= game.at(12,1)
	
	method image(nueva){ image= nueva}
	method animacionFuel(){
		var i= 0
		// si el nivel de fuel llega a 0 se detiene el juego. Se podria agregar una pantalla game over.
		game.onTick(6000,"bajaFuel",{self.image(img.get(i%6)) i+=1  if (self.image()== "barraNafta0.png") game.addVisual(gameOver) } )//o {game.stop()}} )
		
	}
}

//se podria realizar con clases para no repetir codigo
object vida1 {
	method image()= "vidas0.png"
	method position()= game.at(11,6)
}
object vida2 {
	method image()= "vidas1.png"
	method position()= game.at(11,5)
}
object vida3 {
	method image()= "vidas2.png"
	method position()= game.at(11,4)
}
object vida4 {
	method image()= "vidas3.png"
	method position()= game.at(11,3)
}

