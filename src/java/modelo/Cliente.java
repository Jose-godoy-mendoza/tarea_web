/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author joseg
 */
public class Cliente extends Persona{
    private String nit;
    Conexion cn;

    public Cliente() {    }

    public Cliente(String nit, int id, String nombres, String apellidos, String direccion, String telefono, String fecha_nacimiento) {
        super(id, nombres, apellidos, direccion, telefono, fecha_nacimiento);
        this.nit = nit;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }
    
    @Override
    public int eliminar()
    {
        int valor=0;
        try
        {
            cn = new Conexion();
            String query="delete from clientes where id_clientes=?";
            cn.abrir_conexion();
            PreparedStatement parametro=(PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId());
            
            valor=parametro.executeUpdate();
            
            cn.cerrar_conexion();
        }catch(Exception ex)
        {
            
        }
        
        
        return valor;
    }
    
    
    @Override
    public int modificar()
    {
        int valor=0;
        try
        {
            cn = new Conexion();
            String query="update clientes set nit=?,nombres=?,apellidos=?,direccion=?,telefono=?,fecha_nacimiento=? where id_clientes=?";
            cn.abrir_conexion();
            PreparedStatement parametro=(PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setString(1, getNit());
            parametro.setString(2, getNombres());
            parametro.setString(3, getApellidos());
            parametro.setString(4, getDireccion());
            parametro.setString(5, getTelefono());
            parametro.setString(6, getFecha_nacimiento());
            parametro.setInt(7, getId());
            
            valor=parametro.executeUpdate();
            
            cn.cerrar_conexion();
        }catch(Exception ex)
        {
            
        }
        
        
        return valor;
    }
    
    @Override
    public int agregar()
    {
        int valor=0;
        try
        {
            cn = new Conexion();
            String query="Insert into clientes (nit,nombres,apellidos,direccion,telefono,fecha_nacimiento) values(?,?,?,?,?,?)";
            cn.abrir_conexion();
            PreparedStatement parametro=(PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setString(1, getNit());
            parametro.setString(2, getNombres());
            parametro.setString(3, getApellidos());
            parametro.setString(4, getDireccion());
            parametro.setString(5, getTelefono());
            parametro.setString(6, getFecha_nacimiento());
            
            valor=parametro.executeUpdate();
            
            cn.cerrar_conexion();
        }catch(Exception ex)
        {
            
        }
        
        
        return valor;
    }
    
    
    public DefaultTableModel leer_cliente()
    {
        DefaultTableModel tabla_cliente = new DefaultTableModel();
        try
        {
            cn= new Conexion();
            String query="SELECT id_clientes as id, nit, nombres, apellidos, direccion, telefono, fecha_nacimiento from clientes;";
            cn.abrir_conexion();
            ResultSet consulta=cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[]={"id","nit","nombres","apellidos","direccion","telefono","nacimiento"};
            tabla_cliente.setColumnIdentifiers(encabezado);
            String datos[]= new String[10];
            while(consulta.next())
            {
                datos[0]=consulta.getString("id");
                datos[1]=consulta.getString("nit");
                datos[2]=consulta.getString("nombres");
                datos[3]=consulta.getString("apellidos");
                datos[4]=consulta.getString("direccion");
                datos[5]=consulta.getString("telefono");
                datos[6]=consulta.getString("fecha_nacimiento");
                tabla_cliente.addRow(datos);
            }
            
            cn.cerrar_conexion();
        }catch(Exception ex)
        {
            
        }
        
        
        return tabla_cliente;
    }
    
}
