var bc = (n1, n2) => {
    return Math.pow(n1, 3) + Math.pow(n2, 3)
}

var is_T_ = (x, n) => {
    acc = 0

    pairs = []
    for (ii = 1; ii <= Math.floor(Math.pow(x, 1/3)); ii++) {        
        for (jj = 1; jj <= ii; jj++) {
            if (bc(ii, jj) === x) {
                pairs.push([ii, jj])
                console.log(pairs)
                acc++
                if (acc === n) {
                    return pairs
                }
            }
        }
    }

    return false
}

var findxForT_ = (n) => {
    for (kk = 1; kk > 0; kk++) {
        for (ll = 1; ll <= kk; ll++) {
            if (is_T_(bc(kk, ll), n)) {
                return [bc(kk, ll), is_T_(bc(kk, ll), n)]
            }
        }
    }
}

console.log(findxForT_(3))