// Import SparkSession
import org.apache.spark.sql.SparkSession

// Create SparkSession
val spark = SparkSession.builder.appName("ORCExample").getOrCreate()

// Define schema
val schema = "id INT, name STRING, age INT"

// Create ORC table
spark.sql(s"CREATE TABLE orc_table ($schema) USING ORC")

// Load data into ORC table
spark.sql("INSERT INTO orc_table VALUES (1, 'John Doe', 25), (2, 'Jane Smith', 30)")

// Query data from ORC table
spark.sql("SELECT * FROM orc_table").show()