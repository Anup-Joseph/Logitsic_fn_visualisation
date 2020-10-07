clear all; close all;
xvalues=[];


for r = 0:0.0001:4
    xold = 0.5;
    for i=1:2000
        xnew = (xold-xold^2)*r;
        xold = xnew;
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
for i=2:length(xvalues)-1
    xvalues(3,i-1)=xvalues(2,i);
end

    

plot(xvalues(1,:),xvalues(2,:),'.')
xlabel('growth rate(r)');
ylabel('x');
