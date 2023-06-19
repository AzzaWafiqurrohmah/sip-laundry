package siplaundry.view.cashier;

import java.io.IOException;

import javafx.fxml.FXMLLoader;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.BorderPane;
import siplaundry.controller.cashier.RetardController;

public class RetardView extends AnchorPane{
    
    public RetardView(BorderPane shadowRoot) throws IOException{
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/pages/cashier/retard.fxml"));

        loader.setRoot(this);
        loader.setController(new RetardController(shadowRoot));
        loader.load();
    }

}
