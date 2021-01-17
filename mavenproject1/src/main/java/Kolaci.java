
import com.mysql.jdbc.PreparedStatement;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class Kolaci {

    public static void main(String[] args) throws IOException {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        DocumentBuilder db;
        Document doc;
        Element root;
        int id;
        String name;
        double price;
        String description;
        try {
            db = dbf.newDocumentBuilder();
            doc = db.parse("kolaci.xml");
            root= doc.getDocumentElement();
            NodeList list = root.getElementsByTagName("cookie");
            for (int i = 0; i < list.getLength(); i++) {
                String broj= root.getElementsByTagName("cookie").item(i).getAttributes().item(0).getTextContent();
                id = Integer.parseInt(broj);
                System.out.println("id je: "+id);
                name = root.getElementsByTagName("name").item(i).getTextContent();
                System.out.println(name);
                price = Double.parseDouble(root.getElementsByTagName("price").item(i).getTextContent());
                System.out.println(price);
                description = root.getElementsByTagName("description").item(i).getTextContent();
                System.out.println(description);
                
                
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/store", "root", "vidak146");
          
                String query = " insert into store.cookie_store (id,name,price,description)"
                + " values (?, ?, ?, ?)";

                // create the mysql insert preparedstatement
                PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
                statement.setInt (1, id);
                statement.setString (2, name);
                statement.setDouble(3, price);
                statement.setString(4, description);
                
                
                
                
//                final String query = "insert into store.cookie_store (id,name,price,description) values(" + id + "," + name + "," + price + "," + "kolaci" + ")";
                 System.out.println(query);
//               PreparedStatement statement =  (PreparedStatement) con.prepareStatement(query);
                 statement.execute();
            }
         
            
         

        } catch (ParserConfigurationException | SAXException | SQLException ex) {
            Logger.getLogger(Kolaci.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
