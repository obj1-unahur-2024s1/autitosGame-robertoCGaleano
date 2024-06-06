import wollok.game.*
import elementos.*
import fondos.*
import auto.*
import vehiculos.*


object level2{
	method configurarPantallaLevel2(){
		//sacamos el object mano
		game.removeVisual(mano)
		//configuramos fondo del juego en level 2
		fondo.cambiarFondo("fondoLevel2.png")
		
    	// Iniciamos los personajes de level2
		self.posicionarAutosEnemigos()
		self.posicionarElementos()
		self.posicionarAuto()
		self.posicionarBanderas()
		self.iniciarFuel()
		self.iniciarVidas()
		//agregamos a pepita como invitada
		game.addVisual(pepita)
		game.onTick(10000, "sale pepita",{pepita.salir()})
	}
	
	method posicionarAutosEnemigos(){	
		const enemigo1 = new AutoRojo( velocidad= 150, position = game.at(4,6))
		const enemigo2 = new Camion( velocidad= 200, position = game.at(5,7))
		const enemigo3 = new AutoAmarillo( velocidad= 150, position = game.at(6,5))
		const enemigo4 = new AutoAzul( velocidad= 150, position = game.at(8,3))
		const enemigo5 = new Camion( velocidad= 200, position = game.at(7,4))
		
		const autosEnemigos = [enemigo1, enemigo2, enemigo3, enemigo4, enemigo5]
		
		autosEnemigos.forEach{enemigo => game.addVisual(enemigo)}
		autosEnemigos.forEach{enemigo => enemigo.iniciar()}
	}
		
	method posicionarElementos(){
		
		
		const elemento6 = new Super(velocidad= 200, position = game.at(1,8))
		const elemento7 = new Referencia(velocidad= 6000, position = game.at(0,1))
		const elemento8 = new Fuel(velocidad= 300, position = game.at(5,8))
		
		const elementos = [ elemento6, elemento7, elemento8]
		
		elementos.forEach{elemento => game.addVisual(elemento)}
		elementos.forEach{elemento => elemento.iniciar()}
		//elemento7.mostrarLlegada()  //falta metodo en elemento referencia que deberia de mostrar la llegada
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
	
	method posicionarBanderas(){
		const bandera1 = new Bandera(image= "banderaLargada.png", position = game.at(0,0))
		const bandera2 = new Bandera(image= "banderaLlegada.png", position = game.at(0,7))
		game.addVisual(bandera1)
		game.addVisual(bandera2)
	}
	
	method iniciarFuel(){
		game.addVisual(medidorFuel)
		medidorFuel.animacionFuel()
	}
	
	method iniciarVidas(){
		const vidas = [vida1, vida2, vida3, vida4]
		vidas.forEach{vida => game.addVisual(vida)}
		
	}
		
}

