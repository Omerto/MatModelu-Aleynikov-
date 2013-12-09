x1 = 1;
 x2 = 1.2;
h = 0.2;
d = 0.001;

k = 1;
k_max = 500;

x1trace = [x1];
x2trace = [x2];
i = 2;

while k < k_max
    gr1 = 2 * (200 * x1^3 - 200 * x1 * x2 + x1 -1);
    x1 = x1 - h * gr1;
    
    x1trace(i) = x1;
    x2trace(i) = x2;
    i = i + 1;
    
    gr2 = 200 * (x2 - x1 ^ 2);
    x2 = x2 - h * gr2;
    
    x1trace(i) = x1;
    x2trace(i) = x2;
    i = i + 1;
    
    if sqrt(gr1 ^ 2 + gr2 ^ 2) <= d;
        break;
    end;
    k = k + 1;
end;
% ���������� ������� 
x = -5:0.01:5; 
y = -5:0.01:5; 
[X, Y] = meshgrid(x, y); 
Z = 100 * (Y - X.^2).^2 + (1 - X).^2; 
figure
mesh(X,Y,Z);
figure
[C, h] = contour(X, Y, Z, 150); 
%clabel(C, h); 
% ����������� ����� ������
hold on; 
plot(x1trace, x2trace, '-'); 
% �������������� ����� �� ������ 
text(x1trace(1), x2trace(1), 'M0'); 
text(1,1,'�MINIMUM(1,1)')
% ����� ������� �� ������ 
text(x1 - 5, x2, ... 
char(['x1 = ' num2str(x1)], ... 
['x2 = ' num2str(x2)], ... 
['k = ' num2str(k)]));



