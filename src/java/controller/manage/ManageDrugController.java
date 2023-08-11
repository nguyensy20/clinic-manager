/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manage;

import dal.DrugDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Drug;

/**
 *
 * @author vkhoa
 */
public class ManageDrugController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManageDrugController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageDrugController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        String action = request.getParameter("action");
        DrugDBContext drugContext = new DrugDBContext();
        if (action == null) {
            int pageNumber = 1;
            int pageSize = 8;
            if (request.getParameter("pageNumber") != null && !request.getParameter("pageNumber").isEmpty()) {
                pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
            }
            if (request.getParameter("pageSize") != null) {
                try {
                    int requestedPageSize = Integer.parseInt(request.getParameter("pageSize"));
                    if (requestedPageSize > 0 && requestedPageSize <= 100) {
                        pageSize = requestedPageSize;
                    } else {
                        // Nếu pageSize không nằm trong khoảng từ 1 đến 100, sẽ giữ nguyên pageSize mặc định là 10.
                        System.out.println("Invalid pageSize. Using default pageSize: " + pageSize);
                    }
                } catch (NumberFormatException e) {
                    // Nếu không thể parse được pageSize thành số, sẽ giữ nguyên pageSize mặc định là 10.
                    System.out.println("Invalid pageSize format. Using default pageSize: " + pageSize);
                }
            }

            // Truy vấn dữ liệu
            ArrayList<Drug> drugs = drugContext.pagingDrug(pageNumber, pageSize);
            request.setAttribute("drugs", drugs);

            // Tính toán số trang
            int totalItems = drugContext.getTotalItems();
            int totalPages = (int) Math.ceil((double) totalItems / pageSize);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", pageNumber);

            request.getRequestDispatcher("/view/admin/ListDrugs.jsp").forward(request, response);
        }

        if ("edit".equals(request.getParameter("action"))) {
            int drugId = Integer.parseInt(request.getParameter("id"));
            Drug drug = drugContext.get(drugId);
            request.setAttribute("drug", drug);
            request.getRequestDispatcher("/view/admin/EditDrug.jsp").forward(request, response);
        }
        if ("create".equals(request.getParameter("action"))) {
            request.getRequestDispatcher("/view/admin/EditDrug.jsp").forward(request, response);
        }
        //processRequest(request, response);
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
        DrugDBContext drugContext = new DrugDBContext();
        if ("edit".equals(request.getParameter("action"))) {
            Drug drug = new Drug();
            int drugId = Integer.parseInt(request.getParameter("id"));
            String drugName = request.getParameter("name");

            String drugUnit_Price = request.getParameter("unit_price");
            int drugPrice = Integer.parseInt(request.getParameter("price"));
            int drugQuantity_in_stock = Integer.parseInt(request.getParameter("quantity_in_stock"));
            drug.setId(drugId);
            drug.setName(drugName);
            drug.setUnit_price(drugUnit_Price);
            drug.setPrice(drugPrice);
            drug.setQuantity_in_stock(drugQuantity_in_stock);
            drugContext.update(drug);
            response.sendRedirect("/SWP391_Project/manage/drug");
        }

        if ("create".equals(request.getParameter("action"))) {
            Drug drug = new Drug();
            String drugName = request.getParameter("name").trim().toLowerCase();
            ArrayList<Drug> drugs = drugContext.list();
            boolean isDrugExist = false;
            for (Drug d : drugs) {
                if (d.getName().trim().toLowerCase().equals(drugName)) {
                    isDrugExist = true;
                    break;
                }
            }
            if (isDrugExist) {
                String messDrugExist = "Tên thuốc đã tồn tại";
                request.setAttribute("messDrugExist", messDrugExist);
                request.getRequestDispatcher("/view/admin/EditDrug.jsp").forward(request, response);
            } else {
                String drugUnit_Price = request.getParameter("unit_price");
                int drugPrice = Integer.parseInt(request.getParameter("price"));
                int drugQuantity_in_stock = Integer.parseInt(request.getParameter("quantity_in_stock"));
                drug.setName(drugName);
                drug.setUnit_price(drugUnit_Price);
                drug.setPrice(drugPrice);
                drug.setQuantity_in_stock(drugQuantity_in_stock);
                drugContext.insert(drug);
                response.sendRedirect("/SWP391_Project/manage/drug");
            }
        }

        if ("delete".equals(request.getParameter("action"))) {
            int drugId = Integer.parseInt(request.getParameter("id"));
            Drug drug = new Drug();
            drug.setId(drugId);
            drugContext.delete(drug);
            response.sendRedirect("/SWP391_Project/manage/drug");
        }

        if ("search".equals(request.getParameter("action"))) {
            String drugName = request.getParameter("searchName");
            ArrayList<Drug> drugs = drugContext.getListDrugByName(drugName);
            request.setAttribute("drugs", drugs);
            request.setAttribute("drugName", drugName);
            request.getRequestDispatcher("/view/admin/ListDrugs.jsp").forward(request, response);
        }
        // processRequest(request, response);
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
