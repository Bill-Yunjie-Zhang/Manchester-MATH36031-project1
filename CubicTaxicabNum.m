% CubicTaxicabNum(N) returns the four numbers than follows the definition
%   of N = a^3 + b^3 = c^3 + d^3, if N is not a cubic taxicab number then
%   check each one after N.
% Requirements:
%   N is a possitive integer
function [a, b, c, d, M] = CubicTaxicabNum(N)
    % Use pairNum as an indicator as to how many pairs we found
    pairNum = 0;

    % Since the number will be the same if we iterate over nthroot(N, 3), 
    %   we can cut half of the time by setting limit of the iteration to 
    %   nthroot(N, 3).
    for num1 = 1:nthroot(N, 3)
        % If we found 2 pairs already, exit the loop
        if pairNum == 2
            break
        end

        % Since we are finding the sum of two cubic number that equals to 
        %   cubic square of num2, we can use the difference between N and 
        %   first number to represent the second number
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
            % When we find two pairs of taxicab number!
            if pairNum == 1
                c = num1;
                d = num2;
                M = N;
                pairNum = pairNum + 1;
                break
            end

            % When we find one pair of taxicab number!
            if pairNum == 0
                a = num1;
                b = num2;
                pairNum = pairNum + 1;
            end
        end
    end

    %% Recursion: If there are less than 2 pairs of number for N, we 
    %       iterate the the function CabicTaxicabNum with the input N + 1,
    %       for checking each number after the N
    if pairNum < 2
        [a, b, c, d, M] = CubicTaxicabNum(N + 1);
    end
end