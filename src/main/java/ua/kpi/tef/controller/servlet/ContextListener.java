package ua.kpi.tef.controller.servlet;

import ua.kpi.tef.model.DB.DBConnection;
import ua.kpi.tef.model.entity.Income;
import ua.kpi.tef.model.entity.IncomeType;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

@WebListener
public class ContextListener implements ServletContextListener {

    private Map<Integer, Income> incomes;
    private int count;
    private double sum;

    private static final String QUERY_SELECT_ALL = "SELECT\n" +
            "    income.id,\n" +
            "    income.month,\n" +
            "    income.amount,\n" +
            "    income.tax_payer,\n" +
            "    income_type.id AS type_id,\n" +
            "    income_type.tax_rate,\n" +
            "    income_type.name\n" +
            "FROM\n" +
            "    income\n" +
            "INNER JOIN income_type ON income.type = income_type.id;";

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {

        final ServletContext servletContext =
                servletContextEvent.getServletContext();

        incomes = new HashMap<>();

        servletContext.setAttribute("incomes", incomes);

        DBConnection dbConnection = new DBConnection();
        try {
            Statement statement = dbConnection.getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery(QUERY_SELECT_ALL);
            ResultSetMetaData resultSetMetaData = resultSet.getMetaData();

            count = resultSetMetaData.getColumnCount();

            while (resultSet.next()) {
                final Income income = new Income(resultSet.getInt("id"),
                        resultSet.getInt("month"),
                        resultSet.getDouble("amount"),
                        resultSet.getString("tax_payer"),
                        new IncomeType(resultSet.getInt("id"),
                            resultSet.getInt("tax_rate"),
                            resultSet.getString("name")));

                this.incomes.put(income.getId(), income);
                // System.out.println(income);

                sum += income.calculateTax();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        servletContext.setAttribute("sum", sum);
        servletContext.setAttribute("count", count);

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        //Close recourse.
        incomes = null;
    }
}
