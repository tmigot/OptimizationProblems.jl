# Contributing to OptimizationProblems.jl

First off, thanks for taking the time to contribute!

## Bug reports and discussions

If you think you found a bug, feel free to open an [issue](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/issues).
Focused suggestions and requests can also be opened as issues. Before opening a pull request, start an issue or a discussion on the topic, please.

If you want to ask a question not suited for a bug report, feel free to start a discussion [here](https://github.com/JuliaSmoothOptimizers/Organization/discussions). This forum is for general discussion about this repository and the [JuliaSmoothOptimizers](https://github.com/JuliaSmoothOptimizers), so questions about any of our packages are welcome.

## Adding new problems

We welcome pull requests proposing new problems to the problem set. As a general guideline, a pull request should concern one problem only. We recommend checking existing problems as a template for your new problems.

Here is a to-do list, to help you add new problems:
* Before implementing a new problem, make sure it does not already exist in this repository.
* This package contains implementations using [`JuMP`](https://github.com/jump-dev/JuMP.jl) and [`ADNLPModels`](https://github.com/JuliaSmoothOptimizers/ADNLPModels.jl). New problems should include both implementations. Additionally, a meta provides general information regarding the problem. Therefore, a PR adding a new problem should contain 3 files:
    - `src/ADNLPProblems/name_of_the_problem.jl`
    - `src/PureJuMP/name_of_the_problem.jl`
    - `src/Meta/name_of_the_problem.jl`
* When submitting a problem, please pay particular attention to the documentation. We would like to gather as much information as possible on the provenance of problems, other problem sets where the problems are present, and general information on the problem. 
The documentation should be added to the file in the `PureJuMP` folder.
* New problems can be scalable, see [ADNLPProblems/arglina.jl](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/blob/main/src/ADNLPProblems/arglina.jl) and [PureJuMP/arglina.jl](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/blob/main/src/PureJuMP/arglina.jl) for an example. In that case, the first parameter should have the value `default_nvar` (constant predefined in the module) and be as close as possible to the number of variables.
* A first version of the `meta` can be generated using `generate_meta`. A `String` is returned that can be copy-paste in the `Meta` folder, and then edited.

```julia
    include("test/utils.jl")
    #load your model in the environment
    generate_meta(model, "name_of_the_problem")
```

* The problems modeled with `ADNLPModels` are type-stable, i.e. they all have a keyword argument `type::Val{T} = Val(Float64)` where `T` is the type of the initial guess and the type used by the `NLPModel` API.
