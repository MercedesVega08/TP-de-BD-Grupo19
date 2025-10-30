import java.util.Scanner;

public class InterfaceConsola{

    private Scanner scan; 

    public InterfaceConsola(){
        scan = new Scanner(System.in);
    }

    public void iniciar(){
        int opcion = -1;
        while(opcion != 10){
            mostrarMenu();
            opcion = leerOpcion();
            ejecutarOpcion(opcion);
        }
        System.out.println("See you later");
    }

    private void mostrarMenu(){
        System.out.println("\n ¡BIENVENIDO AL MENU PRINCIPAL!!!!!!!!!!!");
        System.out.println("Presione 1 para insertar un usuario a la BD");
        System.out.println("Presione 2 para eliminar un reclamo de la BD");
        System.out.println("Presione 3 para eliminar un listar los reclamos con la cantidad de rellamadas");
        System.out.println("Presione 10 para salir del menu e ir a ponernos un 10 :D");
    }

    private int leerOpcion(){
        try{
            return Integer.parseInt(scan.nextLine());
        }catch(NumberFormatException e){
            System.out.println("Opcion invalida, por el momento solo existen 1, 2, 3 y 10");
            return -1;
        }
    }

    private void ejecutarOpcion(int op){
        if(op == 1) insert();
        else if(op == 2) eliminar();
        else if(op == 3) listar();
        else if(op == 10) {};
    }

    private void insert(){
        System.out.println("Ingrese el id del usuario: ");
        int id = Integer.parseInt(scan.nextLine());
        System.out.println("Ingrese el telefono del usuario: ");
        int tel = Integer.parseInt(scan.nextLine());
        System.out.println("Ingrese la direccion del usuario: ");
        String dir = scan.nextLine();
        AccionesBD.insertUsuario(id, tel, dir);
    }

    private void eliminar(){
        System.out.println("Ingrese el nro del reclamo que desee eliminar: ");
        int nro = Integer.parseInt(scan.nextLine());
        AccionesBD.eliminarReclamo(nro);
    }

    private void listar(){
        System.out.println("Ingrese el id del usuario del que desee obtener la lista: ");
        int id = Integer.parseInt(scan.nextLine());
        AccionesBD.listar(id);
    }
}
