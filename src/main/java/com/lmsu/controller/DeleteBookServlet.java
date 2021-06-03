package com.lmsu.controller;

import com.lmsu.books.BookDAO;
import com.lmsu.books.BookDTO;
import org.apache.log4j.Logger;

import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "DeleteBookServlet", value = "/DeleteBookServlet")
public class DeleteBookServlet extends HttpServlet {
    private final String SEARCH_PAGE = "bookmanagement.jsp";
    private final String SEARCH_CONTROLLER = "SearchTitleServlet";
    static final Logger LOGGER = Logger.getLogger(LoginServlet.class);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String url = SEARCH_PAGE;

        String id = request.getParameter("pk");
        String searchVal = request.getParameter("LastSearchValue");

        try{
            BookDAO dao = new BookDAO();
            boolean result = dao.deleteBook(id);

            if(result) {
                url = "DispatchServlet" +
                        "?btAction=Search" +
                        "&txtSearchValue=" + searchVal;
            }
        } catch (SQLException ex){
            LOGGER.error(ex.getMessage());
            log("DeleteBookServlet _ SQL: " + ex.getMessage());
        } catch (NamingException ex){
            LOGGER.error(ex.getMessage());
            log("DeleteBookServlet _ Naming: " + ex.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request,response);
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }
}