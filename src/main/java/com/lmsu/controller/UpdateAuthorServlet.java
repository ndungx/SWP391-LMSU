package com.lmsu.controller;

import com.lmsu.authors.AuthorDAO;
import com.lmsu.books.BookDAO;
import com.lmsu.utils.ImageHelpers;
import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;

import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;

@WebServlet(name = "UpdateAuthorServlet", value = "/UpdateAuthorServlet")
public class UpdateAuthorServlet extends HttpServlet {

    private final String SEARCH_CONTROLLER = "SearchAuthorNameServlet";
    private final String SHOW_AUTHOR_CONTROLLER = "ShowAuthorServlet";
    //private final String SEARCH_CONTROLLER = "SearchTitleServlet";
    static final Logger LOGGER = Logger.getLogger(UpdateBookServlet.class);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = SHOW_AUTHOR_CONTROLLER;

        String authorID = request.getParameter("pk");
        String authorName = request.getParameter("txtUpdateAuthorName");
        String authorBio = request.getParameter("txtUpdateAuthorBio");

        String searchVal = request.getParameter("txtSearchValue");
        String coverFile = request.getParameter("txtCoverFile");
        System.out.println(coverFile);
        boolean check = false;

        try {
            AuthorDAO dao = new AuthorDAO();
            String uploadPath = ImageHelpers.getPathImgFolder(getServletContext().getRealPath(""));
            String fileName = "";
            for (Part part : request.getParts()) {
                fileName = part.getSubmittedFileName();
                System.out.println("Filename get from FE "+ fileName);
                if (!(fileName == null || fileName.trim().isEmpty())) {
                    fileName = "author-" + authorID + "." + FilenameUtils.getExtension(fileName);
                    part.write(uploadPath + fileName);
                    coverFile = fileName;
                    break;
                }
            }
            System.out.println(coverFile);
            boolean result = dao.updateBook(authorID, authorName, authorBio, coverFile);
            if (result) {
                if (searchVal == null || searchVal.trim().isEmpty()) {
                    url = SHOW_AUTHOR_CONTROLLER;
                } else {
                    url = SEARCH_CONTROLLER;
                }
            }
//            if (result) {
//                url = "DispatchServlet" +
//                        "?btAction=SearchBook" +
//                        "&txtSearchValue=" + SearchValue;
//            }
        } catch (SQLException ex) {

            LOGGER.error(ex.getMessage());
            log("UpdateBookServlet _ SQL: " + ex.getMessage());
        } catch (NamingException ex) {
            LOGGER.error(ex.getMessage());
            log("UpdateBookServlet _ Naming: " + ex.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
