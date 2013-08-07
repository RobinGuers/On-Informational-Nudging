function [ out ] = R21Critical2( l2,Beta )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

temp=ones(size(l2));

a1=sqrt(Beta*l2.*(4*temp+Beta*l2));
a2=log(-2*temp-Beta*l2+a1);
out=-(Beta*l2+a1+log(4)*temp-2*a2)/(2*Beta);
end
