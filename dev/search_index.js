var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = Interp1d","category":"page"},{"location":"#Interp1d","page":"Home","title":"Interp1d","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for Interp1d.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [Interp1d]","category":"page"},{"location":"#Interp1d.Nearest","page":"Home","title":"Interp1d.Nearest","text":"Nearest interpolation type\n\n\n\n\n\n","category":"type"},{"location":"#Interp1d.Previous","page":"Home","title":"Interp1d.Previous","text":"Previous interpolation type\n\n\n\n\n\n","category":"type"},{"location":"#Interp1d.interp-Union{Tuple{T}, Tuple{Vector{T}, VecOrMat{T}, Type{Nearest}}} where T","page":"Home","title":"Interp1d.interp","text":"interp(xi::Vector{T}, yi::VecOrMat{T}, ::Type{Nearest}; copy=true, sorted=false) where T\n\nReturns a nearest interpolation function f(x) based on interpolated points xi and yi.\n\nIf xi has a duplicated value, ArgumentError is thrown.\n\nIf copy is true, this function makes internal copies of xi and yi, otherwise it uses references.\n\nIf sorted is false, this function sorts xi first, otherwise it assumes xi is monotonically increasing. \n\nExamples\n\nThis is a simple interpolation example:\n\njulia> using Interp1d\n\njulia> xi = [-1.0, 0.0, 3.0/2.0];\n\njulia> yi = [2.0, 1.0, 3.0];\n\njulia> f = interp(xi, yi, Nearest);\n\njulia> f(1.0)\n3.0\n\nyi can be matrix for multi univerate interpolations. The number of rows of yi must be equal to the length of xi.\n\njulia> using Interp1d\n\njulia> xi = [-1.0, 0.0, 3.0/2.0];\n\njulia> yi = [ 2.0  1.0 3.0;\n             -1.0 -4.4 2.0];\n\njulia> f = interp(xi, yi, Nearest);\n\njulia> f(0.0)\n2-element Vector{Float64}:\n  1.0\n -4.4\n\n\n\n\n\n","category":"method"},{"location":"#Interp1d.interp-Union{Tuple{T}, Tuple{Vector{T}, VecOrMat{T}, Type{Previous}}} where T","page":"Home","title":"Interp1d.interp","text":"interp(xi::Vector{T}, yi::VecOrMat{T}, ::Type{Previous}; copy=true, sorted=false) where T\n\nReturns a nearest interpolation function f(x) based on interpolated points xi and yi.\n\nIf xi has a duplicated value, ArgumentError is thrown.\n\nIf copy is true, this function makes internal copies of xi and yi, otherwise it uses references.\n\nIf sorted is false, this function sorts xi first, otherwise it assumes xi is monotonically increasing. \n\n\n\n\n\n","category":"method"}]
}
