import elementos.*
import vehiculos.*
import auto.*
import wollok.game.*

object juego {
	
	method play(){
	
		self.configurarPantalla()
	
		game.start()
	}
	
	method configurarPantalla(){
		
		game.title("Autitos game")
		// límites del tablero de juego
    	game.width(14)                          // le damos ancho al tablero
		game.height(8)							// le damos alto al tablero
		// fondo
		game.boardGround("bg.png")       		// agrega imagen de fondo al tablero
		
    	// Iniciamos los personajes
		self.posicionarAutosEnemigos()
		self.posicionarElementos()
		self.posicionarAuto()
		
		
	}
	
	method posicionarAutosEnemigos(){
		
		const enemigo1 = new AutoRojo( position = game.at(4,6))
		const enemigo2 = new Camion( position = game.at(3,7))
		const enemigo3 = new AutoAmarillo( position = game.at(6,5))
		const enemigo4 = new AutoAzul( position = game.at(8,3))
		
		const autosEnemigos = [enemigo1, enemigo2, enemigo3, enemigo4]
		
		autosEnemigos.forEach{enemigo => game.addVisual(enemigo)}
		autosEnemigos.forEach{enemigo => enemigo.iniciar()}
	}
		
	method posicionarElementos(){
		const elemento1 = new Arbusto(velocidad= 300, position = game.at(10,6))
		const elemento2 = new Arbusto(velocidad= 300, position = game.at(10,2))
		const elemento3 = new Super(velocidad= 100, position = game.at(13,8))
		const elemento4 = new Referencia(velocidad= 6000, position = game.at(0,0))
		const elemento5 = new Fuel(velocidad= 300, position = game.at(5,8))
		
		const elementos = [elemento1, elemento2, elemento3, elemento4, elemento5]
		
		elementos.forEach{elemento => game.addVisual(elemento)}
		elementos.forEach{elemento => elemento.iniciar()}

	}
	
	method posicionarAuto(){
		
		game.addVisual(auto)
		//asignamos teclas para mover al auto en el tablero
		keyboard.right().onPressDo{auto.moverseALaDerecha()}
		keyboard.left().onPressDo{auto.moverseALaIzquierda()}
		keyboard.up().onPressDo{auto.moverseArriba()}
		keyboard.down().onPressDo{auto.moverseAbajo()}
		
		game.onCollideDo(auto,{vehiculo => vehiculo.chocar()})
	}
	
}