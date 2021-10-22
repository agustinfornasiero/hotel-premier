package app;

import javax.swing.JFrame;
import javax.swing.WindowConstants;
import interfaces.MenuPrincipal;
import util.HibernateUtil;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class App {
	public static void main(String[] args) {
		JFrame ventana = new JFrame();
		ventana.addWindowListener(
				new WindowAdapter()
				{
					@Override
					public void windowClosing(WindowEvent windowEvent)
					{
						HibernateUtil.closeSession();
					}
				}
		);
		ventana.setTitle("Hotel Premier"); 
		ventana.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
		ventana.setContentPane(new MenuPrincipal(ventana));
		ventana.pack();
		ventana.setVisible(true);
	}
}