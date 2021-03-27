using Interp1d
using Test

t = time()

@testset "Interp1d.jl" begin
    # Write your tests here.

    for file in filter(f -> endswith(f, ".jl"), readdir(@__DIR__))
        file in ["runtests.jl"] && continue

        @testset "$(file)" begin
            t = time()
            include(file)
            println("$(file) took $(round(time() - t; digits = 1)) seconds.")
        end
    end
end
