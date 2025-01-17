export genrose, rosenbrock

function genrose(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 1 +
           100 * sum((x[i + 1] - x[i]^2)^2 for i = 1:(n - 1)) +
           sum((x[i] - 1)^2 for i = 1:(n - 1))
  end
  x0 = T.([i / (n + 1) for i = 1:n])
  return ADNLPModels.ADNLPModel(f, x0, name = "genrose_autodiff"; kwargs...)
end

rosenbrock(args...; kwargs...) = genrose(args..., n = 2; kwargs...)
