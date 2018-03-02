package connection.pooling;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.apache.log4j.Logger;

public class JdbcDdlExample implements Cons
{
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String JDBC_DB_URL = "jdbc:mysql://localhost:3306?useSSL=false";
    static final String JDBC_USER = "root";
    static final String JDBC_PASS = "javier";
    public final static Logger logger = Logger.getLogger(JdbcDdlExample.class);
    
    public static void main(String[] args)
    {
        Connection connObj = null;
        Statement stmtOBj = null;
        try {
            Class.forName(JDBC_DRIVER);
            connObj = DriverManager.getConnection(JDBC_DB_URL, JDBC_USER, JDBC_PASS);
            stmtOBj = connObj.createStatement();
            logger.info("\n=======CREATE " + DATABASE_NAME + " DATABASE=======");           
            stmtOBj.executeUpdate(CREATE_DATABASE_QUERY);
            logger.info("\n=======DATABASE IS SUCCESSFULLY CREATED=======\n");
            logger.info("\n=======USING " + DATABASE_NAME + " DATABASE=======\n");
            stmtOBj.executeUpdate(USE_DATABASE_QUERY);
            logger.info("\n=======CREATE " + TABLE_NAME + " TABLE=======");         
            stmtOBj.executeUpdate(CREATE_TABLE_QUERY);
            logger.info("\n=======TABLE IS SUCCESSFULLY CREATED=======\n");
            logger.info("\n=======SHOW TABLE STRUCTURE=======");
            showDbTableStructure();
            logger.info("\n=======ALTER " + TABLE_NAME + " TABLE=======");
            stmtOBj.executeUpdate(ALTER_TABLE_QUERY);
            logger.info("\n=======TABLE IS SUCCESSFULLY ALTERED=======\n");
            logger.info("\n=======SHOW TABLE STRUCTURE=======");
            showDbTableStructure();
            logger.info("\n=======ALTER " + TABLE_NAME + " TABLE WITH AFTER CLAUSE=======");
            stmtOBj.executeUpdate(ALTER_TABLE_WITH_AFTER_CLAUSE_QUERY);
            logger.info("\n=======TABLE IS SUCCESSFULLY ALTERED=======\n");
            logger.info("\n=======SHOW TABLE STRUCTURE=======");
            showDbTableStructure();         
            logger.info("\n=======DROP COLUMN=======");
            stmtOBj.executeUpdate(DROP_COLUMN);
            logger.info("\n=======COLUMN IS SUCCESSFULLY DROPPED FROM THE TABLE=======\n");
            logger.info("\n=======SHOW TABLE STRUCTURE=======");
            showDbTableStructure(); 
            logger.info("\n=======DROP TABLE=======");
            stmtOBj.executeUpdate(DROP_TABLE);
            logger.info("\n=======TABLE IS SUCCESSFULLY DROPPED FROM THE DATABASE=======\n");
            logger.info("\n=======DROP DATABASE=======");
            stmtOBj.executeUpdate(DROP_DATABASE);
            logger.info("\n=======DATABASE IS SUCCESSFULLY DROPPED=======");
        } catch(Exception sqlException) {
            sqlException.printStackTrace();
        } finally {
            try {
                if(stmtOBj != null) {
                    stmtOBj.close();
                }
                if(connObj != null) {
                    connObj.close();
                }
            } catch (Exception sqlException) {
                sqlException.printStackTrace();
            }
        }
    }
 
    private static void showDbTableStructure() throws SQLException
    {
        StringBuilder builderObj = new StringBuilder();
        DatabaseMetaData metaObj = DriverManager.getConnection(JDBC_DB_URL, JDBC_USER, JDBC_PASS).getMetaData();
        ResultSet resultSetObj = metaObj.getColumns(DATABASE_NAME, null, TABLE_NAME, "%");
        builderObj.append(TABLE_NAME + " Columns Are?= (");
        while (resultSetObj.next()) {
            String columnName = resultSetObj.getString(4);
            builderObj.append(columnName).append(", ");
        }
        builderObj.deleteCharAt(builderObj.lastIndexOf(",")).deleteCharAt(builderObj.lastIndexOf(" ")).append(")").append("\n");
        logger.info(builderObj.toString());
    }
}