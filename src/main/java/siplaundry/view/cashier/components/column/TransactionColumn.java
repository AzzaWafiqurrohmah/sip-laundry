package siplaundry.view.cashier.components.column;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.function.Consumer;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.CheckBox;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.text.Text;
import siplaundry.data.LaundryStatus;
import siplaundry.data.PaymentStatus;
import siplaundry.entity.TransactionEntity;
import siplaundry.repository.TransactionRepo;
import siplaundry.view.admin.components.modal.ConfirmDialog;
import siplaundry.view.invoice.InvoiceDetailView;
import toast.Toast;
import toast.ToastType;

public class TransactionColumn extends HBox {
    @FXML
    private Text txt_date, txt_custName, txt_amount;

    @FXML
    private Text txt_status, txt_payment, txt_transName;

    @FXML
    private HBox payment_background, status_background, edit_btn, detail_btn;

    private String payment = "Belum Lunas";
    private String status = "Diproses";

    private TransactionEntity trans;
    private TransactionRepo transRepo = new TransactionRepo();
    private BorderPane shadowRoot, parentRoot;
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/YYYY");
    private Consumer<List<TransactionEntity>> refreshTable;

    public TransactionColumn(BorderPane parentRoot ,BorderPane shadowRoot, Consumer<List<TransactionEntity>> refreshTable, TransactionEntity trans){
        this.trans = trans;
        this.shadowRoot = shadowRoot;
        this.parentRoot = parentRoot;
        this.refreshTable = refreshTable;

        FXMLLoader loader = new FXMLLoader(getClass().getResource("/pages/cashier/transaction/column.fxml"));

        loader.setRoot(this);
        loader.setController(this);

        try { loader.load(); } 
        catch(IOException e) { e.printStackTrace(); }
    }

    @FXML
    void initialize(){
        setPaymentColor();
        setStatusColor();

        txt_date.setText(dateFormat.format(trans.gettransactionDate()));
        txt_custName.setText(trans.getCustomerID().getname());
        txt_amount.setText(String.valueOf(trans.getamount()));
        txt_payment.setText(payment);
        txt_status.setText(status);
        txt_transName.setText("Transaksi#" + trans.getid());

        detail_btn.setOnMouseClicked(event -> {
            parentRoot.setCenter(new InvoiceDetailView(parentRoot, shadowRoot, trans));
        });

    }

    void setPaymentColor(){
        if(trans.getPaymentStatus() == PaymentStatus.instalment){
            payment = "Cicilan";
            txt_payment.setStyle("-fx-fill: #feb74d;");
            payment_background.setStyle(payment_background.getStyle() + "-fx-background-color: #fff4e5;");
        }else if(trans.getPaymentStatus() == PaymentStatus.paid){
            payment = "Lunas";
            txt_payment.setStyle("-fx-fill: #6A9A98;");
            payment_background.setStyle(payment_background.getStyle() + "-fx-background-color: #f0f4f4;");
        }
    }

    void setStatusColor(){
        if(trans.getstatus() == LaundryStatus.finish){
            status = "Selesai";
            txt_status.setStyle("-fx-fill: #feb74d;");
            status_background.setStyle(status_background.getStyle() + "-fx-background-color: #fff4e5;" );
        } else if(trans.getstatus() == LaundryStatus.taken){
            status = "Diambil";
            txt_status.setStyle("-fx-fill: #6A9A98;");
            status_background.setStyle(status_background.getStyle() + "-fx-background-color: #f0f4f4;");
        } else if(trans.getstatus() == LaundryStatus.canceled) {
            status = "Dibatalkan";
            txt_status.setStyle("-fx-fill: #f45050;");
            status_background.setStyle(status_background.getStyle() + "-fx-background-color: #fef4f4;");
        }
    }
}
