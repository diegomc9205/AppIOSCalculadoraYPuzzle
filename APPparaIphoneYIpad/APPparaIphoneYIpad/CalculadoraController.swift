//
//  CalculadoraController.swift
//  APPparaIphoneYIpad
//
//  Created by dam2 on 22/11/23.
//

import UIKit

class CalculadoraController: UIViewController {
    
    
    
    @IBOutlet weak var textMostrarResultado: UILabel!
    // Variables para almacenar los números y la operación actual
    var memoria: Double = 0.0
    var primerNumero: String = ""
    var operacionPendiente: String?
    var segundoNumero: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func botonHacerOperacion(_ sender: Any) {
        // Verificar si se pueden convertir los números ingresados a valores Double
        if let primerValor = Double(primerNumero), let segundoValor = Double(segundoNumero) {
            // Inicializar la variable resultado
            var resultado: Double = 0.0
            // Realizar la operación según la operación pendiente
            switch operacionPendiente {
            case "+":
                resultado = primerValor + segundoValor
            case "-":
                resultado = primerValor - segundoValor
            case "*":
                resultado = primerValor * segundoValor
            case "/":
                // Verificar si el divisor (segundoValor) no es cero
                if segundoValor != 0 {
                    resultado = primerValor / segundoValor
                } else {
                    // Manejar el caso de división por cero mostrando un mensaje de error
                    textMostrarResultado.text = "Error"
                    // Reiniciar variables
                    reiniciarVariables()
                    return
                }
            default:
                // Manejar el caso de una operación no válida mostrando un mensaje de error
                textMostrarResultado.text = "Error"
                // Reiniciar variables
                reiniciarVariables()
                return
            }
            
            //muestro resultado
            textMostrarResultado.text = String(resultado)
            
            // Reiniciar variables para la siguiente operación
            primerNumero = String(resultado)
            operacionPendiente = nil
            segundoNumero = ""
        } else {
            //manejo el caso en el que no se puedan convertir
            textMostrarResultado.text = "Error"
            //Reiniciar variables
            reiniciarVariables()
        }
    }
    
    @IBAction func botonComa(_ sender: Any) {
        if operacionPendiente == nil {
            primerNumero += "."
        } else {
            segundoNumero += "."
        }
        textMostrarResultado.text = operacionPendiente == nil ? primerNumero : segundoNumero
    }
    
    @IBAction func botonSumar(_ sender: Any) {
        operacionPendiente = "+"
        
    }
    
    @IBAction func botonRestar(_ sender: Any) {
        operacionPendiente = "-"
        
    }
    
    @IBAction func botonMultiplicar(_ sender: Any) {
        operacionPendiente = "*"
        
    }
    
    @IBAction func botonDividir(_ sender: Any) {
        operacionPendiente = "/"
        
    }
    
    @IBAction func botonReset(_ sender: Any) {
        primerNumero = ""
        operacionPendiente = nil
        segundoNumero = ""
        textMostrarResultado.text = ""     }
    
    
    
    @IBAction func boton0(_ sender: Any) {
        if operacionPendiente == nil {
            primerNumero += "0"
        } else {
            segundoNumero += "0"
        }
        textMostrarResultado.text = operacionPendiente == nil ? primerNumero : segundoNumero
        
        
    }
    @IBAction func boton1(_ sender: Any) {
        if operacionPendiente == nil {
            primerNumero += "1"
        } else {
            segundoNumero += "1"
        }
        textMostrarResultado.text = operacionPendiente == nil ? primerNumero : segundoNumero
    }
    
    @IBAction func boton2(_ sender: Any) {
        if operacionPendiente == nil {
            primerNumero += "2"
        } else {
            segundoNumero += "2"
        }
        textMostrarResultado.text = operacionPendiente == nil ? primerNumero : segundoNumero
    }
    @IBAction func buton3(_ sender: Any) {
        if operacionPendiente == nil {
            primerNumero += "3"
        } else {
            segundoNumero += "3"
        }
        textMostrarResultado.text = operacionPendiente == nil ? primerNumero : segundoNumero
    }
    @IBAction func buton4(_ sender: Any) {
        if operacionPendiente == nil {
            primerNumero += "4"
        } else {
            segundoNumero += "4"
        }
        textMostrarResultado.text = operacionPendiente == nil ? primerNumero : segundoNumero
    }
    
    @IBAction func buton5(_ sender: Any) {
        if operacionPendiente == nil {
            primerNumero += "5"
        } else {
            segundoNumero += "5"
        }
        textMostrarResultado.text = operacionPendiente == nil ? primerNumero : segundoNumero
    }
    
    @IBAction func buton6(_ sender: Any) {
        if operacionPendiente == nil {
            primerNumero += "6"
        } else {
            segundoNumero += "6"
        }
        textMostrarResultado.text = operacionPendiente == nil ? primerNumero : segundoNumero    }
    
    @IBAction func buton7(_ sender: Any) {
        if operacionPendiente == nil {
            primerNumero += "7"
        } else {
            segundoNumero += "7"
        }
        textMostrarResultado.text = operacionPendiente == nil ? primerNumero : segundoNumero    }
    
    @IBAction func buton8(_ sender: Any) {
        if operacionPendiente == nil {
            primerNumero += "8"
        } else {
            segundoNumero += "8"
        }
        textMostrarResultado.text = operacionPendiente == nil ? primerNumero : segundoNumero    }
    
    @IBAction func buton9(_ sender: Any) {
        if operacionPendiente == nil {
            primerNumero += "9"
        } else {
            segundoNumero += "9"
        }
        textMostrarResultado.text = operacionPendiente == nil ? primerNumero : segundoNumero
    }
    
    
    @IBAction func botoncambiarsigno(_ sender: Any) {
        if let textoActual = textMostrarResultado.text, let valorActual = Double(textoActual) {
            let nuevoValor = -valorActual
            textMostrarResultado.text = String(nuevoValor)
        } else {
            // Manejo de error: El texto no es un número válido
            textMostrarResultado.text = "Error"
        }
    }
    
    @IBAction func botonporcentaje(_ sender: Any) {
        if let valorActual = Double(textMostrarResultado.text ?? "0") {
            let porcentaje = valorActual / 100.0
            textMostrarResultado.text = String(porcentaje)
        }
    }
    
    @IBAction func botonMemoriaSumar(_ sender: Any) {
        if let valorActual = Double(textMostrarResultado.text ?? "0") {
            memoria += valorActual
        }
    }
    
    
    @IBAction func botonMemoriaRestar(_ sender: Any) {
        if let valorActual = Double(textMostrarResultado.text ?? "0") {
            memoria -= valorActual
        }
    }
    
    @IBAction func botonMemoriaBorrar(_ sender: Any) {
        memoria = 0.0
        
    }
    
    @IBAction func botonMemoriaRecuperar(_ sender: Any) {
        textMostrarResultado.text = String(memoria)
        
    }
    
    
    
    func reiniciarVariables() {
        primerNumero = ""
        operacionPendiente = nil
        segundoNumero = ""
        textMostrarResultado.text = ""
    }
    
}
