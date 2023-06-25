# Optimización del rendimiento en las aplicaciones web de Flutter con sacudidas de árboles y carga diferida

Para obtener la mejor experiencia de usuario, es importante que una aplicación se cargue rápido. El tiempo de carga inicial de una aplicación web Flutter se puede mejorar minimizando su paquete de JavaScript. El compilador de Dart incluye características como la agitación de árboles y la carga diferida, las cuales minimizan el paquete de JavaScript.

## Sacudida del árbol
Al compilar una aplicación web Flutter, el `dart2js` compilador genera el paquete de JavaScript. Una versión de lanzamiento tiene el nivel más alto de optimización, lo que incluye la agitación de su código. La agitación de árboles es el proceso de eliminar el código muerto, al incluir solo el código que se garantiza que se ejecutará.

Esto significa que no necesita preocuparse por el tamaño de las bibliotecas incluidas en su aplicación porque las clases o funciones no utilizadas se excluyen del paquete de JavaScript compilado.

### Ejemplo
Para ver el temblor de los árboles en acción:

Crea un archivo Dart `greeter.dart`:

```
abstract class Greeter {
    String greet(String name);
}

class EnglishGreeter implements Greeter {
    String greet(String name) => 'Hello $name!';
}

class SwedishGreeter implements Greeter {
    String greet(String name) => 'Hej $name!';
    
void main() {
    print(EnglishGreeter().greet('World'));
}
```
