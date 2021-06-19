#include <ros/ros.h> 
#include <string>
#include <math.h>
#include <cmath>
#include <std_msgs/String.h>
#include <std_msgs/Int32.h>
#include <canfd_msgs/Frame.h>
#include <visualization_msgs/MarkerArray.h>
#define  sina 0.7071067812
#define  cosa 0.7071067812

#define PI 3.1415926535898 


  ros::Publisher left_pub_tf;//发布左侧雷达跟踪数据消息
  ros::Publisher left_pub_bw;//发布左侧雷达宽带数据消息
  ros::Publisher left_pub_bn;//发布左侧雷达窄带数据消息
  ros::Publisher right_pub_tf;//发布右侧雷达跟踪数据消息
  ros::Publisher right_pub_bw;//发布右侧雷达宽带数据消息
  ros::Publisher right_pub_bn;//发布右侧雷达窄带数据消息
  std_msgs::String left_tf;//定义左侧雷达跟踪数据
  std_msgs::String left_initial_bw;//定义左侧雷达原始数据 宽带
  std_msgs::String left_initial_bn;//定义左侧雷达原始数据 窄带
  std_msgs::String right_tf;//定义左侧雷达跟踪数据
  std_msgs::String right_initial_bw;//定义左侧雷达原始数据 宽带
  std_msgs::String right_initial_bn;//定义左侧雷达原始数据 窄带
 ros::Publisher  m_targetLeftPublisher;//发布左侧标记云消息
 ros::Publisher  m_targetRightPublisher;//发布右侧标记消息
 visualization_msgs::MarkerArray leftmkArr;
  visualization_msgs::MarkerArray rightmkArr;
 
using namespace std;

