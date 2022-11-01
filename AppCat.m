% AppCat(N) returns the best pair of integers p and q, such that the
%   absolute value of (p/q - C) is the smallest amongst all positive 
%   integers and p + q is less than or equal to N
% Requirements:
%   N is a possitive integer greater than 1
%   return the smallest p + q set
function [p, q] = AppCat(N)
    % Double precision Catalan Constant
    catconst = double(catalan);

    % Initializing variables with a max value
    smallest = realmax; p = realmax; q = realmax;

    % Since Catalan Constant is less than 1 and p + q <= N, therefore
    %   optimizing the for loop by setting N/2 as the upper limit for ii
    for ii = 1:N/2
        % Since Catalan Constant is less than 1, jj should be greater
        %   than or equal to ii. Also, since p + q <= N, we are setting
        %   the upeper limit to N - ii
        for jj = ii:N-ii

            % Finding the number that is closest to the Catalan Constant 
            if abs(ii/jj - catconst) < smallest
                smallest = abs(ii/jj - catconst);

                p = ii;
                q = jj;
            end

            % When encountered a same number, since we want to find the 
            %   smallest p + q, check which one ii + jj is smaller.
            if abs(ii/jj - catconst) == smallest
                if p + q > ii + jj
                    smallest = abs(ii/jj - catconst);
                    p = ii;
                    q = jj;
                end
            end
        end
    end
end