package siplaundry.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import siplaundry.Entity.TransactionDetailEntity;
import siplaundry.Util.DatabaseUtil;

public class TransactionDetailsRepo extends Repo<TransactionDetailEntity> {

    final Connection conn = DatabaseUtil.getConnection();
    private static String tableName = TransactionDetailEntity.tableName;


    public Integer add(TransactionDetailEntity detail) {
        String sql = "INSERT INTO "+ tableName +" (`transaction_id`, `laundry_id`, `qty`) VALUES (?, ?, ?)";

        try(PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, detail.getTransactionID().getid());
            stmt.setInt(2, detail.getLaundry_id().getid());
            stmt.setInt(3, detail.getQty());

            stmt.executeUpdate();
            return 1;
        } catch(SQLException e) { e.printStackTrace(); }

        return 0;
    }

    public List<TransactionDetailEntity> get() {
        return super.getAll(tableName);
    }

    public List<TransactionDetailEntity> get(Map<String, Object> values) {
        return super.get(tableName, values);
    }

    public List<TransactionDetailEntity> search(Map<String, Object> values) {
        return super.search(tableName, values);
    }

    public TransactionDetailEntity mapToEntity(ResultSet result) throws SQLException {
        int transId = result.getInt("transaction_id");
        int LaundryId = result.getInt("laundry_id");

        TransactionDetailEntity detail = new TransactionDetailEntity(
            new TransactionRepo().get(transId),
            new LaundryRepo().get(LaundryId),
            result.getInt("qty")
        );
        return detail;
    }

    
}
