clear all
close all
clc

num = 2; % number of particles
h = 10.^-15;
bound = 4.*10.^-9./2;
eps = 1.66.*10.^-21;
sig = 3.4.*10.^-10;
rm = 2.^(1./6).*sig;
rc = 2.5.*sig;
m = 39.948./(6.022.*10.^23).*10.^-3;
t = 0;
space = 1000;

pos = zeros(num,2);
vlc = zeros(num,2);
foc = zeros(num,2);

% (a) change num to 2
pos(1,1) = 5.*10.^-10./-2;
pos(2,1) = 5.*10.^-10./2;

% % (b) change num to 3
% pos(1,2) = 3.8164.*10.^-10 ./-2;
% pos(2,2) = 3.8164.*10.^-10 ./ 2;
% pos(3,1) = -bound;
% vlc(3,1) = 300;

% % (c) change num to 2
% pos(1,1) = 5.*10.^-10./-2;
% pos(2,1) = 5.*10.^-10./2;
% vlc(1,1) = 15.8;
% vlc(2,1) = -17.67.*cos(26.56./180.*pi);
% vlc(2,2) = 17.67.*sin(26.56./180.*pi);

cnt = 1;
for loop=1:10.^-10./h+1
    if(rem(loop,space)==1)
% FOR TRAJECTORY
        figure(1)
        clf
        for i=1:num
           plot(pos(i,1),pos(i,2),'b*')
           xlabel('(m)')
           ylabel('(m)')
           hold on
        end
        axis([-bound bound -bound bound])
        frames(cnt) = getframe(gcf);
        cnt = cnt + 1;
        
% FOR TOTAL ENERGY
        Ek = 0;
        t = t + space.*h;
        for i=1:num
            Ek = Ek + 1./2.*m.*(vlc(i,1).^2+vlc(i,2).^2);
        end
        Ep = 0.0;
        for i=1:num
            for j=1:num
                if(i==j) 
                    continue
                end
                dist2 = (pos(i,1)-pos(j,1)).^2+(pos(i,2)-pos(j,2)).^2;
                if(dist2 <= rc.^2)
                    dist2i = sig.^2./dist2;
                    Ep = Ep - eps.*(dist2i.^6-2.*dist2i.^3);
                end
            end
        end
        figure(2), hold on
        plot(t,Ek+Ep,'b.')
        axis([0 10.^-10 0 inf])
        xlabel('seconds')
        ylabel('J')

   end
    
   for i=1:num
       foc(i,1) = 0;
       foc(i,2) = 0;
       for j=1:num
           if(i~=j)
                distx = pos(j,1)-pos(i,1);
                disty = pos(j,2)-pos(i,2);
                dist = (distx.^2+disty.^2).^(1./2);
                F_SCALAR = 12.*eps./rm.*((rm./dist).^13-(rm./dist).^7);
                foc(i,1) = foc(i,1) + F_SCALAR.*distx./dist;
                foc(i,2) = foc(i,2) + F_SCALAR.*disty./dist;
           end
       end
       
       for k=1:2
            pos(i,k) = pos(i,k) + h.*vlc(i,k) + h.^2./m./2.*foc(i,k);
            vlc(i,k) = vlc(i,k) + h./m.*foc(i,k);
            if(abs(pos(i,k))>bound)
                if(pos(i,k)>bound)
                    pos(i,k) = 2.*bound-pos(i,k);
                end
                if(pos(i,k)<-bound)
                    pos(i,k) = 2.*-bound-pos(i,k);
                end
                vlc(i,k) = -vlc(i,k);
            end
       end
   end
end

dt=0.05;
for i=1:length(frames)
    [image,map]=frame2im(frames(i));
    [im,map2]=rgb2ind(image,128);
    if i==1
        imwrite(im,map2,'move_pic.gif','gif','writeMode','overwrite','delaytime',dt,'loopcount',inf);
    else
        imwrite(im,map2,'move_pic.gif','gif','writeMode','append','delaytime',dt);
    end
end