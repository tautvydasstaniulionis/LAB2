

x = 0.1:1/22:1;

d = (1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x)/2;


w_11=rand(1);
w_12=rand(1);
w_13=rand(1);
w_14=rand(1);
w_15=rand(1);

w_21=rand(1);
w_22=rand(1);
w_23=rand(1);
w_24=rand(1);
w_25=rand(1);


b_11=rand(1);
b_12=rand(1);
b_13=rand(1);
b_14=rand(1);
b_15=rand(1);


b_21=rand(1);


y = zeros(1,20);

for a = 1:10000

    for i = 1:20


y_1 = 1 /(1 + exp(-x(i) * w_11 - b_11));
y_2 = 1 /(1 + exp(-x(i) * w_12 - b_12));
y_3 = 1 /(1 + exp(-x(i) * w_13 - b_13));
y_4 = 1 /(1 + exp(-x(i) * w_14 - b_14));
y_5 = 1 /(1 + exp(-x(i) * w_15 - b_15));


y(i) = (y_1*w_21) + (y_2*w_22) + (y_3*w_23) + (y_4*w_24)+ (y_5*w_25) + b_21;

e(i)=d(i)-y(i);

n=0.15;

w_21= w_21+n*e(i)*y_1;
w_22= w_22+n*e(i)*y_2;
w_23= w_23+n*e(i)*y_3;
w_24= w_24+n*e(i)*y_4;
w_25= w_25+n*e(i)*y_5;

b_21= b_21+n*e(i)*1;


delta1=(y_1*(1 - y_1))*(e(i)*w_21);
delta2=(y_2*(1 - y_2))*(e(i)*w_22);
delta3=(y_3*(1 - y_3))*(e(i)*w_23);
delta4=(y_4*(1 - y_4))*(e(i)*w_24);
delta5=(y_5*(1 - y_5))*(e(i)*w_25);

w_11=w_11+n*delta1*x(i);
w_12=w_12+n*delta2*x(i);
w_13=w_13+n*delta3*x(i);
w_14=w_14+n*delta4*x(i);
w_15=w_15+n*delta5*x(i);



b_11=b_11+n*delta1;
b_12=b_12+n*delta2;
b_13=b_13+n*delta3;
b_14=b_14+n*delta4;
b_15=b_15+n*delta5;

    end

end

for i = 1:20


    y_1 = 1 /(1 + exp(-x(i) * w_11 - b_11));
    y_2 = 1 /(1 + exp(-x(i) * w_12 - b_12));
    y_3 = 1 /(1 + exp(-x(i) * w_13 - b_13));
    y_4 = 1 /(1 + exp(-x(i) * w_14 - b_14));
    y_5 = 1 /(1 + exp(-x(i) * w_15 - b_15));


    y(i) = (y_1*w_21) + (y_2*w_22) + (y_3*w_23) + (y_4*w_24)+ (y_5*w_25) + b_21;
end

figure, plot(x,d,'kx',x,y,'r*');


