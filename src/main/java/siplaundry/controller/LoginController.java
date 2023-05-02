package siplaundry.controller;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.util.Duration;
import siplaundry.service.AuthService;
import tray.animations.AnimationType;
import tray.notification.NotificationType;
import tray.notification.TrayNotification;

public class LoginController {

    @FXML
    private Button BtnLogin;
    @FXML
    private TextField TxtUserName;
    @FXML
    private TextField TxtPassword;

    public void ButtonLoginAction(ActionEvent ex){
        System.out.println("Ping");
        String title = "sign in";
        String message1 = "username atau password yang anda masukkan salah";
        String message2 = "username atau password yang anda masukkan benar";

        TrayNotification tray = new TrayNotification();
        AnimationType type = AnimationType.POPUP;
        
         if(!new AuthService().login(TxtUserName.getText(), TxtPassword.getText())){
             tray.setAnimationType(type);
             tray.setTitle(title);
             tray.setMessage(message1);

             tray.setNotificationType(NotificationType.WARNING);
             tray.showAndDismiss(Duration.millis(1000));
             return;
         }

        tray.setAnimationType(type);
        tray.setTitle(title);
        tray.setMessage(message2);

        tray.setNotificationType(NotificationType.SUCCESS);
        tray.showAndDismiss(Duration.millis(3000));
    }

}