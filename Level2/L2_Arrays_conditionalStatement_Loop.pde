import java.util.*;
String [] str;
int [] a;
int num;
void setup(){
  int i;
  num=5;
  a=new int[num];
  
  for(i=0;i<num;i++){
    a[i]=i*2+1;
  }
  for(i=num-1;i>=0;i--){
    if(a[i]>5){
      println("BigA: "+a[i]+" i: "+i);
    }
    else{
      println("SmallA: "+a[i]+" i: "+i);
    }
  }
  if(num<7){
    num++;
    println("num: "+num);
  }
  while(num<10)
    num++;
    
  str=new String[num];
  for(i=0;i<num;i++){
    str[i]="abc"+i;
  }
  for(i=0;i<num;i++){
   println(str[i]); 
  }
  
  do{
    num--;
    println("num: "+num);
  }
  while(num>5);
}

void draw(){
  
}
