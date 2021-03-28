using Interp1d

@testset "1 input and 1 output test" begin
    x = [-1.0, 0.0, 3.0/2.0]
    y = [2.0, 1.0, 3.0]
    f = interp(x, y, Nearest);
    @test f(1.0) == 3.0
    @test f(-1.0) == 2.0
    @test f(-2.0) == 2.0
    @test f(-Inf) == 2.0
    @test f(Inf) == 3.0
    @test f(0) == 1.0
end

@testset "1 input and 2 output test" begin
    x = [-1.0, 0.0, 3.0/2.0];
    y = [2.0 1.0 3.0;
        -1.0 -4.4 2.0];
    f = interp(x, y, Nearest);
    @test f(1.0) == [3.0, 2.0]
    @test f(-1.0) == [2.0, -1.0]
    @test f(-2.0) == [2.0, -1.0]
    @test f(-Inf) == [2.0, -1.0]
    @test f(Inf) == [3.0, 2.0]
    @test f(0) == [1.0, -4.4]
end

@testset "copy test" begin
    x = [-1.0, 0.0, 3.0/2.0]
    y = [2.0, 1.0, 3.0]
    f = interp(x, y, Nearest, copy=true);
    y[2] = 10.0
    @test f(0) == 1.0

    y = [2.0, 1.0, 3.0]
    f = interp(x, y, Nearest, copy=false);
    y[2] = 10.0
    @test f(0) == 10.0
end


