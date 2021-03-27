using Interp1d

@testset "1 input and 1 output test" begin
    x = [-1.0, 0.0, 3.0/2.0]
    y = [2.0, 1.0, 3.0]
    f = interp(x, y, Nearest);
    @test f(1.0) == 3.0
end
