package siplaundry.entity;

public class TransactionDetailEntity extends Entity {
    public static String tableName = "transaction_details";

    private TransactionEntity transaction_id;
    private LaundryEntity laundry_id;
    private int qty;

    public TransactionDetailEntity() {
    }

    public TransactionDetailEntity(TransactionEntity transaction, LaundryEntity laundry_id, int qty) {
        this.transaction_id = transaction;
        this.laundry_id = laundry_id;
        this.qty = qty;
    }

    public TransactionEntity getTransactionID() {
        return transaction_id;
    }

    public void setTransactionID(TransactionEntity transaction) {
        this.transaction_id = transaction;
    }

    public LaundryEntity getLaundry_id() {
        return laundry_id;
    }

    public void setLaundry_id(LaundryEntity laundry_id) {
        this.laundry_id = laundry_id;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

}