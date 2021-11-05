package postgreSQL;
// Задание: Наполнить таблицу Employees в БД PostgreSQL 70 строками

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class EmployeesInsertNames {
    public static void main(String[] args) {
        //Загружаем драйвер
        try {
            Class.forName ("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace ();
        }
        //Получаем файл со свойствами
        File fileDB = new File ("src/main/resources/db.properties");
        //Создаем объект Properties и загружаем в него данные из файла
        Properties propertiesDB = new Properties ();
        try {
            propertiesDB.load (new FileReader (fileDB));
        } catch (IOException e) {
            e.printStackTrace ();
        }
        try {
            //Устанавливаем соедиенение
            Connection conn = DriverManager.getConnection (propertiesDB.getProperty ("URL"),
                    propertiesDB.getProperty ("USER"), propertiesDB.getProperty ("PWD"));

            //Создаем объект запроса
            Statement stmt = conn.createStatement ();


            //Получаем файл со свойствами
            File file = new File ("src/main/resources/employees.properties");
            //Создаем объект Properties и загружаем в него данные из файла
            Properties properties = new Properties ();
            try {
                properties.load (new FileReader (file));
            } catch (IOException e) {
                e.printStackTrace ();
            }
            //проходимся по всем ключам и наполняем таблицу Employees 70 строками
            for (String key : properties.stringPropertyNames ()) {
                String sqlCommand = "insert into employees (id, employee_name) values (default, '"
                        + properties.getProperty (key) + "')";
                stmt.executeUpdate (sqlCommand);
            }

            //Закрываем соединение
            stmt.close ();
        } catch (SQLException e) {
            e.printStackTrace ();
        }

    }
}
