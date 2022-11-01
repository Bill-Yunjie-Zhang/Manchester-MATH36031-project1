%% CubicTaxicabNum(n) takes n as in Tn and returns Tn
%   Tn is defined as the smallest integer that can bee expressesd as the 
%   sum of two positive integers cubed in n distinct ways.
% Returns: for the return I'm returning the cubic square of the cube 
%   numbers in b, and a is the CubicTaxicabNum 
function [a, b] = CubicTaxicabNumn(n) 
    % This question is done with a different logic than the previous
    %   quesiton, since it is too slow for iterating over the M in the
    %   expression M = a^3 + b^3 = c^3 + d^3, thus for optimization, I am
    %   now iterating over a & b using nested loops.
    kk = 1;
    while kk > 0
        for ll = 1:kk
            % Setting x as the either a boolean or a list for cubic square 
            %   of the cube numbers
            x = Is_T_(BC(kk, ll), n, kk, ll);
            
            % Check if the kk^3 + ll^3 is Tn
            if x
                % Setting a as the CubicTaxicabNum
                a = BC(kk, ll);

                % Setting b as the list for cubic square of the cube 
                %   numbers
                b = x;
                return
            end
        end
        kk = kk + 1;
    end
end

%% BC(n1, n2) Returns the sum of the cubic square of n1 and n2
% Requirements:
%   n1 > 0
%   n2 > 0
function [a] = BC(n1, n2)
    a = n1^3 + n2^3;
end

%% Is_T_(x, n) Checks whether x is Tn
%   Tn is defined as the smallest integer that can bee expressesd as the 
%   sum of two positive integers cubed in n distinct ways.
% Requirement:
%   x > 0
%   n > 0
% Examples:
%   T1 = 2 = 1^3 + 1^3
%   T2 = 1792 = 1^3 + 12^3 = 9^3 + 10^3
function [a] = Is_T_(x, n, start1, start2)
    acc = 0;

    a = [];

    % Iterating from start1 to the floor of the cubic root of x
    for ii = start1:floor(nthroot(x, 3))
        % Iterating from start2 to 1
        for jj = start2:-1:1
            % Checks if ii^3 + jj^3 is equal to the desired number
            if BC(ii, jj) == x
                a = [a ii, jj];

                % Setting the new start1 and start2 for quicker iteration
                start1 = ii;
                start2 = jj;

                acc = acc + 1;

                % if we found the desired pair, return
                if acc == n
                    return
                end
            end
        end
    end
    
    a = false;
end