//这里 王老师左右雷达安装反了 则需canid反置
void convert_callback(const canfd_msgs::Frame::ConstPtr& msg) 
{

if(msg->id==0x7D4||msg->id==0x7D2||msg->id==0x7D3)//左侧雷达canID
{
        visualization_msgs::Marker leftpoint;
      leftmkArr.markers.clear();
      if(msg->id==0x7D4)
      {
         float LBW_v0,LBW_r0,LBW_a0;
         int LBW_sum0 =msg->data[0],LBW_sum1 =msg ->data[1],LBW_sum2=msg ->data[2],LBW_sum3 =msg->data[3],LBW_sum4 =msg ->data[4],LBW_sum5 =msg ->data[5],LBW_sum6 =msg ->data[6],LBW_sum7 =msg ->data[7];
         int LBW_a = LBW_sum0<<8;
         LBW_v0 = (LBW_a+LBW_sum1)*0.308*3.6;//v
         int a1 =LBW_sum2<<8;
         LBW_a0=(a1+LBW_sum3)/5000;
         LBW_r0 = LBW_sum5*0.5063;//r
         int b1 =LBW_sum6<<8;
         int power1 =b1+LBW_sum7;//power
        
     
         if(LBW_r0>0&&LBW_r0<15&&power1>0)
        {
          
           left_initial_bw.data="LeftRadarInitial_BW: V = "+std::to_string(LBW_v0)+"Angle= "+std::to_string(LBW_a0)+"  R = "+std::to_string(LBW_r0)+" Power= "+std::to_string(power1);
           left_pub_bw.publish( left_initial_bw);
         }
         
       }
    if(msg->id==0x7D2)
      {
         float LBN_v0,LBN_r0,LBN_a0;
         int LBN_sum0 =msg->data[0],LBN_sum1 =msg ->data[1],LBN_sum2=msg ->data[2],LBN_sum3 = msg->data[3],LBN_sum4 =msg ->data[4],LBN_sum5 =msg ->data[5],LBN_sum6 =msg ->data[6],LBN_sum7 =msg ->data[7];
         int LBN_a = LBN_sum0 << 8;
         LBN_v0 = (LBN_a+LBN_sum1)*0.308*3.6;//v
        
        
         LBN_a0 = ((LBN_sum2<<8)+LBN_sum3)/5000;
         LBN_r0 = LBN_sum5*2.025;//r
         int b2 =LBN_sum6<<8;
         int power2 =b2+LBN_sum7;//power

       if(LBN_r0>0&&LBN_r0<15&&power2>0){
         left_initial_bn.data="LeftRadarInitial_BN: V = "+std::to_string(LBN_v0)+"Angle = "+std::to_string(LBN_a0)+" R = "+std::to_string(LBN_r0)+" Power= "+std::to_string(power2);
        
         
    
           left_pub_bn.publish( left_initial_bn);
        }
       }
    if(msg->id==0x7D3)
      {
  
         float lv,lx,ly;
         int lsum0 =msg->data[0],lsum1 =msg ->data[1],lsum2=msg ->data[2],lsum3=msg->data[3],lsum4 =msg ->data[4],lsum5 =msg ->data[5],lsum6 =msg ->data[6],lsum7 =msg ->data[7];
         int la = lsum0<<8;
         lv = (la+lsum1)*0.1;
         lx = lsum3*0.1;
         ly = ((lsum4<<8)+lsum5)*0.1;
         int b3 =lsum6<<8;
         int power3 =b3+lsum7;//power


         static int lid =0;

         leftpoint.header.frame_id="/leftradar";
         leftpoint.header.stamp=ros::Time::now();
         leftpoint.ns="leftradar";
         leftpoint.id=lid;
         leftpoint.action =visualization_msgs::Marker::ADD;
         leftpoint.type=visualization_msgs::Marker::SPHERE;//设置标记类型
         leftpoint.pose.orientation.x = 0.0;
         leftpoint.pose.orientation.y = 0.0;
         leftpoint.pose.orientation.z = 0.0;
         leftpoint.pose.orientation.w = 1.0;
         leftpoint.scale.x = 0.2;
         leftpoint.scale.y = 0.2;
         leftpoint.scale.z = 0.2;
         leftpoint.color.r =0;
         leftpoint.color.g = 255;
         leftpoint.color.b = 0;
         leftpoint.color.a = 1.f;
         leftpoint.lifetime = ros::Duration(0.1);
         lid++;

         if(lv < 500&&(fabs(lx))<15 &&(fabs(ly))<15 &&power3>2000)
         {
            float x,y;
            x=-(lx*sina+ly*cosa)-0.71;
            y=-(ly*sina-lx*cosa)-1.9;
            leftpoint.pose.position.x= -(lx*sina+ly*cosa)-0.71;
           leftpoint.pose.position.y =-(ly*sina-lx*cosa)-1.9;
            leftpoint.pose.position.z= 0;
           
         left_tf.data="LeftRadar:  V = "+std::to_string(lv)+"  X = "+std::to_string(x)+"   Y = "+std::to_string(y)+ " X0= "+std::to_string(lx)+" Y0= "+std::to_string(ly)+" Power= "+std::to_string(power3);
        
      
           left_pub_tf.publish(left_tf);
         leftmkArr.markers.push_back(leftpoint);   
          cout<<"Left V= "<< lv<<" X= "<<x<<" Y= "<<y<<" X0= "<<lx<<" Y0= "<<ly<<" Power "<<power3<<endl;
          }
          if (!leftmkArr.markers.empty())
          {
            m_targetLeftPublisher.publish(leftmkArr);
          }
       
        }
}
   
 if(msg->id==0x7DE||msg->id==0x7DC||msg->id==0x7D5)//右侧雷达canID
{
        
       visualization_msgs::Marker rightpoint;
       rightmkArr.markers.clear();
      if(msg->id==0x7DE)
      {
         float RBW_v0,RBW_r0,RBW_a0;
         int RBW_sum0 =msg->data[0],RBW_sum1 =msg ->data[1],RBW_sum2=msg ->data[2],RBW_sum3 =msg->data[3],RBW_sum4 =msg ->data[4],RBW_sum5 =msg ->data[5],RBW_sum6 =msg ->data[6],RBW_sum7 =msg ->data[7];
         int RBW_a = RBW_sum0<<8;
         RBW_v0 = (RBW_a+RBW_sum1)*0.308*3.6;
         RBW_a0 =((RBW_sum2<<8)+RBW_sum3)/5000;
         RBW_r0 = RBW_sum5*0.5063;
         int b4 =RBW_sum6<<8;
         int power4 =b4+RBW_sum7;//power
         
         
  
         if(RBW_r0>0&&RBW_r0<15&&power4>0)
         {
           //rightpoint.pose.position.x=-(RBW_r0*cos(RBW_a0)*sina-RBW_r0*sin(RBW_a0)*cosa);
           //rightpoint.pose.position.y=RBW_r0*sin(RBW_a0)*sina+RBW_r0*cos(RBW_a0)*cosa;
           // rightpoint.pose.position.z= 0;
          // rightmkArr.markers.push_back(rightpoint);
          right_initial_bw.data="RightRadarInitial_BW: V = "+std::to_string(RBW_v0)+" Angle = "+std::to_string(RBW_a0)+" R = "+std::to_string(RBW_r0)+" Power= "+std::to_string(power4);
           right_pub_bw.publish(right_initial_bw);
          
         }
       }
    if(msg->id==0x7DC)
      {
         
         float RBN_v0,RBN_r0,RBN_a0;
         int RBN_sum0 =msg->data[0],RBN_sum1 =msg ->data[1],RBN_sum2=msg ->data[2],RBN_sum3 = msg->data[3],RBN_sum4 =msg ->data[4],RBN_sum5 =msg ->data[5],RBN_sum6 =msg ->data[6],RBN_sum7 =msg ->data[7];
         int RBN_a = RBN_sum0<<8;
         RBN_v0 = (RBN_a+RBN_sum1)*0.308*3.6;
         RBN_a0 = ((RBN_sum2<<8)+RBN_sum3)/5000;
         RBN_r0 = RBN_sum5*2.025;
         int b5 =RBN_sum6<<8;
         int power5 =b5+RBN_sum7;//power

         if(RBN_r0>0&&RBN_r0<15&&power5>0)
         {

         right_initial_bn.data="RightRadarInitial_BN: V = "+std::to_string(RBN_v0)+" Angle = "+std::to_string(RBN_a0)+"  R = "+std::to_string(RBN_r0)+" Power= "+std::to_string(power5);
  
          right_pub_bn.publish(right_initial_bn);
        }
      }
    if(msg->id==0x7D5)
      {
         float rv,rx,ry;
         int rsum0 =msg->data[0],rsum1 =msg ->data[1],rsum2=msg ->data[2],rsum3=msg->data[3],rsum4 =msg ->data[4],rsum5 =msg ->data[5],rsum6 =msg ->data[6],rsum7 =msg ->data[7];
         int ra = rsum0<<8;
         rv = (ra+rsum1)*0.1;
         rx = rsum3*0.1;
         ry =((rsum4<<8)+rsum5)*0.1;
         int b6 =rsum6<<8;
         int power6 =b6+rsum7;//power

         static int rid =0;
         rightpoint.header.frame_id="/rightradar";
         rightpoint.header.stamp=ros::Time::now();
         rightpoint.ns="rightradar";
         rightpoint.id=rid;
         rightpoint.action =visualization_msgs::Marker::ADD;
         rightpoint.type=visualization_msgs::Marker::SPHERE;//设置标记类型
         rightpoint.pose.orientation.x = 0.0;
         rightpoint.pose.orientation.y = 0.0;
         rightpoint.pose.orientation.z = 0.0;
         rightpoint.pose.orientation.w = 1.0;
         rightpoint.scale.x = 0.2;
         rightpoint.scale.y = 0.2;
         rightpoint.scale.z = 0.2;
         rightpoint.color.r =0;
         rightpoint.color.g = 255;
         rightpoint.color.b = 0;
         rightpoint.color.a = 1.f;
         rightpoint.lifetime = ros::Duration(0.1);
         rid++;
         
         if(rv < 500&& (fabs(rx))<15 &&(fabs(ry))<15 &&power6>2000)
         {
           float x1,y1;
           x1=-(ry*sina-rx*cosa)+0.71;
           y1=rx*sina+ry*cosa-1.9;
           rightpoint.pose.position.x=-(ry*sina-rx*cosa)+0.71;
           rightpoint.pose.position.y=rx*sina+ry*cosa-1.9;
            rightpoint.pose.position.z= 0;
           
            right_tf.data="RightRadar:  V = "+std::to_string(rv)+" X = "+std::to_string(x1)+" Y = "+std::to_string(y1)+" X0= "+std::to_string(rx)+" Y0= "+std::to_string(ry)+" Power= "+std::to_string(power6);
          cout<<" Right  V= "<<rv<<" X= "<<x1<<" Y= "<<y1<<" X0= "<<rx<<" Y0= "<<ry<<" Power "<<power6<<endl;
          
          right_pub_tf.publish(right_tf);
          rightmkArr.markers.push_back(rightpoint);
        }
          if (!rightmkArr.markers.empty())
          {
            m_targetRightPublisher.publish(rightmkArr);
          }
  
       }
    
      

     
 }
}


int main(int argc, char** argv)
{
    ros::init(argc, argv, "zuoyouradar");
    ros::NodeHandle nh_; //定义ROS句柄
    ros::Subscriber radar; 
    radar = nh_.subscribe("can0_canfd_msg", 100, convert_callback); 
    m_targetLeftPublisher = nh_.advertise<visualization_msgs::MarkerArray>( "canfd_processor/leftradar_target", 100, true);
    m_targetRightPublisher = nh_.advertise<visualization_msgs::MarkerArray>( "canfd_processor/rightradar_target", 100, true);
   left_pub_tf =nh_.advertise<std_msgs::String>("left_radar_tf",1);
   left_pub_bw =nh_.advertise<std_msgs::String>("left_radar_bw",1);
   left_pub_bn =nh_.advertise<std_msgs::String>("left_radar_bn",1);
   right_pub_tf =nh_.advertise<std_msgs::String>("right_radar_tf",1);
   right_pub_bw =nh_.advertise<std_msgs::String>("right_radar_bw",1);
   right_pub_bn =nh_.advertise<std_msgs::String>("right_radar_bn",1);

    ros::spin();
}
