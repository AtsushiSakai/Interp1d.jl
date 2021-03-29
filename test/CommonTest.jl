
using Interp1d
using Random

@testset "duplicated exception test" begin
    x = [0.0, 0.0, 3.0/2.0]
    y = [2.0, 1.0, 3.0]

    for mode in INTERP_MODE_LIST
        @test_throws ArgumentError interp(x, y, mode);
    end
end


