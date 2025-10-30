import java.sql.*;

public class AccionesBD {
    
    public static void insertUsuario(int id, int tel, String dir){
        String sql = "insert into grupo19.usuario (id_usuario, telefono, direccion) values (?, ?, ?)";
        try (Connection conexion = ConexionBD.getConnection();
            PreparedStatement pstmt = conexion.prepareStatement(sql)) {
                pstmt.setInt(1, id);
                pstmt.setInt(2, tel);
                pstmt.setString(3, dir);
                pstmt.executeUpdate();
                System.out.println("Usuario insertado correctamente");
        } catch (SQLException e){
            System.out.println("x Error al insertar el usuario");
            e.printStackTrace();
        }
    }

    public static void eliminarReclamo(int nro){
        String sql = "delete from grupo19.reclamo where nro_reclamo = ?";
        try(Connection cone = ConexionBD.getConnection(); 
            PreparedStatement pstm = cone.prepareStatement(sql) 
        ){
            pstm.setInt(1, nro);
            int filasCant = pstm.executeUpdate();

            if(filasCant > 0) 
                System.out.println("El reclamo ha sido borrado de forma exitosa");
            else 
                System.out.println("No se ha encontrado el reclamo");
        } catch(SQLException e){
            System.out.println("X Error al eliminar el reclamo");
            e.printStackTrace();
        }
        
    }

    public static void listar(int id){
        String sql = "select r.id_usuario, count(l.nro_llamada) as rellamada from (grupo19.llamada l inner join grupo19.reclamo r on l.nro_reclamo = r.nro_reclamo) where r.id_usuario = ? group by r.id_usuario";       
        int cant = 0;

        try(Connection con = ConexionBD.getConnection(); 
            PreparedStatement pstm = con.prepareStatement(sql)){

            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
        
           if(rs.next()){
                cant = rs.getInt(1);
           }
           System.out.println("Cantidad de rellamadas: " + id + ":" + cant);

        }catch(SQLException e){
            System.out.println("X Error al listar los reclamos");
            e.printStackTrace();
        }
    }
}
