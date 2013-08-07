function [ out ] = R21Critical1( l2,Beta)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
temp=ones(size(l2));

a1=2*l2./(Beta*l2+sqrt(Beta*l2.*(4*temp+Beta*l2)));
a2=(1/Beta)*log(-temp-(Beta/2).*l2-(1/2)*sqrt(Beta*l2.*(4*temp+Beta*l2)));
out=a1+a2;
end
