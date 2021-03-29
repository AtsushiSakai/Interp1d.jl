
"Previous interpolation type"
abstract type Previous <: InterpMode end

function interp(xi::Vector{T}, yi::VecOrMat{T}, ::Type{Previous};
                copy=true, sorted=false) where T
    _xi, _yi = _prepare_input(xi, yi, copy, sorted)
    
    function f(x)
        x < _xi[1] && return nothing
        idx = searchsortedlast(_xi, x)
        idx>length(_xi) && (idx = length(_xi))
        return ndims(_yi) == 1 ? _yi[idx] : _yi[:, idx]
    end
        
    return f
end

