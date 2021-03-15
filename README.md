# sistemaPlanetarioNave

Autor: Carlos Javier Martín Perdomo

Descripción: Simulación de rotación y translación de diferentes cuerpos planetarios alrededor de una estrella. Cada planeta tiene su propia orbita y rota sobre si mismo. Se incluye una nave. Se dispone también de dos vistas:

Vista panorámica:
![error](https://github.com/CarlosJavierMartin/sistemaPlanetarioNave/blob/master/vistaP.jpeg?raw=true)

Vista de la nave:
![error](https://github.com/CarlosJavierMartin/sistemaPlanetarioNave/blob/master/vistaN.jpeg?raw=true)

Decisiones de código:
  - Se creo una clase llamada Planet que representa un planeta. Contiene todos los datos y parametros necesarios para el planeta y para una posible luna.
  - Se creo una clase llamada Camara que representa las distintas vistas.
  - La vista panorámica se encuentra estática y muestra los distintos controles.
  - La vista de la nave permite al usuario moverse alrededor del sistema usando las flechas del teclado para rotar en las distintas direcciones y el espacio para avanzar
  

Resultado (El gif se muestra a una velocidad inferior a la realidad de la ejecución debido a que cuando se captura el gif se ralentiza):
![error](https://github.com/CarlosJavierMartin/sistemaPlanetarioNave/blob/master/spn.gif?raw=true)

Acciones realizadas:
  - Se prueba varias veces el cambio de vista.
  - Se prueba a rotar hacia todas las direcciones
  - Se prueba el movimiento de la nave. Se puede observar que la nave se mueve en la panorámica también.
  - Se prueba el reseteo para ver el movimiento de la nave
  
Referencias:
  - Recursos de programación:
    - https://processing.org/reference/
  - Texuras:
    - Fondo: https://www.solarsystemscope.com/textures/download/2k_stars_milky_way.jpg
    - Planetas, sol y luna:
      - https://www.solarsystemscope.com/textures/download/2k_sun.jpg
      - https://www.solarsystemscope.com/textures/download/2k_mercury.jpg
      - https://www.solarsystemscope.com/textures/download/2k_earth_daymap.jpg
      - https://www.solarsystemscope.com/textures/download/2k_mars.jpg
      - https://www.solarsystemscope.com/textures/download/2k_saturn.jpg
      - https://www.solarsystemscope.com/textures/download/2k_neptune.jpg
      - https://www.solarsystemscope.com/textures/download/2k_moon.jpg
    - Nave: https://www.pngkit.com/bigpic/u2q8a9r5u2w7a9u2/
