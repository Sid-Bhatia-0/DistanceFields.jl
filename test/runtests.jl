import DistanceFields as DF
import Test

Test.@testset "DistanceFields.jl" begin
    a = fill(-1, 10)
    b = fill(100000.0, 10)
    b[1] = 0
    b[4] = 0
    DF.euclidean_distance_transform!(a, b)
    Test.@test a == [0, 1, 1, 0, 1, 4, 9, 16, 25, 36]
end
