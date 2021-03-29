using Interp1d
using Random

@testset "1 input and 1 output test" begin
    x = [-1.0, 0.0, 3.0/2.0]
    y = [2.0, 1.0, 3.0]
    f = interp(x, y, Previous);
    @test f(1.0) == 1.0
    @test f(-1.0) == 2.0
    @test f(-2.0) === nothing
    @test f(-Inf) === nothing
    @test f(Inf) == 3.0
    @test f(0) == 1.0
end

@testset "1 input and 2 output test" begin
    x = [-1.0, 0.0, 3.0/2.0];
    y = [2.0 1.0 3.0;
        -1.0 -4.4 2.0];
    f = interp(x, y, Previous);
    @test f(1.0) == [1.0, -4.4]
    @test f(-1.0) == [2.0, -1.0]
    @test f(-2.0) === nothing
    @test f(-Inf) === nothing
    @test f(Inf) == [3.0, 2.0]
    @test f(0) == [1.0, -4.4]
end

@testset "copy test" begin
    x = [-1.0, 0.0, 3.0/2.0]
    y = [2.0, 1.0, 3.0]
    f = interp(x, y, Previous, copy=true);
    y[2] = 10.0
    @test f(0) == 1.0

    y = [2.0, 1.0, 3.0]
    f = interp(x, y, Previous, copy=false);
    y[2] = 10.0
    @test f(0) == 10.0
end

@testset "sort test" begin
    x = [-1.0, 0.0, 3.0/2.0]
    y = [2.0, 1.0, 3.0]

    idxs = randperm(length(x))
    x=x[idxs]
    y=y[idxs]
    f = interp(x, y, Previous);
    @test f(1.0) == 1.0
    @test f(-1.0) == 2.0
    @test f(-2.0) === nothing
    @test f(-Inf) === nothing
    @test f(Inf) == 3.0
    @test f(0) == 1.0
end


