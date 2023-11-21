using AltSum
using Test
using Printf
using SpecialFunctions

@testset "AltSum.jl" begin
    # Write your tests here.

    function lns(x, n)
        a(k) = (x^(k+1)/(k+1))
        return alt_sum(a, n)
    end

    function ζ(s, n)
        a(k) = (k + 1)^(-s)
        return alt_sum(a, 10)/(1 - 2^(1 - s))
    end

    x = 1
    n = 10
    @time begin
        got = lns(x, n)
    end
    want = log(1 + x)

    err = abs(got - want)

    @printf("\nln(1 + %.8e) test:\ngot: %.16e\nwant: %.16e\nerror: %.8e\n\n", x, got, want, err)

    s = -1 + im
    n = 10
    @time begin
        got = ζ(s, n)
    end
    want = zeta(s)
    err = abs(got - want)

    @printf("\nRiemman ζ(%s) test:\ngot: %s\nwant: %s\nerror: %.8e\n\n", s, got, want, err)
end
