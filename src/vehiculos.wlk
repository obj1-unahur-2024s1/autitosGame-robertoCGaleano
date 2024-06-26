import wollok.game.*
//import elementos.*
import auto.*

class Vehiculo {
	// definimos los atributos para velocidad y posición
	var velocidad = 350
	var position 

	method position()= position
	
	// definimos los metodos de indicacion
	method moverseALaDerecha() {
    	position = game.at(position.x()+1, position.y())
  	}
	
    method moverseALaIzquierda(){
    	position = game.at(position.x()+1, position.y())
  	}
	method moverseAbajo() {
		const x = (3.. game.width()-6).anyOne()		//le asigno un valor random al Eje X
    	const altura= game.height()					//guardo en una const la altura del tablero
    	if (position.y() > 0) {position= game.at(position.x(), position.y()-1) }//si Eje Y es mayor a 0 le resto 1
    	else {position= game.at(x, altura-1 ) }	//si Eje Y es 0 le asigno al eje Y la altura del tablero -1
	}
	method moverseArriba() {
    	position = game.at(position.x(), position.y()+1)
  	}
	
	//metodo de indicacion cuando colisiona
	method chocar(){
		self.moverseArriba()
		//aca se intento agregar una explosion, por ahora no funciono
		//game.schedule(200,game.addVisual(bomba))
		//bomba.animacionBomba()
		//bomba.eliminar(200, "explosion")
		auto.chocar()
		game.say(self,"conduce mejor")
		
	}
	
	method iniciar(){
		game.onTick(velocidad,"enemigo",{self.moverseAbajo()})
	}
}

//sub clases de Vehiculo:

class AutoRojo inherits Vehiculo{
	// definimos la imagen 

	method image()= "enemigo3.png"
}
class Camion inherits Vehiculo{
	// definimos la imagen 

	method image()= "enemigo4.png"
}
class AutoAmarillo inherits Vehiculo{
	// definimos la imagen 

	method image()= "enemigo2.png"
}
class AutoAzul inherits Vehiculo{
	// definimos la imagen 

	method image()= "enemigo1.png"
}
