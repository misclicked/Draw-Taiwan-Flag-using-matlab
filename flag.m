n = 720;
m = 480;
I=uint8(zeros(m, n, 3));
%紅地
I(:,:,1) = 242;
I(:,:,2) = 0;
I(:,:,3) = 0;
%青天
I(1:m/2,1:n/2,1) = 0;
I(1:m/2,1:n/2,2) = 41;
I(1:m/2,1:n/2,3) = 204;
%白日，星星
R = n/8;
r = n/16;
circle_x = n/4;
circle_y = m/4;
pos_star = [];
for i=1:12
    pos_star = [pos_star R*cos(pi/2+(pi/6)*i)+circle_x];
    pos_star = [pos_star R*sin(pi/2+(pi/6)*i)+circle_y];
    pos_star = [pos_star r*cos(pi/2+pi/12+(pi/6)*i)+circle_x];
    pos_star = [pos_star r*sin(pi/2+pi/12+(pi/6)*i)+circle_y];
end
I = insertShape(I, 'FilledPolygon', pos_star, 'Color', 'white', 'Opacity', 1);
%白日，藍內圈
br = round(r+r/15);
I = insertShape(I, 'FilledCircle', [circle_x circle_y br], 'Color', [0 41 204], 'Opacity', 1);
%白日，白內圈
I = insertShape(I, 'FilledCircle', [circle_x circle_y r], 'Color', 'white', 'Opacity', 1);
figure, imshow(I);