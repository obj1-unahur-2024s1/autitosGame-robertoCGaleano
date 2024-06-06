import elementos.*
import fondos.*
import wollok.game.*
import level1.*
import auto.*

object juego {
	
	method play(){
		self.pantallaInicial()
	
		game.start()
	}
	
	method pantallaInicial(){
		game.title("Autitos game")
		
		game.addVisual(fondo)       			// agrega object pantalla Inicial como fondo al tablero
		game.width(14)                          // le damos ancho al tablero
		game.height(8)							// le damos alto al tablero
		game.addVisual(mano)
		//asignamos teclas para mover la mano en el tablero
		keyboard.up().onPressDo{mano.moverseArriba()}
		keyboard.down().onPressDo{mano.moverseAbajo()}
		//asignamos level 1 0 2 segun la posicion de mano
		keyboard.enter().onPressDo{ if (mano.level()==1) level1.configurarPantallaLevel1() else self.pantallaInicial()}//falta agregar leve2 momentaneamente pantallaInicial()
		
	}
	
	method actualizarVidas(){
		// habria que ver como evitar tantos if
		if (auto.vida()==4) game.removeVisual(vida4)
		if (auto.vida()==3) game.removeVisual(vida3)
		if (auto.vida()==2) game.removeVisual(vida2)
		if (auto.vida()==1) game.removeVisual(vida1)
	}
}	

	