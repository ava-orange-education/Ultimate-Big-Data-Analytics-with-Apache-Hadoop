
import java.io.IOException;
import org.apache.hadoop.io.*;
import org.apache.hadoop.mapreduce.*;

public class TemperatureMapper extends Mapper<LongWritable, Text, Text, IntWritable> {
    public void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {
        String[] data = value.toString().split(",");
        if (data.length == 2) {
            String city = data[0].trim();
            int temperature = Integer.parseInt(data[1].trim());
            context.write(new Text(city), new IntWritable(temperature));
        }
    }
}

