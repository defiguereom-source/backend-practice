public class hello_world {

    public static void main(String[] args) {
        
        System.out.println("Hello, World!");

        // Esto es un comentario de una sola linea
        
        /*
         * Esto es un comentario de varias lineas
         * que puede ocupar mas de una linea
        */

        String mystring = "Hello, World!"; 
        mystring = "Hello, Java!";
        System.out.println(mystring);

        int mynumber = 42;
        System.out.println(mynumber);

        double mydouble = 3.14;
        System.out.println(mydouble);

        Integer myInteger = null;
        System.out.println(myInteger);

        // Condicionales
        if (myInteger != null){
            System.out.println("El numero es: " + myInteger);
        }
        else {
            System.out.println("El numero es null");
        }

        // Arrays
        int[] myArray = {1, 2, 3, 4, 5};
        System.out.println(myArray[0]);

        // Bucles
        for (int i = 0; i < myArray.length; i++) {
            System.out.println(myArray[i]);
        }

        int i = 0;

        while (i < myArray.length) {
            System.out.println(myArray[i]);
            i++;   
        }

    }

} 