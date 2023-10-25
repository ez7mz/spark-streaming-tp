package exercise3

import org.apache.spark.storage.StorageLevel
import org.apache.spark.streaming.receiver.Receiver

class DatabaseReceiver(jdbcUrl: String, connectionProperties: java.util.Properties)
  extends Receiver[String](StorageLevel.MEMORY_ONLY) {

  override def onStart(): Unit = ???
  override def onStop(): Unit = ???

}
