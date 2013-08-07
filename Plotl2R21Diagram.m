%This code runs on Matlab 2012
close all;
clear all;
%Defining Variables
StartingPoint=-20; %Starting point of x2-x1
EndingPoint=20;% Ending point of x2-x1 for drawing the iso pi, can be modified
NumPoint=1e2; %Number of point for going from Starting point to Ending Point
Beta1=1; %Logit parameter Beta
EndingPoint1=-4/Beta1; %Ending point of x2-x1 for drawing the stability region
%, cannot be modified
X=linspace(StartingPoint,EndingPoint,NumPoint);






%Compute the boundaries of the Omega region using EndingPoint1
X1=linspace(StartingPoint,EndingPoint1,NumPoint);
Y11=R21Critical1( X1,Beta1 );
Y12=R21Critical2( X1,Beta1 );
Xc1=EndingPoint1*ones(size(X1));
%plot the boundaries of Omega region
plot(X1,Y11,X1,Y12,'Color','red','LineWidth',5);
legend('Boundaries of \Omega');
axis([StartingPoint 20 -20 20]);
hold on

%Compute the iso probability lines using EndingPoint
X2=linspace(StartingPoint,EndingPoint,NumPoint); %Range over which the iso pi are computed
NumPiPoint=9; %Number of iso probability line computed (when 9 we draw Pi from 0.1 to 0.9
Pivec=linspace(0.1,0.9,NumPiPoint);%Range of iso-Pi with their values
Ystraightglob=zeros(NumPoint,NumPiPoint);%Preallocation for speed
%This loop compute the iso pi straight line for Pi varying
for k=1:NumPiPoint
    Ystraightglob(:,k)=-Pivec(k)*X2+(1/Beta1)*log((1-Pivec(k))/(Pivec(k)));
end
%plot the iso probability
 plot(X2,Ystraightglob(:,1),X2,Ystraightglob(:,2),X2,Ystraightglob(:,3)...
     ,X2,Ystraightglob(:,4),X2,Ystraightglob(:,5),X2,Ystraightglob(:,6)...
     ,X2,Ystraightglob(:,7),X2,Ystraightglob(:,8),X2,Ystraightglob(:,9),'Color','Blue')
 %Annotate the isoprobabilities straight lines
 text(X2(end-20),Ystraightglob(end-20,1),'\leftarrow \pi_{1}=0.1','Color','Blue');
 text(X2(end-20),Ystraightglob(end-20,3),'\leftarrow \pi_{1}=0.3','Color','Blue');
 text(X2(end-20),Ystraightglob(end-20,6),'\leftarrow \pi_{1}=0.6','Color','Blue');
 text(X2(end-20),Ystraightglob(end-20,9),'\leftarrow \pi_{1}=0.9','Color','Blue');
 hold on

%Legend for the diagram
text(X1(end),Y11(end)+1.5,' (-4/\beta, 2/\beta)')
title('Bifurcation Diagram in l_{2}-R_{21} plane for \beta=1')
xlabel('l_{2}')
ylabel('R_{21}')
