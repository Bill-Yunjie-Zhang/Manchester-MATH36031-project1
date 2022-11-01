function [a, b] = Fast(n) 
    kk = 1;
    while kk > 0
        for ll = 1:kk
            x = Is_T_(BC(kk, ll), n, kk, ll);
            if x
                a = BC(kk, ll);
                b = x;
                return
            end
        end
        kk = kk + 1;
    end
end

function [a] = BC(n1, n2)
    a = n1^3 + n2^3;
end

function [a] = Is_T_(x, n, start1, start2)
    acc = 0;

    a = [];
    for ii = start1:floor(nthroot(x, 3))
        for jj = start2:-1:1
            if BC(ii, jj) == x
                a = [a ii, jj]

                start1 = ii;
                start2 = jj;

                acc = acc + 1;
                if acc == n
                    return
                end
            end
        end
    end
    
    a = false;
end