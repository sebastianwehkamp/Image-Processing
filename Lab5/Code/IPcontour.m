% Function tracing countr of object
function [X, Y] = IPcontour (f)
    % Calculate starting point and show results as requested
    [X,Y] = IPstartingpoint(f)
    % Trace boundary
    res = bwtraceboundary(f, [X,Y], 'W');
    imshow(f)
    hold on;
    Y = res(:,1);
    X = res(:,2);

    % Plot the contour, note that the color and linewidth can be tweaked
    % below
    plot(X,Y,'w','LineWidth',1);
end
