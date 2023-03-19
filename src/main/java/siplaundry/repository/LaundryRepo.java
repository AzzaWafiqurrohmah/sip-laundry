package siplaundry.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import siplaundry.Entity.LaundryEntity;
import siplaundry.Util.DatabaseUtil;

public class LaundryRepo extends Repo<LaundryEntity>{
    private final static String tableName = LaundryEntity.tableName;
    private static String getid = "laundry_id";

  
    public Integer add(LaundryEntity cust) {
        String sql = "INSERT INTO "+ tableName +" (`unit`, `cost`, `name`) VALUES (?, ?, ?)";
    
        try(PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, cust.getunit());
            stmt.setInt(2, cust.getcost());
            stmt.setString(3, cust.getname());
    
            stmt.executeUpdate();
    
            ResultSet rs = stmt.getGeneratedKeys();
            if(rs.next()) return rs.getInt(1);
        } catch(SQLException e) { e.printStackTrace(); }
    
        return 0;
    }

    public List<LaundryEntity> get() {
        return super.getAll(tableName);
    }

    public LaundryEntity get(Integer id) {
        return super.get(tableName, getid, id); 
    }

    public List<LaundryEntity> get(Map<String, Object> values) {
        return super.get(tableName, values);
    }

    public List<LaundryEntity> search(Map<String, Object> values) {
      return super.search(tableName, values);
    }

    public boolean Update(LaundryEntity cust) {
        String sql = "UPDATE "+ tableName +" SET unit = ?, cost = ?, name = ? WHERE laundry_id = ?";

        try(PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, cust.getunit());
            stmt.setInt(2, cust.getcost());
            stmt.setString(3, cust.getname());

            stmt.executeUpdate();
            return stmt.getUpdateCount() > 0;
        } catch(SQLException e) { e.printStackTrace(); }

        return false;
    }

    public boolean delete(int id) {
        return super.delete(tableName, getid, id);
    }


    public LaundryEntity mapToEntity(ResultSet result) throws SQLException {
        LaundryEntity laundry = new LaundryEntity(
            result.getString("unit"),
            result.getInt("cost"),
            result.getString("name")
        );

        laundry.setid(result.getInt("laundry_id"));
        return laundry;
    }


    
}
