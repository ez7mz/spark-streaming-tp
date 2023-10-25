package exercise3

class DatabaseConnector {
  private val jdbcUrl = "jdbc:mysql://localhost:3306/salesDB"
  private val connectionProperties = new java.util.Properties()

  //getter for the JDBC URL
  def getJdbcUrl: String = {
    jdbcUrl
  }

  // set connection properties
  def setConnectionProperties(user: String, password: String): Unit = {
    connectionProperties.put("user", user)
    connectionProperties.put("password", password)
  }

  //getter for the connection properties
  def getConnectionProperties: java.util.Properties = {
    connectionProperties
  }
}
