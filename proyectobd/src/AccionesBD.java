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
        String sql = "select l.nro_llamada, l.nro_reclamo, count(l.nro_reclamo) from (grupo19.llamada l inner join grupo19.reclamo r on l.nro_reclamo = r.nro_reclamo) where r.id_usuario = ? group by l.nro_llamada, l.nro_reclamo";

        try(Connection con = ConexionBD.getConnection(); 
            PreparedStatement pstm = con.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery()
        ){
           while(rs.next()){
                System.out.println("Nro_llamada: " + rs.getInt("nro_llamada") +
                                    "Nro_reclamo: " + rs.getInt("nro_reclamo"));
           }
        }catch(SQLException e){
            System.out.println("X Error al listar los reclamos");
            e.printStackTrace();
        }
    }
}
