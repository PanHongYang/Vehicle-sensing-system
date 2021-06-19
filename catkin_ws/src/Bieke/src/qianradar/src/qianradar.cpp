#include <ros/ros.h> 
#include <string>
#include <math.h>
#include <std_msgs/String.h>
#include <std_msgs/Int32.h>
#include <canfd_msgs/Frame.h>
#include <visualization_msgs/MarkerArray.h>
#include <math.h>
#define PI 3.1415926535898 

  //ros::Publisher pub;
  ros::Publisher qian_pub;
  std_msgs::String ss;
  ros::Publisher m_targetTopicPublisher;
  visualization_msgs::MarkerArray markerArr;
using namespace std;
void convert_callback(const canfd_msgs::Frame::ConstPtr& msg) 
    {

      if(msg->id==0x610)
     {
        
         visualization_msgs::Marker points;
         markerArr.markers.clear();
         float v,angle,r;
         int sum0 =msg->data[0];
         int tarID =sum0 & 0x1F;//目标ID
         int sum1 =msg ->data[1],sum2=msg ->data[2],sum3=msg ->data[3],sum4 =msg ->data[4],sum5 =msg ->data[5],sum6 =msg ->data[6],sum7 =msg ->data[7];
         int a = (sum2&0x03)<<8;
         int b = sum1+a;
         v = 0.1*b;//目标速度
         int c =sum5<<3;
         int d = (sum4 &0xE0)>>5;
         angle =(c+d)*0.1;//目标角度
         if(angle>102.4)
          {
             angle=angle-204.8;
          } 
      
         int f =sum7<<8;
         r= (sum6+f )*0.1;//目标距离
         int p1=(sum2&0xE0)>>5;
         int p2= sum3<<3;
         int p3 =(sum4&0x1F)<<11;
         int power =(p1+p2+p3);//目标能量
                                                   
         
         points.header.frame_id="/qian_radar";
         points.header.stamp=ros::Time::now();
         points.ns="qian_radar";
         points.id=tarID;
         points.action =visualization_msgs::Marker::ADD;
         points.type=visualization_msgs::Marker::SPHERE;//设置标记类型
         points.pose.orientation.x = 0.0;
         points.pose.orientation.y = 0.0;
         points.pose.orientation.z = 0.0;
         points.pose.orientation.w = 1.0;
         points.scale.x = 0.2;
         points.scale.y = 0.2;
         points.scale.z = 0.2;
         points.color.r = 241;
         points.color.g = 158;
         points.color.b = 194;
         points.color.a = 1.f;
         points.lifetime = ros::Duration(0.1);
     
             
          if (r >0&&r<15&&power>2000)
          {
              float x,y;
              x=r*sin(angle*PI/180);
              y=r*cos(angle*PI/180)+2.63;
              points.pose.position.x=r*sin(angle*PI/180);
              points.pose.position.y=r*cos(angle*PI/180)+2.63;
              points.pose.position.z= -0;
              
             ss.data="Target ID ="+std::to_string(tarID)+"   "+"V ="+std::to_string(v)+"   "+"X = "+std::to_string(x)+"   "+"Y = "+std::to_string(y);

              cout<<"  Target ID= "<<tarID<<"  "<<"V ="<<v<<"  "<<"angle = "<<angle<<"  "<<"R = "<<r<<"  "<<"Power  "<<power<<endl;
              qian_pub.publish(ss);
              markerArr.markers.push_back(points);
          }
          if (!markerArr.markers.empty())
          {
            m_targetTopicPublisher.publish(markerArr);
          }
        
  

      

     
         

    
 
    
        }
      

     
}


int main(int argc, char** argv)
{
    ros::init(argc, argv, "qianradar");
    ros::NodeHandle nh_; //定义ROS句柄
    ros::Subscriber radar; 
    m_targetTopicPublisher = nh_.advertise<visualization_msgs::MarkerArray>(
      "canfd_processor/qianradar_target", 100, true);
    radar = nh_.subscribe("can1_canfd_msg", 1000, convert_callback); 
   //pub =nh_.advertise<std_msgs::Int32>("qian_radar",10,true);
   qian_pub =nh_.advertise<std_msgs::String>("qian_radar_data",1);
    ros::spin();
}
