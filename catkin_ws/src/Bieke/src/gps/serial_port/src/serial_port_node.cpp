#include <ros/ros.h> 
      #include <serial/serial.h>  //ROS已经内置了的串口包 
      #include <std_msgs/String.h> 
      #include <std_msgs/Empty.h>
   int cou=0;     
      #include <string>
      #include <unistd.h>
      serial::Serial ser; //声明串口对象 
      //回调函数 
      void write_callback(const std_msgs::String::ConstPtr& msg) 
      { 
 //     ROS_INFO_STREAM("Writing to serial port" <<msg->data); 
      ser.write(msg->data);   //发送串口数据 
      } 
      int main (int argc, char** argv) 
      { 
      //初始化节点 
      ros::init(argc, argv, "serial_example_node"); 
      //声明节点句柄 
      ros::NodeHandle nh; 
      //订阅主题，并配置回调函数 
      ros::Subscriber write_sub = nh.subscribe("write", 1, write_callback); 
      //发布主题 
      ros::Publisher readw_pub = nh.advertise<std_msgs::String>("read_j", 1);
      ros::Publisher readj_pub = nh.advertise<std_msgs::String>("data_gps", 1); 
      try  
      { 
      //设置串口属性，并打开串口 
      sleep(5);
      ser.setPort("/dev/ttyUSB1"); 
      ser.setBaudrate(115200); 
      serial::Timeout to = serial::Timeout::simpleTimeout(1000); 
      ser.setTimeout(to); 
      ser.open(); 
     
      } 
      catch (serial::IOException& e) 
      { 
      ROS_ERROR_STREAM("Unable to open port "); 
      return -1; 
      } 
      //检测串口是否已经打开，并给出提示信息 
      if(ser.isOpen()) 
      { 
      ROS_INFO_STREAM("Serial Port initialized"); 
      } 
      else 
      { 
      return -1; 
      } 
      //指定循环的频率 
      ros::Rate loop_rate(10); 
      while(ros::ok()) 
      { 
     // std::cout<<"1"<<std::endl;
      if(ser.available()){ 
 
     // ROS_INFO_STREAM("Reading from serial port\n"); 
      std_msgs::String result;
      std_msgs::String result_part1;
      std_msgs::String result_part2;
      std_msgs::String jing;
      std_msgs::String wei;
      std_msgs::String gao;
      double mark_j,mark_w,mark_h;
     // serialPort::radar_data result1; 
      result.data = ser.read(ser.available()); 
    //  char buf[2000];
    //  strcpy(buf,result.data.c_str());
   
      double mark= result.data.find("GPNAV");
      if(result.data.length()>10&&mark<1000)
    { result_part1.data= result.data.substr(mark,100);//复制result.data从mark位到100位的字符串
       result_part2.data=result_part1.data.substr(1);
      mark_j=result_part2.data.find(","); 
      mark_j++;
      result_part2.data=result_part2.data.substr(1);
      mark_j=result_part2.data.find(",");
      jing.data=result_part2.data.substr(0,mark_j);
      mark_j++;
      result_part2.data=result_part2.data.substr(mark_j);
      mark_j=result_part2.data.find(",");
      jing.data=result_part2.data.substr(0,mark_j);
      mark_j++;
      result_part2.data=result_part2.data.substr(mark_j);
     
     mark_j=result_part2.data.find(",");
      jing.data=result_part2.data.substr(0,mark_j);
      mark_j++;
      result_part2.data=result_part2.data.substr(mark_j);
      mark_j=result_part2.data.find(",");
      jing.data=result_part2.data.substr(0,mark_j);
      mark_j++;
      result_part2.data=result_part2.data.substr(mark_j);

      mark_j=result_part2.data.find(",");
      mark_j++;
      result_part2.data=result_part2.data.substr(mark_j);
      result_part2.data=result_part2.data.substr(1);
    
      mark_j=result_part2.data.find(",");
      jing.data=result_part2.data.substr(0,mark_j);  
      mark_j++;
     result_part2.data=result_part2.data.substr(mark_j);
      mark_j=result_part2.data.find(",");
      wei.data=result_part2.data.substr(0,mark_j);
      mark_j++;
      result_part2.data=result_part2.data.substr(mark_j);
      mark_j=result_part2.data.find(",");
      gao.data=result_part2.data.substr(0,mark_j);


      
      }
      

      std::cout<<jing.data<<","<<wei.data<<","<<gao.data<<","<<std::endl;
  cou++;
   //  ROS_INFO_STREAM("Read: " << result.data); 
      gao.data="S,1:"+wei.data+":"+jing.data;
      readj_pub.publish(gao);
      readw_pub.publish(wei);  
      } 

      //处理ROS的信息，比如订阅消息,并调用回调函数  
     ros::spinOnce(); 
      loop_rate.sleep(); 
      } 
      } 


