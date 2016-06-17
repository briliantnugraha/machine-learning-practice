function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters
    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    hx = X*theta; %find hypothesis function result
    %the cost function for theta 1
    jfunc1 = sum(hx-y)/m; %compute h(x) - y for j(theta1) / m
    temp1 = theta(1) - (alpha*jfunc1); %compute theta1 - alpha * the total of z
    
    %the cost function of theta 2
    jfunc2 = sum((hx-y).*X(:,2))/m; %compute sum of (xi*(h(xi) - y for j(theta2)) / m
    temp2 = theta(2) - (alpha*jfunc2); %compute theta2 - alpha * the total of z

    theta(1) = temp1;
    theta(2) = temp2;
    %disp(theta);
    
    % ============================================================
    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
    
    %if the cost function has convergent -
    %(the previous cost function's result and -
    %the current cost function's are same), return and terminate the function
    if(iter > 1 && J_history(iter) == J_history(iter-1))
%        disp('===============optimal================');
%        printf('%d %f\n',iter,J_history(iter));
%        disp('===============optimal================');
         break;
    endif
endfor

endfunction
