module DistanceFields

function euclidean_distance_transform!(out::AbstractVector, f::AbstractVector)
    n = length(f)
    k = 1
    v = Array{Int}(undef, n)
    v[1] = 1
    z = Array{Float64}(undef, n + 1)
    z[1] = -Inf
    z[2] = Inf

    for q in 2:n
        @label compute_s
        s = ((f[q] + q ^ 2) - (f[v[k]] + v[k] ^ 2)) / (2 * (q - v[k]))
        if s <= z[k]
            k = k - 1
            @goto compute_s
        else
            k = k + 1
            v[k] = q
            z[k] = s
            z[k + 1] = Inf
        end
    end

    k = 1

    for q in 1:n
        while z[k + 1] < q
            k = k + 1
        end

        out[q] = (q - v[k]) ^ 2 + f[v[k]]
    end

    return nothing
end

end
