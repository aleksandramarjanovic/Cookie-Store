package store;



import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;
import model.Cookie;
import model.Preuzimanje;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

@WebServlet(name = "Preuzmi", urlPatterns = {"/Preuzmi"})
public class Preuzmi extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParserConfigurationException, SAXException, TransformerException {
        
        Preuzimanje.loadData();
        response.setContentType("text/html;charset=UTF-8");
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder build = factory.newDocumentBuilder();
        Document document = build.parse("C:/Users/zivko/Desktop/moja_ponuda.xml");
             List imgUrlList = new ArrayList();
             File imageDir = new File(getServletContext().getRealPath("/images"));
             File[] files = imageDir.listFiles();
             String imageFileName;
                for (File imageFile : files) {
                    imageFileName= imageFile.getName();
                    imgUrlList.add(imageFileName);
                }
            List<Cookie> kolaci = new ArrayList<>();
            NodeList lista = document.getElementsByTagName("cookie");
                for (int i=0; i<lista.getLength(); i++){
                Element items = (Element) lista.item(i);
                int id = Integer.parseInt(items.getAttribute("id"));
                String name = items.getElementsByTagName("name").item(0).getTextContent();
                double price = Double.parseDouble( items.getElementsByTagName("price").item(0).getTextContent());
                String description = items.getElementsByTagName("description").item(0).getTextContent();
                Cookie c = new Cookie();
                c.setId(id);
                c.setName(name);
                c.setPrice(price);
                c.setDescription(description);
                kolaci.add(c);
                
            }  
               
               request.setAttribute("lista",kolaci);  
               request.setAttribute("imgUrlList", imgUrlList);
               request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParserConfigurationException ex) {
            Logger.getLogger(Preuzmi.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SAXException ex) {
            Logger.getLogger(Preuzmi.class.getName()).log(Level.SEVERE, null, ex);
        } catch (TransformerException ex) {
            Logger.getLogger(Preuzmi.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParserConfigurationException ex) {
            Logger.getLogger(Preuzmi.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SAXException ex) {
            Logger.getLogger(Preuzmi.class.getName()).log(Level.SEVERE, null, ex);
        } catch (TransformerException ex) {
            Logger.getLogger(Preuzmi.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
