

import UIKit

class PuzzleController: UIViewController {
    
    
    @IBOutlet weak var buton0: UIButton!
    
    @IBOutlet weak var buton1: UIButton!
    
    @IBOutlet weak var buton2: UIButton!
    
    @IBOutlet weak var buton3: UIButton!
    
    @IBOutlet weak var buton4: UIButton!
    
    @IBOutlet weak var buton5: UIButton!
    
    @IBOutlet weak var buton6: UIButton!
    
    @IBOutlet weak var buton7: UIButton!
    
    @IBOutlet weak var buton8: UIButton!
    // Array de nombres de imágenes que se asignarán a los botones
    var colocarImagenes : [String] = ["placeholder","1","2","3","4","5","6","7","8"]
    // Posición actual de la imagen vacía en la cuadrícula
    var situcionImagen = (fila:1 , columna:1)
    var imagenActual = ""
    // Referencia al botón con la imagen vacía
    var imagenVacia = (fila:1 , columna:1)
    var guardarImagen : UIImage?
    var comprobar =  false
    var cuadriculaVaciaNombre :UIButton!
    var cuadriculaSeleccionadaNombre :UIButton!
    
    @IBOutlet weak var stackViewPrincipal: UIStackView!
    
    var fila = 1
    var columna = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Obtengo un array de botones que forman la cuadrícula
        let cuadriculasBg = [buton0,buton1,buton2,buton3,buton4,buton5,buton6,buton7,buton8]
        for cuadro in cuadriculasBg{
            // Asignar una imagen aleatoria a cada botón y eliminarla de la lista
            let random = Int.random(in: 0...colocarImagenes.count-1)
            // Se elige aleatoriamente un índice dentro del rango de la lista de imágenes
            cuadro!.setBackgroundImage(UIImage(named: colocarImagenes[random]), for: .normal)
            // Establece la imagen de fondo del botón actual con la imagen correspondiente al índice aleatorio
            cuadro!.titleLabel?.text = colocarImagenes[random]
            // Establece el texto del título del botón (puede usarse para referencia)
            colocarImagenes.remove(at: random)
            // Elimina la imagen utilizada de la lista para evitar duplicados

            // Guardar la posición de la imagen vacía
            if cuadro!.titleLabel?.text == "placeholder"{
                imagenVacia = (fila,columna)
                cuadriculaVaciaNombre = cuadro
            }
            // Actualizar la posición en la cuadrícula
            if fila <= 3{
                columna += 1
                if columna > 3{
                    fila += 1
                    columna = 1
                }
            }
            
        }
    }
    
    // Configurar posición de la imagen seleccionada y realizar la comprobación
    @IBAction func but0(_ sender: Any) {
        situcionImagen = (1,1)
        cuadriculaSeleccionadaNombre = buton0
        comprobar(cuadriculaSeleccionadaNombre)
    }
    
    @IBAction func but1(_ sender: Any) {
        situcionImagen = (1,2)
        cuadriculaSeleccionadaNombre = buton1
        comprobar(cuadriculaSeleccionadaNombre)
    }
    
    @IBAction func but2(_ sender: Any) {
        situcionImagen = (1,3)
        cuadriculaSeleccionadaNombre = buton2
        comprobar(cuadriculaSeleccionadaNombre)
    }
    
    @IBAction func but3(_ sender: Any) {
        situcionImagen = (2,1)
        cuadriculaSeleccionadaNombre = buton3
        comprobar(cuadriculaSeleccionadaNombre)
    }
    
    @IBAction func but4(_ sender: Any) {
        situcionImagen = (2,2)
        cuadriculaSeleccionadaNombre = buton4
        comprobar(cuadriculaSeleccionadaNombre)
    }
    
    @IBAction func but5(_ sender: Any) {
        situcionImagen = (2,3)
        cuadriculaSeleccionadaNombre = buton5
        comprobar(cuadriculaSeleccionadaNombre)
    }
    
    @IBAction func but6(_ sender: Any) {
        situcionImagen = (3,1)
        cuadriculaSeleccionadaNombre = buton6
        comprobar(cuadriculaSeleccionadaNombre)
    }
    
    @IBAction func but7(_ sender: Any) {
        situcionImagen = (3,2)
        cuadriculaSeleccionadaNombre = buton7
        comprobar(cuadriculaSeleccionadaNombre)
    }
    
    @IBAction func but8(_ sender: Any) {
        situcionImagen = (3,3)
        cuadriculaSeleccionadaNombre = buton8
        comprobar(cuadriculaSeleccionadaNombre)
    }
    
    func comprobar(_ cuadriculaSeleccionadaNombre : UIButton) {
        // Calcular la diferencia entre las posiciones de la imagen seleccionada y la vacía
        let valorFila = abs(situcionImagen.fila - imagenVacia.fila)
        let valorColumna = abs(situcionImagen.columna - imagenVacia.columna)
        // Comprobar si la imagen seleccionada está adyacente a la imagen vacía
        if (valorFila == 0 && valorColumna == 1 ) || (valorColumna == 0 && valorFila == 1){
            comprobar = true
        }
        // Si la comprobación es exitosa, intercambiar las imágenes
        if comprobar == true{
            cuadriculaVaciaNombre.setBackgroundImage(cuadriculaSeleccionadaNombre.currentBackgroundImage, for: .normal)
            //cambio de la primera imagen(vacia por la que teniamos en el boton)
            cuadriculaVaciaNombre = cuadriculaSeleccionadaNombre
            cuadriculaSeleccionadaNombre.setBackgroundImage(UIImage(named: "placeholder"), for: .normal)
            //cambio de la segunda imagen(la que estaba rellena con la nueva vacia)
            imagenVacia = situcionImagen
        }
        //Restablecer variable de comprobacion para que pueda volver a comprobar
        comprobar = false
    }
    
}

