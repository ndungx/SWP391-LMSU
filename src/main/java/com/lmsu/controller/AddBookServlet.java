package com.lmsu.controller;

import com.lmsu.books.BookDAO;
import com.lmsu.utils.ImageHelpers;
import org.apache.log4j.Logger;
import org.apache.commons.io.FilenameUtils;

import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;

import java.sql.SQLException;


@WebServlet(name = "AddBookServlet", value = "/AddBookServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class AddBookServlet extends HttpServlet {
    private final String SEARCH_CONTROLLER = "SearchTitleServlet";
    private final String SHOW_BOOK_CONTROLLER = "ShowBookServlet";
    //    private final String SEARCH_CONTROLLER = "SearchTitleServlet";
    static final Logger LOGGER = Logger.getLogger(AddBookServlet.class);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //String book_id, String title, String author_id, String subject_id,
        //                           String publisher, String publication_date, String description, BigDecimal price, int quantity,
        //                           boolean delete_status, Date last_lent_date, float avg_rating, String isbn_ten,
        //                           String isbn_thirteen

        String searchVal = request.getParameter("txtSearchValue");

        String title = request.getParameter("txtTitle");
        String authorID = request.getParameter("txtAuthorID");
        String subjectID = request.getParameter("txtSubjectID");
        String publisher = request.getParameter("txtPublisher");
        String publishDate = request.getParameter("txtPublishDate");
        String description = request.getParameter("txtDescription");
        String price = request.getParameter("txtPrice");
        String quantity = request.getParameter("txtQuantity");
        String isbnTen = request.getParameter("txtISBNTen");
        String isbnThirteen = request.getParameter("txtISBNThirteen");

        String url = SHOW_BOOK_CONTROLLER;

        try {
            BookDAO dao = new BookDAO();
            int bookID = 0;
            do {
                bookID++;
            } while (dao.checkBookId(String.valueOf(bookID)));

            String bookIDTxt = String.valueOf(bookID);

            boolean deleteStatus = false;
            BigDecimal priceDecimal = new BigDecimal(price);
            int quantityNum = Integer.parseInt(quantity);
            Date lastLentDate = Date.valueOf("1960-01-01");
            float avgRating = 0.0f;
            //Start to add img to server process
            String uploadPath= ImageHelpers.getPathImgFolder(getServletContext().getRealPath(""));
            String fileName="";
            for (Part part : request.getParts()) {
                fileName = part.getSubmittedFileName();
                if (!(fileName == null || fileName.trim().isEmpty())) {
                    System.out.println(fileName);
                    fileName="book-" + bookIDTxt + "." + FilenameUtils.getExtension(fileName);
                    part.write(uploadPath + fileName);
                    break;
                }
            }
            boolean result = dao.addBook(bookIDTxt, title, authorID, subjectID, publisher, publishDate, description, priceDecimal, quantityNum, deleteStatus, lastLentDate, avgRating, isbnTen, isbnThirteen, fileName);
            if (result) {
                if (searchVal == null || searchVal.trim().isEmpty()) {
                    url = SHOW_BOOK_CONTROLLER;
                } else {
                    url = SEARCH_CONTROLLER;
                }
            }
//            if (!result) {
//                url = "DispatchServlet" +
//                        "?btAction=SearchBook" +
//                        "&txtSearchValue=" + searchVal;
//            }

        } catch (SQLException ex) {
            LOGGER.error(ex.getMessage());
            log("AddBookServlet _ SQL: " + ex.getMessage());
        } catch (NamingException ex) {
            LOGGER.error(ex.getMessage());
            log("AddBookServlet _ Naming: " + ex.getMessage());
        } catch (Exception ex) {
            LOGGER.error(ex.getMessage());
            log("AddBookServlet _ Exception: " + ex.getMessage());
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
