clear all; close all;
xvalues=[];


for r = 0:0.0001:4  %growth rate 
    xold = 0.5;     %initialise x value
    for i=1:2000
        xnew = (xold-xold^2)*r;     %logistic function x(n)=x(n-1)*r*(1-x(n-1))
        xold = xnew;                %since the x value settles to a single value we iterate first 2000 to dtermine that value
    end
    xss=xnew;
    for i=1:1000                        
        xnew = (xold-xold^2)*r;
        xold=xnew;                          
        xvalues(1,length(xvalues)+1)=r;
        xvalues(2,length(xvalues))=xnew;        
        if(abs(xss-xnew)<0.001)             
            break;
        end
    end
end    

plot(xvalues(1,:),xvalues(2,:),'.')
xlabel('growth rate(r)');
ylabel('x');
