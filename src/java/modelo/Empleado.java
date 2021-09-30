/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package modelo;
import java.awt.HeadlessException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author joseg
 */
public class Empleado extends Persona{
    private String codigo;
    private int id_puesto;
    Conexion cn;

    public Empleado(){}

    public Empleado(String codigo, int id_puesto, int id, String nombres, String apellidos, String direccion, String telefono, String fecha_nacimiento) {
        super(id, nombres, apellidos, direccion, telefono, fecha_nacimiento);
        this.codigo = codigo;
        this.id_puesto = id_puesto;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public int getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(int id_puesto) {
        this.id_puesto = id_puesto;
    }
    
    
    
    
    public DefaultTableModel leer()
    {
        DefaultTableModel tabla = new DefaultTableModel();
        try
        {
            cn = new Conexion();
            String query="SELECT e.id_empleado as id,e.codigo,e.nombres,e.apellidos,e.direccion,e.telefono,e.fecha_nacimiento,p.puesto,e.id_puesto FROM db_empresa.empleados as e inner join db_empresa.puestos as p on e.id_puesto = p.id_puesto;";
            cn.abrir_conexion();
            ResultSet consulta=cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[]={"id","codigo","nombres","apellidos","direccion","telefono","nacimiento","puesto","id_puesto"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[]= new String [9];
            while(consulta.next())
            {
                datos[0] = consulta.getString("id");
            datos[1] = consulta.getString("codigo");
            datos[2] = consulta.getString("nombres");
            datos[3] = consulta.getString("apellidos");
            datos[4] = consulta.getString("direccion");
            datos[5] = consulta.getString("telefono");
            datos[6] = consulta.getString("fecha_nacimiento");
            datos[7] = consulta.getString("puesto");
            datos[8] = consulta.getString("id_puesto");
            tabla.addRow(datos);
            }
            cn.cerrar_conexion();;
        }catch(Exception ex)
        {
            System.out.println("Error:"+ex.getMessage());
        }
        return tabla;
    }
    
    
    @Override
    public int agregar()
    {
        int retorno=0;
        try
        {
            PreparedStatement parametro;
            String query="INSERT INTO `db_empresa`.`empleados`(codigo,nombres,apellidos,direccion,telefono,fecha_nacimiento,id_puesto) VALUES(?,?,?,?,?,?,?)";
            cn = new Conexion();
            cn.abrir_conexion();
            parametro=(PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setString(1, getCodigo());
            
            parametro.setString(2, getNombres());
            parametro.setString(3, getApellidos());
            parametro.setString(4, getDireccion());
            parametro.setString(5, getTelefono());
            parametro.setString(6, getFecha_nacimiento());
            parametro.setInt(7, getId_puesto());
            retorno=parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(HeadlessException | SQLException ex)
        {
            System.out.println("error........"+ex.getMessage());
        }
        
        return retorno;
    }
    
    @Override
     public int modificar()
    {
        int retorno=0;
        try
        {
            PreparedStatement parametro;
            String query="Update `db_empresa`.`empleados`set codigo=?, nombres=?, apellidos=?, direccion=?, telefono=?, fecha_nacimiento=?, id_puesto=?  where id_empleado=?";
            cn = new Conexion();
            cn.abrir_conexion();
            parametro=(PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setString(1, getCodigo());
            
            parametro.setString(2, getNombres());
            parametro.setString(3, getApellidos());
            parametro.setString(4, getDireccion());
            parametro.setString(5, getTelefono());
            parametro.setString(6, getFecha_nacimiento());
            parametro.setInt(7, getId_puesto());
            parametro.setInt(8, getId());
            retorno=parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(HeadlessException | SQLException ex)
        {
            System.out.println("error........"+ex.getMessage());
        }
        
        return retorno;
    }
     
     @Override
     public int eliminar()
    {
        int retorno=0;
        try
        {
            PreparedStatement parametro;
            String query="delete from `db_empresa`.`empleados` where id_empleado=?";
            cn = new Conexion();
            cn.abrir_conexion();
            parametro=(PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId());
            retorno=parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(HeadlessException | SQLException ex)
        {
            System.out.println("error........"+ex.getMessage());
        }
        
        return retorno;
    }
}
