package ua.kpi.tef.controller.servlet;

import ua.kpi.tef.model.entity.Income;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class Servlet extends HttpServlet {

    private Map<Integer, Income> incomes;
    private double sum;
    private int count;

    @Override
    public void init() throws ServletException {

        final Object incomes = getServletContext().getAttribute("incomes");
        final Object sum = getServletContext().getAttribute("sum");
        final Object count = getServletContext().getAttribute("count");

        if (incomes == null || !(incomes instanceof HashMap)) {

            throw new IllegalStateException("Your repo doesn't initialize!");
        } else {
            this.incomes = (HashMap<Integer, Income>) incomes;
            this.sum = (Double) sum;
            this.count = (Integer) count;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setAttribute("incomes", incomes.values());
        req.setAttribute("sum", sum);
        req.setAttribute("count", count);
        req.getRequestDispatcher("/view/index.jsp").forward(req, resp);
    }
}

