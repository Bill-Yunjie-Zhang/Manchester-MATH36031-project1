% CubicTaxicabNumn(N) returns the numbers than follows the definition
%   of b = a1^3 + a2^3 = a3^3 + a4^3 when N = 2.
% Requirements:
%   N is a possitive integer
function [a, b] = Slow(n)
    % Setting up pairs for how many pairs of cubic taxicab numbers we have
    %   found already.
    pairs = 0;

    % Setting up N for which number we are checking for being a cubic 
    %   taxicab number.
    N = 1;

    % Checking all the numebrs starting from 1
    while pairs < n 
        a = [];
        N = N + 1;
        pairs = 0;

        % finding pairs of cubic Taxicab Num
        for num1 = 1:nthroot(N, 3)
            if pairs >= n
                break    
            end
        
            % Since we are finding the sum of two cubic number that equals 
            %   to cubic square of num2, we can use the difference between 
            %   N and first number to represent the second number
            cubnum2 = N - num1^3;

            % Calculating the floor of the cubic square. We are calculating
            %   the floor of the cubic square for us to determine if the
            %   cubic square is an integer. 
            num2 = floor(nthroot(cubnum2, 3));

            % first number smaller than the next to prevent over lapping
            if num1 > num2
                break
            end

            % Since by using floor function, we cut the decimal digits.
            %   therefore by checking whether the sum of the cubic of the 
            %   roots of cubic squares is still the original N, we are able
            %   to determine if we find a pair of the taxicab number
            if num1^3 + num2^3 == N
                a = [a num1, num2] % appending new numbers to the end
                pairs = pairs + 1;
                N
            end
        end
    end

    % After we found the number that satisfy, assign b with the number
    b = N;
end