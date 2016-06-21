function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

hx = sigmoid(X*theta);
costOne = y.*log(hx);
costZero = (1-y).*log(1-hx);
regfunc = lambda*sum(theta(2:end).^2)/(2*m);
J = -(sum(costOne+costZero)/m) + regfunc;

%find gradient
deriv_jfunc = zeros(1,size(theta,1));
disp(size(deriv_jfunc));
deriv_jfunc(1)= (hx-y)'*X(:,1);

deriv_jfunc(2:end) = (hx-y)'*X(:,2:end);
grad(1) = ( deriv_jfunc(1)./m );
grad(2:end) = ( deriv_jfunc(2:end)./m ) + (lambda.*theta(2:end)./m)';
% =============================================================
end
