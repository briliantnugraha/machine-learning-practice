function A = warmUpExercise()
%WARMUPEXERCISE Example function in octave
%   A = WARMUPEXERCISE() is an example function that returns the 5x5 identity matrix
A = [];
% ============= YOUR CODE HERE ==============
% Instructions: Return the 5x5 identity matrix 
%               In octave, we return values by defining which variables
%               represent the return values (at the top of the file)
%               and then set them accordingly. 
m = 5; %number of columns
n=5; %number of rows
temp = []; %used for saving the temp value of matrix elements
for i=1:m
  for j=1:n
    if (i==j)
      temp(i,j) = 1;
    else
      temp(i,j) = 0;
    endif
  endfor
endfor

A = temp;
% ===========================================
endfunction