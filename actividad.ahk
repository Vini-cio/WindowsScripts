; Listado de teclas presionables
keysList := ["CapsLock", "Up", "Down", "Left", "Right"]

; Generar un intervalo de sueño aleatorio entre 20 y 50 segundos
Random, sleepInterval, 20000, 50000

; Coordenadas de la cabecera de aplicaciones
xCoord := 900
yCoord := 40

Loop {
    ; Obtener el título de la ventana activa
    WinGetActiveTitle, activeWindowTitle
    
    ; Comprobar si la ventana activa es de TimeDoctor
    if (InStr(activeWindowTitle, "Time Doctor")) {
        MsgBox, Detectado TimeDoctor
        
        ; Simular pulsaciones de teclas
        Send, +^{Shift down}
        Sleep, 2000
        Send, +^{Shift up}
        Sleep, 2000
        
        ; Minimizar ventana de TimeDoctor
        WinMinimize, ahk_class %activeWindowTitle%
        MsgBox, Minimizando ventana del TimeDoctor
    }
    
    ; Generar un número aleatorio de iteraciones
    Random, numIteraciones, 0, % (keysList.MaxIndex() - 1)
    
    ; Iterar desde 0 hasta el número aleatorio
    Loop, %numIteraciones% {
        Random, numTecla, 0, % (keysList.MaxIndex() - 1)
        tecla := keysList[numTecla + 1]
        Send, %tecla%
        Sleep, 5000
    }
    
    ; Movimiento de mouse
    MouseMove, %xCoord%, %yCoord%
    Sleep, 1000
    MouseClick, left
    
    ; Simulación de Alt+Tab
    Send, {Alt down}
    Loop, %numIteraciones% {
        Send, {Tab}
        Sleep, 2000
    }
    Send, {Alt up}
    
    ; Dormir por el intervalo especificado antes de la siguiente acción
    Sleep, %sleepInterval%
}
