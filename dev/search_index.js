var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = Interp1d","category":"page"},{"location":"#Interp1d","page":"Home","title":"Interp1d","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for Interp1d.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [Interp1d]","category":"page"},{"location":"#Interp1d.Nearest","page":"Home","title":"Interp1d.Nearest","text":"Nearest interpolation type\n\n\n\n\n\n","category":"type"},{"location":"#Interp1d.interp-Union{Tuple{T}, Tuple{Vector{T}, Vector{T}, Type{Nearest}}} where T","page":"Home","title":"Interp1d.interp","text":"interp(xi::Vector{T}, yi::Vector{T}, ::Type{Nearest}) where T\ninterp(xi::Vector{T}, yi::Matrix{T}, ::Type{Nearest}) where T\n\nReturns a nearest interpolation function f(x) based on interpolated points xi and yi.\n\nExamples\n\nThis is a simple example:\n\njulia> using Interp1d\n\njulia> x = [-1.0, 0.0, 3.0/2.0];\n\njulia> y = [2.0, 1.0, 3.0];\n\njulia> f = interp(x, y, Nearest);\n\njulia> f(1.0)\n3.0\n\nThis is a simple example:\n\njulia> using Interp1d\n\njulia> x = [-1.0, 0.0, 3.0/2.0];\n\njulia> y = [ 2.0  1.0 3.0;\n            -1.0 -4.4 2.0];\n\njulia> f = interp(x, y, Nearest);\n\njulia> f(0.0)\n2-element Vector{Float64}:\n  1.0\n -4.4\n\n\n\n\n\n","category":"method"}]
}
