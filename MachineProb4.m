% MACHINE PROBLEM 4
% MATLAB Program for solving the Projectile Motion

% Obtaining inputs
height = input('Enter the initial height of Projectile above the ground (m): ');
velocity = input('Enter the  magnitude of velocity(m/s): ');
angle = input('Enter the angle with respect to the +axis at which the projectile is fired (degrees): ');
axaxis =input('Enter the x-component of acceleration (m/s^2): ');
ayaxis= input('Enter the y-component of acceleration (m/s^2): ');

ANGLE= angle*(pi/180);

% Vertical acceleration cannot be zero, because there would no free fall
if ayaxis == 0 
    error('Error! Vertical Acceleration cannot be zero')
end 
% Solving for the distance     
distance = sqrt((velocity*sin(ANGLE))^2 - 4*(1/2*ayaxis)*height);
       
% Solving for the final time
tmax = (-velocity*sin(ANGLE)+distance)/ayaxis;
    
% Solving for the time
time= linspace(0,tmax);
    
if tmax <= 0
    tmax = (-velocity*sin(ANGLE)-distance)/ayaxis;

% Solving for the time
time= linspace(0,tmax);
    
% Solving for the Non-Ideal x values
x = velocity*cos(ANGLE)*(time) + (1/2)*(axaxis)*((time).^2);

% Solving for the Ideal x values
xIdeal= velocity*cos(ANGLE)*time;

% Solving for the Non-Ideal y values
y = height+velocity*sin(ANGLE)*(time) + (1/2)*(ayaxis)*((time).^2);

end

% Plotting the Projectile
figure
plot(x,y, 'k')

hold on 
plot(xIdeal,y, '--r')

legend('Non-Ideal Motion','Ideal Motion')
title('Projectile Motion')
xlabel('Range')
ylabel('Height')
grid on
