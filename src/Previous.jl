
"Previous interpolation type"
abstract type Previous <: InterpMode end

"""
    interp(xi::Vector{T}, yi::VecOrMat{T}, ::Type{Previous}; copy=true, sorted=false) where T

Returns a nearest interpolation function `f(x)` based on interpolated points `xi` and `yi`.

If `xi` has a duplicated value, `ArgumentError` is thrown.

If `copy` is true, this function makes internal copies of `xi` and `yi`, otherwise it uses references.

If `sorted` is false, this function sorts `xi` first, otherwise it assumes `xi` is monotonically increasing. 

"""
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

