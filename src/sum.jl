function alt_sum(a::Function, n::Integer)::Complex
    d = (3 + √8)^n
    d = (d + 1/d)/2
    b = -1; c = -d; s = 0

    for k in 0:(n-1)
        c = b - c
        s = s + c*a(k)
        b = (k + n)*(k - n)*b/((k + 1/2)*(k + 1))
    end

    return s/d
end
