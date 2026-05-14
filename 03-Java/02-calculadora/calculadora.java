import java.util.Scanner;

public class calculadora{
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);

        double num1, num2;
        int opcion;

        System.out.println("===Calculadora Java===");
        System.out.println("Ingrese el primer numero: ");
        num1 = sc.nextDouble();

        System.out.println("Ingrese el segundo numero: ");
        num2 = sc.nextDouble();

        System.out.println("Ingrese el numero de la operacion que desea realizar: ");
        System.out.println("1. Suma");
        System.out.println("2. Resta");
        System.out.println("3. Multiplicacion");
        System.out.println("4. Division");
        opcion = sc.nextInt();

        switch (opcion) {
            case 1:
                System.out.println("El resultado de la suma es: " + (num1 + num2));
                break;
            case 2:
                System.out.println("El resultado de la resta es: " + (num1 - num2));
                break;
            case 3:
                System.out.println("El resultado de la multiplicacion es: " + (num1 * num2));
                break;
            case 4:
                if (num2 != 0) {
                    System.out.println("El resultado de la division es: " + (num1 / num2));
                } else {
                    System.out.println("Error: Division por cero no permitida.");
                }
                break;
            default:
                break;
        }

        sc.close();
    }
}