package exercise1

import org.apache.spark._
import org.apache.spark.streaming._

/*
  $ nc -lk 5000
 */
object WordCountStream {
  def main(args: Array[String]): Unit = {
    println("Hello World")
    val conf = new SparkConf().setMaster("local[*]").setAppName("test")
    val ssc = new StreamingContext(conf, Seconds(2))

    val lines = ssc.socketTextStream("localhost", 5000)

    val words = lines.flatMap(_.split(" "))

    val tuples = words.map(word => (word, 1))

    val result = tuples.reduceByKey(_ + _)

    result.print()

    ssc.start()
    ssc.awaitTermination()


  }

}
