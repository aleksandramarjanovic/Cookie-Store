/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

/**
 *
 * @author zivko
 */
public class Preuzimanje {

    public static void loadData() throws TransformerConfigurationException, TransformerException, ParserConfigurationException {
        try {
            Connection con = null;
            try {
                con = DriverManager.getConnection("jdbc:mysql://localhost/store?useSSL=false", "root", "vidak146");
            } catch (SQLException ex) {
                Logger.getLogger(Preuzimanje.class.getName()).log(Level.SEVERE, null, ex);
            }
            String upit = "select*from cookie_store";
            PreparedStatement stmt = null;
            try {
                stmt = con.prepareStatement(upit);
            } catch (SQLException ex) {
                Logger.getLogger(Preuzimanje.class.getName()).log(Level.SEVERE, null, ex);
            }
            ResultSet rs = stmt.executeQuery();

            Document doc = null;
            DocumentBuilderFactory dbf;
            dbf = DocumentBuilderFactory.newInstance();
            dbf.isIgnoringElementContentWhitespace();
            DocumentBuilder db = null;
            db = dbf.newDocumentBuilder();
            doc = db.newDocument();
            Element root = doc.createElement("cookies");
            doc.appendChild(root);

            while (rs.next()) {
                Element cookie = doc.createElement("cookie");
                root.appendChild(cookie);
                cookie.setAttribute("id", rs.getString("id"));
                Element name = doc.createElement("name");
                name.setTextContent(rs.getString("name"));
                cookie.appendChild(name);
                    Element price = doc.createElement("price");
                double price_at = Double.parseDouble(rs.getString("price"));
                DecimalFormat format = new DecimalFormat("#.##");
                price_at*=1.1;
                price.setTextContent(format.format(price_at));
                cookie.appendChild(price);
                Element decsc = doc.createElement("description");
                decsc.setTextContent(rs.getString("description"));
                cookie.appendChild(decsc);
               }
                DOMSource dom = new DOMSource(doc);
                StreamResult rez = new StreamResult();
                FileOutputStream bos = new FileOutputStream(new File("C:/Users/zivko/Desktop/moja_ponuda.xml"));
                rez.setOutputStream(bos);
                Transformer tr = TransformerFactory.newInstance().newTransformer();
                tr.transform(dom, rez);
                System.out.println(bos.toString());
        } catch (SQLException ex) {
            Logger.getLogger(Preuzimanje.class.getName()).log(Level.SEVERE, null, ex);
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Preuzimanje.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
