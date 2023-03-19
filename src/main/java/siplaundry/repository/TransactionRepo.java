package siplaundry.repository;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import siplaundry.Entity.UserEntity;
import siplaundry.Entity.transactionsEntity;
import siplaundry.Util.DatabaseUtil;
import siplaundry.data.LaundryStatus;
import siplaundry.data.PaymentStatus;

public class TransactionRepo extends Repo<transactionsEntity> {

    private final static String tableName = "transactions";
    private static String getid = "transaction_id";

    public Integer add(transactionsEntity trans) {
        String sql = "INSERT INTO "+ tableName +" (`transaction_date`, `pickup_date`, `status`, `payment_status`, `amount`, `user_id`, `customer_id`) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try(PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            stmt.setDate(1, new Date(trans.gettransactionDate().getTime()));
            stmt.setDate(2, new Date(trans.getpickupDate().getTime()));
            stmt.setString(3, trans.getstatus().toString());
            stmt.setString(4, trans.getPaymentStatus().toString());
            stmt.setInt(5, trans.getamount());
            stmt.setInt(6, trans.getUserID().getID());
            stmt.setInt(7, trans.getCustomerID().getid());
 
            if (trans.getCustomerID() == null) {
                stmt.setNull(3, Types.DATE);
            } else {
                stmt.setDate(2, new Date(trans.getpickupDate().getTime()));
            }
            stmt.executeUpdate();

            ResultSet rs = stmt.getGeneratedKeys();
            if(rs.next())
            return rs.getInt(1);
        } catch(SQLException e) { e.printStackTrace(); }

        return 0;
    }

    public List<transactionsEntity> get() {
       return super.getAll(tableName);
    }

    public transactionsEntity get(Integer id) {
        return super.get(tableName, getid, id);
    }

    public List<transactionsEntity> get(Map<String, Object> values) {
       return super.get(tableName, values);
    }

    public List<transactionsEntity> search(Map<String, Object> values) {
        return super.search(tableName, values);
    }

    public List<transactionsEntity> searchByUser(UserEntity user, Map<String, Object> values) {
        int iterate = 0;
        String sql = "SELECT * FROM "+ tableName +" WHERE (";
        List<transactionsEntity> transactions = new ArrayList<>();

        for(String valueKey: values.keySet()) {
            if(iterate > 0) sql += " OR ";
            sql += valueKey +" LIKE CONCAT( '%',?,'%')";

            iterate++;
        }

        sql += ") AND user_id = ?";

        try(PreparedStatement stmt = conn.prepareStatement(sql)) {
            DatabaseUtil.prepareStmt(stmt, values);
            stmt.setInt(values.keySet().size() + 1, user.getID());
            ResultSet rs = stmt.executeQuery();

            while(rs.next()) {
                System.out.println("search" + stmt.toString());
                transactions.add(mapToEntity(rs));
            }
        }catch(SQLException e) {}

        return transactions;
    }

    public boolean Update(transactionsEntity trans) {
        String sql = "UPDATE " + tableName
        + " SET transaction_date = ?, pickup_date = ?, status = ?, payment_status = ?, amount = ?, user_id = ?, customer_id = ? WHERE transaction_id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setDate(1, new Date(trans.gettransactionDate().getTime()));
            stmt.setDate(2, new Date(trans.getpickupDate().getTime()));
            stmt.setString(3, trans.getstatus().toString());
            stmt.setString(4, trans.getPaymentStatus().toString());
            stmt.setInt(5, trans.getamount());
            stmt.setInt(6, trans.getUserID().getID());
            stmt.setInt(7, trans.getCustomerID().getid());
            stmt.setInt(8, trans.getid());

            stmt.executeUpdate();

            return stmt.getUpdateCount() > 0;
        } catch (SQLException e) {
            e.printStackTrace();    
        }

        return false;
    }

    public boolean delete(int id) {
        return super.delete(tableName, getid, id);
    }

   
    public transactionsEntity mapToEntity(ResultSet result) throws SQLException {
        int custId = result.getInt("customer_id");
        int userId = result.getInt("user_id");

        transactionsEntity transaction = new transactionsEntity(
                result.getDate("transaction_date"),
                result.getDate("pickup_date"),
                LaundryStatus.valueOf(result.getString("status")),
                PaymentStatus.valueOf(result.getString("payment_status")),
                result.getInt("amount"),
                new UsersRepo().get(userId),
                new CustomerRepo().get(custId));

        transaction.setid(result.getInt("transaction_id"));
        return transaction;
    }


    
}
