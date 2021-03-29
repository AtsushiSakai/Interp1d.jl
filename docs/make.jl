using Interp1d
using PyPlot # for figure generation
using Documenter

DocMeta.setdocmeta!(Interp1d, :DocTestSetup, :(using Interp1d); recursive=true)

makedocs(;
    modules=[Interp1d],
    authors="Atsushi Sakai <asakai.amsl+github@gmail.com> and contributors",
    repo="https://github.com/AtsushiSakai/Interp1d.jl/blob/{commit}{path}#{line}",
    sitename="Interp1d.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://AtsushiSakai.github.io/Interp1d.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "API Reference" => "api_reference.md",
    ],
)

deploydocs(;
    repo="github.com/AtsushiSakai/Interp1d.jl",
)
